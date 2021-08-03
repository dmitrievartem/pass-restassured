package steps;

import cucumber.api.java.Before;
import cucumber.api.java.BeforeStep;

public class Hooks {

    @BeforeStep
    public void beforeStep() {
        System.out.println("хуки хуки хуки хуки хуки ");

    }

    @Before
    public void logBeforeScenario() {
        System.out.println("ХУКИ ХУКИ ХУКИ ХУКИ ХУКИ ");
    }
}

