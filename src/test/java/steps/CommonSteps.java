package steps;

import cucumber.api.java.ru.Когда;
import cucumber.api.java.ru.То;
import executors.BaseExecutor;
import io.restassured.response.Response;
import org.json.simple.JSONObject;

import java.util.Map;

import static io.restassured.RestAssured.*;

public class CommonSteps extends BaseExecutor {

    public Response response;

    @Когда("^выполнен GET запрос на URL \"(.*)\"$")
    public void getRequest(String url) {
        response = get(url);
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
                post(url).
                then().
                extract().
                response();
    }

    @То("^вывод ответа$")
    public void printResponse() {
        System.out.println("RESPONSE:");
        System.out.println(response.getBody().asString());
    }

    @То("^код ответа \"(.*)\"$")
    public void statusCode(Integer expectedCode) {
        response.then().statusCode(expectedCode);
    }
}