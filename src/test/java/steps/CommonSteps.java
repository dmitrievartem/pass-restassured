package steps;

import cucumber.api.java.ru.Когда;
import cucumber.api.java.ru.Тогда;
import executors.BaseExecutor;

import static io.restassured.RestAssured.*;

public class CommonSteps extends BaseExecutor {

    @Тогда("^код ответа сервера (\\d+)$")
    public void ответНаЗапросПрофиляИмеетСтатусКод(int statusCode) {
        currentResponse.then().statusCode(statusCode);
    }

    @Когда("^выполнен GET запрос на URL \"(.*)\"$")
    public void getRequest(String url) {
        get(url).then().statusCode(200);
    }

}
