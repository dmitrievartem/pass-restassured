package steps;

import com.github.javafaker.Faker;
import cucumber.api.java.ru.Когда;
import cucumber.api.java.ru.То;
import io.restassured.filter.log.ResponseLoggingFilter;
import io.restassured.response.Response;
import org.json.simple.JSONObject;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import static io.restassured.RestAssured.*;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

public class CommonSteps {
    public Response response;
    public String guid;
    public Map<String, String> requestParamsWithGuid;

    @Когда("^выполнен GET запрос на URL \"(.*)\"$")
    public void getRequest(String url) {
        response = get(url);
    }

    @Когда("^выполнен GET запрос на URL \"(.*)\" с сохраненным GUID$")
    public void getRequestWithGuid(String url) {
        response = get(url.concat(guid));
    }

    @Когда("^выполнен POST запрос на URL \"(.*)\" с параметрами из таблицы$")
    public void postRequestWithParameters(String url, Map<String, String> params) {
        JSONObject requestParams = new JSONObject();
        for (Map.Entry<String, String> param : params.entrySet()) {
            requestParams.put(param.getKey(), param.getValue());
        }
        response = given().
                contentType("application/json").
                body(requestParams.toJSONString()).
                when().
//                log().all().
                post(url);
        Map<String, String> createdGuid = new HashMap<>();
        createdGuid.put("guid", response.jsonPath().get("guid").toString());
        createdGuid.putAll(params);
        requestParamsWithGuid = createdGuid;
    }

    @Когда("^выполнен POST запрос на URL \"(.*)\" со сгенерированными случайными параметрами$")
    public void postRequestWithGeneratedParameters(String url) {
        JSONObject requestParams = new JSONObject();
        Map<String, String> params = createRequestParams();
        for (Map.Entry<String, String> param : params.entrySet()) {
            requestParams.put(param.getKey(), param.getValue());
        }
        response = given().
                contentType("application/json").
                body(requestParams.toJSONString()).
                when().
                post(url);
        Map<String, String> createdGuid = new HashMap<>();
        createdGuid.put("guid", response.jsonPath().get("guid").toString());
        createdGuid.putAll(params);
        requestParamsWithGuid = createdGuid;
    }

    @Когда("^выполнен PUT запрос на URL \"(.*)\" со сгенерированными случайными параметрами и сохраненным GUID$")
    public void putRequestWithParameters(String url) {
        url = url.concat(guid);
        JSONObject requestParams = new JSONObject();
        Map<String, String> params = createRequestParams();
        for (Map.Entry<String, String> param : params.entrySet()) {
            requestParams.put(param.getKey(), param.getValue());
        }
        response = given().
                contentType("application/json").
                body(requestParams.toJSONString()).
                when().
                put(url);
        Map<String, String> createdGuid = new HashMap<>();
        createdGuid.put("guid", guid);
        createdGuid.putAll(params);
        requestParamsWithGuid = createdGuid;
    }

    @Когда("^выполнен DELETE запрос на URL \"(.*)\" с сохраненным GUID$")
    public void deleteRequestWithSavedGuid(String url) {
        url = url.concat(guid);
        response = delete(url);
    }

    @То("^параметры в ответе соответствуют отправленным$")
    public void responseMatchWithRequestParams() {
        String responseValue;
        String expectedValue;
        for (Map.Entry<String, String> param : requestParamsWithGuid.entrySet()) {
            responseValue = response.jsonPath().get(param.getKey()).toString();
            expectedValue = param.getValue();
            assertThat(responseValue, equalTo(expectedValue));
        }
    }

    @То("^код ответа \"(.*)\"$")
    public void statusCode(Integer expectedCode) {
        response.then().statusCode(expectedCode);
    }

    @То("^сохранен GUID из ответа$")
    public void saveResponseGuid() {
        guid = response.jsonPath().get("guid").toString();
        System.out.println("SAVED GUID:");
        System.out.println(guid);
    }

    @То("^вывод ответа$")
    public void printResponse() {
        System.out.println("RESPONSE:");
        System.out.println(response.getBody().asString());
    }

    @Когда("^создание нового пропуска$")
    public void createPass() {
        String url = "http://localhost:8080/pass/";

        postRequestWithParameters(url, createRequestParams());
        saveResponseGuid();
        getRequestWithGuid(url);
        responseMatchWithRequestParams();
    }

    @Когда("^удаление пропуска по сохраненному GUID$")
    public void deletePassWithGuid() {
        String url = "http://localhost:8080/pass/";
        deleteRequestWithSavedGuid(url);
        statusCode(200);
        getRequestWithGuid(url);
        statusCode(404);
    }

    public Map<String, String> createRequestParams() {
        Faker faker = new Faker(new Locale("ru_RU"));
        Map<String, String> requestParams = new HashMap<>();
        requestParams.put("personName", faker.name().firstName());
        requestParams.put("personSurname", faker.name().lastName());
        requestParams.put("personPatronymic", faker.funnyName().name());
        requestParams.put("passportNumber", faker.number().digits(10));

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        LocalDate date = faker.date().birthday().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        requestParams.put("dateFrom", date.format(formatter));
        date = faker.date().birthday().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        requestParams.put("dateTo", date.format(formatter));
        return  requestParams;
    }
}