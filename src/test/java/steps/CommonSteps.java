package steps;

import com.github.javafaker.Faker;
import cucumber.api.java.ru.Когда;
import cucumber.api.java.ru.То;
import io.qameta.allure.restassured.AllureRestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.filter.log.LogDetail;
import io.restassured.response.Response;

import io.restassured.specification.RequestSpecification;
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
    private final RequestSpecification requestSpecification = new RequestSpecBuilder()
            .log(LogDetail.ALL)
            .addFilter(new AllureRestAssured())
            .build();

    @Когда("^выполнен GET запрос на URL \"(.*)\"$")
    public void getRequest(String url) {
        response =
                given().
                spec(requestSpecification).
                get(url);
    }

    @Когда("^выполнен GET запрос на URL \"(.*)\" с сохраненным GUID$")
    public void getRequestWithGuid(String url) {
        response =
                given().
                spec(requestSpecification).
                get(url.concat(guid));
    }

    @Когда("^выполнен POST запрос на URL \"(.*)\" с параметрами из таблицы$")
    public void postRequestWithParameters(String url, Map<String, String> params) {
        JSONObject requestParams = new JSONObject();
        for (Map.Entry<String, String> param : params.entrySet()) {
            requestParams.put(param.getKey(), param.getValue());
        }
        response =
                given().
                spec(requestSpecification).
                contentType("application/json").
                body(requestParams.toJSONString()).
                when().
                post(url);
        Map<String, String> createdPass = new HashMap<>();
        createdPass.put("guid", response.jsonPath().get("guid").toString());
        createdPass.putAll(params);
        requestParamsWithGuid = createdPass;
    }

    @Когда("^выполнен POST запрос на URL \"(.*)\" со сгенерированными случайными параметрами$")
    public void postRequestWithGeneratedParameters(String url) {
        JSONObject requestParams = new JSONObject();
        Map<String, String> params = createRequestParams();
        for (Map.Entry<String, String> param : params.entrySet()) {
            requestParams.put(param.getKey(), param.getValue());
        }
        response =
                given().
                spec(requestSpecification).
                contentType("application/json").
                body(requestParams.toJSONString()).
                when().
                post(url);
        Map<String, String> createdPass = new HashMap<>();
        createdPass.put("guid", response.jsonPath().get("guid").toString());
        createdPass.putAll(params);
        requestParamsWithGuid = createdPass;
    }

    @Когда("^выполнен PUT запрос на URL \"(.*)\" со сгенерированными случайными параметрами и сохраненным GUID$")
    public void putRequestWithGeneratedParameters(String url) {
        url = url.concat(guid);
        JSONObject requestParams = new JSONObject();
        Map<String, String> params = createRequestParams();
        for (Map.Entry<String, String> param : params.entrySet()) {
            requestParams.put(param.getKey(), param.getValue());
        }
        response =
                given().
                spec(requestSpecification).
                contentType("application/json").
                body(requestParams.toJSONString()).
                when().
                put(url);
        Map<String, String> createdPass = new HashMap<>();
        createdPass.put("guid", guid);
        createdPass.putAll(params);
        requestParamsWithGuid = createdPass;
    }

    @Когда("^выполнен PUT запрос на URL \"(.*)\" с параметрами из таблицы и сохраненным GUID$")
    public void putRequestWithParametersFromTable(String url, Map<String, String> params) {
        url = url.concat(guid);
        JSONObject requestParams = new JSONObject();
        for (Map.Entry<String, String> param : params.entrySet()) {
            requestParams.put(param.getKey(), param.getValue());
        }
        response =
                given().
                spec(requestSpecification).
                contentType("application/json").
                body(requestParams.toJSONString()).
                when().
                put(url);
        Map<String, String> createdPass = new HashMap<>();
        createdPass.put("guid", guid);
        createdPass.putAll(params);
        requestParamsWithGuid = createdPass;
    }


    @Когда("^выполнен DELETE запрос на URL \"(.*)\" с сохраненным GUID$")
    public void deleteRequestWithSavedGuid(String url) {
        url = url.concat(guid);
        response =
                given().
                spec(requestSpecification).
                delete(url);
    }

    @То("^параметры в ответе соответствуют отправленным$")
    public void responseMatchWithRequestParams() {
        String responseValue;
        String expectedValue;
        for (Map.Entry<String, String> param : requestParamsWithGuid.entrySet()) {
            try {
                responseValue = response.jsonPath().get(param.getKey()).toString();
                expectedValue = param.getValue();
                assertThat(responseValue, equalTo(expectedValue));
            } catch (NullPointerException e) {
//                System.out.println("NO VALUE FOR \"" + param.getKey() + "\"");
            }
        }
    }

    @То("^параметр guid в ответе равен сохраененному guid$")
    public void responseGuidMatchWithSavedGuid() {
        String responseValue = response.jsonPath().get("guid").toString();
        assertThat(responseValue, equalTo(guid));
    }

    @То("^код ответа \"(.*)\"$")
    public void statusCode(Integer expectedCode) {
        response.then().statusCode(expectedCode);
    }

    @То("^сохранен GUID из ответа$")
    public void saveResponseGuid() {
        guid = response.jsonPath().get("guid").toString();
//        System.out.println("SAVED GUID:" + guid);
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

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = faker.date().birthday().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        requestParams.put("dateFrom", date.format(formatter));
        date = faker.date().birthday().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        requestParams.put("dateTo", date.format(formatter));
        return  requestParams;
    }
}