package stepDefinations;

import org.openqa.selenium.WebDriver;

import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.driver.CapabilitiesGenerator;
import net.prodigylabs.handlers.ScreenshotHandler;
import net.prodigylabs.handlers.WebElementHandler;

public class MeedBaseTest {
	
	public WebDriver driver = null;
	ScreenshotHandler screenshot = null;
	WebElementHandler webelementHandler = null;
	String sName = null;
	String browser = ObjectRepository.getString("global.browser.name");
	
	public MeedBaseTest() {
		driver = CapabilitiesGenerator.getInstance().launchBrowser(browser);
		driver.manage().window().maximize();
		System.err.println("Inside VAST Base Test");
		webelementHandler = new WebElementHandler(driver);
		screenshot = new ScreenshotHandler(driver);
		
	}

}
