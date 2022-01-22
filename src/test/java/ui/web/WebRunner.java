package ui.web;

import com.intuit.karate.driver.chrome.Chrome;
import com.intuit.karate.junit5.Karate;
import cucumber.api.java.After;
import cucumber.api.java.Before;

public class WebRunner {

    @Karate.Test
    Karate testWebUiTest() {
        System.setProperty("karate.env", "test");
        return new Karate().feature("zenityIntranet").relativeTo(getClass());
    }
}
