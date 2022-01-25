import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Reportable;
import net.masterthought.cucumber.json.support.Status;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class RunAllTest {
    
    // this will run all *.feature files that exist in sub-directories in parallel
    @Test
    public void testAll() {
        System.setProperty("karate.env", "test");
        Results results = Runner.parallel(getClass(), 5, "target/surefire-reports");
        Assertions.assertTrue(results.getFailCount() == 0, results.getErrorMessages());
    }

    @AfterAll
    public static void makeCucumberReport() {
        File reportOutputDirectory = new File("target");
        List<String> jsonFiles = new ArrayList<>();
        jsonFiles.add("C:\\Users\\roose\\karate_demo\\target\\surefire-reports\\ui.web.ConfigDemo1.json");
        jsonFiles.add("C:\\Users\\roose\\karate_demo\\target\\surefire-reports\\ui.web.FirstTest.json");
        jsonFiles.add("C:\\Users\\roose\\karate_demo\\target\\surefire-reports\\ui.web.GetTestApi.json");
        jsonFiles.add("C:\\Users\\roose\\karate_demo\\target\\surefire-reports\\api.users.json");
        jsonFiles.add("C:\\Users\\roose\\karate_demo\\target\\surefire-reports\\api.usersFail.json");

        String projectName = "Karate demo";
        Configuration configuration = new Configuration(reportOutputDirectory, projectName);
        // do not make scenario failed when step has status SKIPPED
        configuration.setNotFailingStatuses(Collections.singleton(Status.SKIPPED));

// optionally add metadata presented on main page via properties file
//        List<String> classificationFiles = new ArrayList<>();
//        classificationFiles.add("properties-1.properties");
//        classificationFiles.add("properties-2.properties");
//        configuration.addClassificationFiles(classificationFiles);

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
        Reportable result = reportBuilder.generateReports();
    }

}
