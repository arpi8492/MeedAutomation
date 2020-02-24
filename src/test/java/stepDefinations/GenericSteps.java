package stepDefinations;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.sound.midi.SysexMessage;

import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import com.cucumber.listener.Reporter;
import com.gargoylesoftware.htmlunit.javascript.host.Element;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.interactions.touch.TouchActions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebElement;

import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.java.After;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import io.appium.java_client.*;
import io.appium.java_client.android.Activity;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.StartsActivity;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.appium.java_client.touch.offset.PointOption;
import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.driver.CapabilitiesGenerator;
import net.prodigylabs.handlers.ScreenshotHandler;
import net.prodigylabs.handlers.VerificationHandler;
import net.prodigylabs.handlers.WebElementHandler;
import net.prodigylabs.test.BaseTest;
import net.prodigylabs.utils.JiraXrayUtils;

import org.apache.commons.lang.StringUtils;
import org.junit.Assert;

public class GenericSteps extends BaseTest{

	//public AndroidDriver<MobileElement> driver;
	 WebDriver driver;

    DesiredCapabilities caps = new DesiredCapabilities();
	ScreenshotHandler screenshot = null;
	WebElementHandler webelementHandler = null;
	String sName = null;
	public WebDriverWait wait = null;
	JavascriptExecutor jse;
	
	TouchActions action ;
	TouchAction appaction ;
	Activity activity;

	private String checkingBalance = null;
	private String savingsBalance = null;
	private String locBalance = null;
	private String fullPaymentloc = null;
	private String minimumPaymentloc = null;
	
	@Before
	public void setup(Scenario scenario) throws Exception {		
		//System.out.println("Executing Before of Step Definition");
		sName=scenario.getName();

	}
	
	//------------------LAUNCHING APP---------------------
    @Given("^user launches the app in \"(.*?)\" device$")
    public void user_launches_the_app_in_device(String platform) throws Throwable {    	 
       
    	
    	driver = CapabilitiesGenerator.getInstance().launchApp(platform);
        screenshot = new ScreenshotHandler(driver);
        webelementHandler = new WebElementHandler(driver);
        jse = (JavascriptExecutor) driver;
        appaction=new TouchAction((PerformsTouchActions) driver);
		wait = new WebDriverWait(driver, ObjectRepository.getLong("global.driver.wait"));
		wait.until(ExpectedConditions.invisibilityOfElementLocated(By.className("android.widget.ProgressBar")));
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
	
    }
    
  //------------------ENTERING EMAIL---------------------
    @Given("^user enters email \"(.*?)\"$")
    public void user_enters_email(String arg1) throws Throwable {
    	wait = new WebDriverWait(driver, 40);
    	wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("android.widget.EditText"))).sendKeys(arg1);
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
    }
    
    
    //------------------BUTTON CLICK---------------------
    @Given("^user clicks on button \"([^\"]*)\"$")
    public void user_clicks_on_button(String button_name) throws Throwable {
    	action = new TouchActions(driver);
    	try 
    		{	
    			if (webelementHandler.getCurrentAndroidContext().contains("WEBVIEW")) {
    				webelementHandler.switchAndroidContext("NATIVE");
    			}else if (ObjectRepository.getString(button_name).contains("//div")) {
    				webelementHandler.switchAndroidContext("WEBVIEW");
    				wait.until(ExpectedConditions.elementToBeClickable(ObjectRepository.getobjectLocator(button_name)));
				}    			
    			System.out.println("Property Value: " +ObjectRepository.getobjectLocator(button_name));
    			//((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.TAB));
    			wait.until(ExpectedConditions.visibilityOfElementLocated(ObjectRepository.getobjectLocator(button_name)));
        	 	driver.findElement(ObjectRepository.getobjectLocator(button_name)).click();
        	 	if (button_name.equals("Home")) {
        	 		System.err.println(driver.findElement(ObjectRepository.getobjectLocator(button_name)).getText());
            		action.singleTap(driver.findElement(ObjectRepository.getobjectLocator(button_name))).perform();   
        		}        		
    		}    
    	catch(Exception e) 
    		{
    		String button_value = button_name.split("_")[0];
    		System.err.println(button_value + " "+ "//*[contains(@text, '"+button_value+"')]");
    		Thread.sleep(1000);
    		driver.findElement(By.xpath("//*[contains(@text, '"+button_value+"')]")).click();; 
    		System.out.println("Inside Catch , Success");
   		} 	
    }
    
  //------------------LABEL CLICK---------------------
    @Given("^user clicks on label \"([^\"]*)\"$")
    public void label(String label_name) throws Throwable {  
    	try
    	{
    		wait.until(ExpectedConditions.visibilityOfElementLocated(ObjectRepository.getobjectLocator(label_name)));
    		driver.findElement(ObjectRepository.getobjectLocator(label_name)).click();
    	}
    	catch(Exception e)
    	{
    		String label_value = label_name.split("_")[0];
    		driver.findElement(By.xpath("//*[contains(@text, '"+label_value+"')]")).click();; 
    		System.out.println("Inside Catch , Success");	
    	}
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
    }
   
    
  //------------------ENTERING TEXT IN TEXTBOX ---------------------
    @SuppressWarnings("rawtypes")
	@Given("^user enters text \"([^\"]*)\" in textbox \"([^\"]*)\"$")
    public void user_enters_text_in_textbox(String text_value, String textbox_name) throws Throwable {
	
    	try {
    		if(ObjectRepository.getString(textbox_name).contains("//android")) {
				webelementHandler.switchAndroidContext("NATIVE");
			}   
    		 		
    			System.out.println("Property Value : " +ObjectRepository.getobjectLocator(textbox_name));	
    		    wait.until(ExpectedConditions.visibilityOfElementLocated(ObjectRepository.getobjectLocator(textbox_name)));   
    		    driver.findElement(ObjectRepository.getobjectLocator(textbox_name)).click();
    		    driver.findElement(ObjectRepository.getobjectLocator(textbox_name)).clear();
    		    driver.findElement(ObjectRepository.getobjectLocator(textbox_name)).sendKeys(text_value);
    		
    		if (ObjectRepository.getString("SpaceElement").contains(textbox_name) || ObjectRepository.getString("frameElement").contains(textbox_name)) {
    			((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.SPACE));
			}    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		//System.out.println("VALUE OF THE FIELD "+driver.switchTo().activeElement().getText());
    		wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("android.widget.EditText")));   
    		driver.findElement(By.className("android.widget.EditText")).clear();
    		driver.findElement(By.className("android.widget.EditText")).sendKeys(text_value);
    		
    	}
   	
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
    }
   
    
  //------------------DROPDOWN SELCTION---------------------
    @Given("^user selects option \"([^\"]*)\" from the dropdown \"([^\"]*)\"$")
    public void user_selects_option_from_the_dropdown(String dropdown_value, String dropdown_name) throws Throwable {
    	
    	try
    	{
    		driver.findElement(ObjectRepository.getobjectLocator(dropdown_name)).click();
 		 Thread.sleep(2000);
    	driver.findElement(ObjectRepository.getobjectLocator(dropdown_value)).click();
 	
    	}
    	catch(Exception e)
    	{
    		/*String dd_value = dropdown_name.split("_")[0];
    		driver.findElement(By.xpath("//*[contains(@text, '"+dd_value+"')]")).click();
    		
    		String dnd_value = dropdown_value.split("_")[0];
    		driver.findElement(By.xpath("//*[contains(@text, '"+dnd_value+"')]")).click();*/
    		
    		System.out.println("Inside Catch , Success");	
      
    	}
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }
    
  //------------------RADIO BUTTON SELECTION---------------------
    @Given("^user selects radio button \"([^\"]*)\"$")
    public void user_selects_radio_button(String radiobutton_value) throws Throwable {
        
    	driver.findElement(ObjectRepository.getobjectLocator(radiobutton_value)).click();
    	
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    	
    }
    
    
  //------------------FIELD LEVEL VALIDATION---------------------
    @Given("^user validates \"([^\"]*)\" field with expected value as \"([^\"]*)\"$")
    public void user_validates_field_with_expected_value_as(String actual, String expected) throws Throwable {
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
    //	actual = actual+ "_value";
    	String actual_argument = driver.findElement(ObjectRepository.getobjectLocator(actual)).getText();
   		Assert.assertEquals(expected, actual_argument);
    		
    }
   
  //------------------SWIPE RIGHT---------------------
    @Given("^user swipes right to select \"([^\"]*)\"$")
    public void user_swipes_right_to_select(String account) throws Throwable {
    	
    	 @SuppressWarnings("rawtypes")
		TouchAction touchAction = new TouchAction((PerformsTouchActions) driver);    //for touch actions on mobile devices
    	if(account.equalsIgnoreCase("SAVINGS"))
	{
    	//action.press(startx,starty).waitAction(1000).moveTo(startx,endy).release().perform();    	
        touchAction.longPress(PointOption.point(290, 309)).moveTo(PointOption.point(0, 309)).release().perform();
    }
    	else
    	{
    		touchAction.longPress(PointOption.point(290, 540)).moveTo(PointOption.point(0, 540)).release().perform();	
    	}
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
    }
    
    
  //------------------SCROLL DOWN---------------------
    @Given("^user scrolls down$")
    public void user_scrolls_down() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    	Thread.sleep(1000);
    	@SuppressWarnings("rawtypes")
    	TouchAction touchAction = new TouchAction((PerformsTouchActions) driver);
    	touchAction.longPress(PointOption.point(200, 1000)).moveTo(PointOption.point(200, 200)).release().perform();
    	Thread.sleep(2000);
    }
    
    
  //------------------LINK CLICK---------------------
    @Given("^user clicks on link \"([^\"]*)\"$")
    public void user_clicks_on_link(String linkname) throws Throwable {
       
    	try {
    		driver.findElement(ObjectRepository.getobjectLocator(linkname)).click();
    		
    	}
    	catch(Exception e)
    	{
    	 wait.until(ExpectedConditions.visibilityOfElementLocated
    			 (ObjectRepository.getobjectLocator(linkname))).click();
	
    	}
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }
    
  //------------------SELECTING CHECKBOX---------------------
    @Given("^user selects checkbox \"([^\"]*)\"$")
    public void user_selects_checkbox(String checkbox_name) throws Throwable {
    	try
    	{
    		wait.until(ExpectedConditions.visibilityOfElementLocated(ObjectRepository.getobjectLocator(checkbox_name)));
    		driver.findElement(ObjectRepository.getobjectLocator(checkbox_name)).click();
    	}
    	catch (Exception e)
    	{
    	wait.until(ExpectedConditions.visibilityOfElementLocated
   			 (ObjectRepository.getobjectLocator(checkbox_name))).click();       
    	}
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
    }

  //------------------WAIT METHOD---------------------
    @Given("^user waits for \"(.*?)\" seconds$")
    public void user_waits_for_seconds(long arg1) throws Throwable 
    {
       arg1 = arg1*1000;
    	Thread.sleep(arg1); 
    } 
    
  //------------------INDEX METHOD FOR TEXTBOX ---------------------
/*    @Given("^user enters \"([^\"]*)\" in textbox at index \"([^\"]*)\"$")
    public void user_enters_in_textbox_at_index(String text, int index) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    	
    	List<MobileElement> elements = driver.findElements(By.className("android.widget.EditText"));
        System.out.println("Number of elements:" +elements.size());

        for (int i=0; i<elements.size();i++)
        	
        {
          System.out.println("textbox text:" + elements.get(i).getAttribute("text"));
                    
          if(elements.get(i).equals(index))
       	   break;
       
        }
        
        elements.get(index).sendKeys(text);
        elements.get(index).click();
        
        ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.SPACE));  

        Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }*/
    
    //------------------INDEX METHOD FOR TEXTBOX ---------------------
    @Given("^user enters \"([^\"]*)\" in textbox at index \"([^\"]*)\"$")
    public void user_enters_in_textbox_at_index(String text, int index) throws Throwable {
    // Write code here that turns the phrase above into concrete actions  
    	Thread.sleep(1000);
    	List<MobileElement> elements = driver.findElements(By.className("android.widget.EditText"));
    	wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.className("android.widget.EditText")));
    	System.out.println("Number of elements:" +elements.size());
    	for (int i=0; i<elements.size();i++)
    	{
    		System.out.println("textbox text:" + elements.get(i).getAttribute("text"));
    		if(elements.get(i).equals(index))
    			break;    
    	}
    	elements.get(index).sendKeys(text);

    	// elements.get(index).click();
    	((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.SPACE));
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }
 
  //------------------INDEX METHOD FOR BUTTON--------------------
    @Given("^user clicks on button at index \"([^\"]*)\"$")
    public void user_clicks_on_button_at_index(int index) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    	
    try
    {
    	List<MobileElement> elements = driver.findElements(By.className("android.widget.Button"));
   
        System.out.println("Number of elements:" +elements.size());

        for (int i=0; i<elements.size();i++)
        {
        System.out.println("button text:" + elements.get(i).getAttribute("text"));
        //  elements.get(index).sendKeys(text);
        if(elements.get(i).equals(index))
     	   break;
        System.err.println("button text:" + elements.get(i).getAttribute("text"));
        System.err.println("button text:" + elements.get(index).getAttribute("text"));
        }
    	wait.until(ExpectedConditions.elementToBeClickable(elements.get(index)));
        elements.get(index).click();
    }
    catch(Exception e)
    {
    	
       
    }
    Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }
    
    
  //------------------INDEX METHOD FOR CHECKBOX--------------------
    @SuppressWarnings("unlikely-arg-type")
	@Given("^user selects checkbox at index \"([^\"]*)\"$")
    public void user_selects_checkbox_at_index(int index) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    	
    	List<MobileElement> elements = driver.findElements(By.className("android.widget.CheckBox"));
        System.out.println("Number of elements:" +elements.size());

        for (int i=0; i<elements.size();i++)
        {
        System.out.println("checkbox text:" + elements.get(i).getAttribute("text"));
        
       if(elements.get(i).equals(index))
    	   break;
       
        
        }
        elements.get(index).click();
        Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }
    
    
    
 
    
  //------------------INDEX METHOD FOR RADIOBUTTON--------------------
    @Given("^user selects radiobutton at index \"([^\"]*)\"$")
    public void user_selects_radiobutton_at_index(int index) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    	
    	List<MobileElement> elements = driver.findElements(By.className("android.widget.RadioButton"));
        System.out.println("Number of elements:" +elements.size());

        for (int i=0; i<elements.size();i++)
        {
        System.out.println("Radiobox text:" + elements.get(i).getAttribute("text"));
        //  elements.get(index).sendKeys(text);       
        if(elements.get(i).equals(index))
     	   break;
          
        }
        
        elements.get(index).click();
        Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }
    
    
    //------------------INDEX METHOD FOR DROPDOWN--------------------
    @Given("^user selects dropdown at index \"([^\"]*)\"$")
    public void user_selects_dropdown_at_index(int index) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    	
    	List<MobileElement> elements = driver.findElements(By.xpath("//android.widget.Image[@text='custom arrow-down-btn']"));
        System.out.println("Number of elements:" +elements.size());

        for (int i=0; i<elements.size();i++)
        {
        //System.out.println("Dropdown text:" + elements.get(i).getAttribute("text"));
        //  elements.get(index).sendKeys(text);  
        	
        	if(elements.get(i).equals(index))
          	   break;

        }
        elements.get(index).click();
        Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
    }
   
   
  //------------------SWITCHING APPS--------------------
    @SuppressWarnings({ "unchecked", "rawtypes" })
    
    @Given("^user switches to \"([^\"]*)\" app to get \"([^\"]*)\" for account with email \"([^\"]*)\"  and password \"([^\"]*)\"$")
    public void user_switches_to_app_to_get_for_account_with_email_and_password(String app_name, String requirement, String email_id, String password) throws Throwable {
       
    	Thread.sleep(2000);
    	Activity activity; 
    	
    	String otp_value = null;
    	
    	
    	switch(app_name)
		{
			case "chrome":
				activity = new Activity(ObjectRepository.getString("global.capability.chromeAppPackage"), ObjectRepository.getString("global.capability.chromeAppActivity"));
		        activity.setStopApp(false);
		        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);	
		        String domain = email_id.split("@")[1];
		        System.out.println("DOMAIN-- "+ domain);
		     
		     //   System.setProperty("webdriver.chrome.driver","\\src\\main\\resources\\chromedriver.exe");
		        
		   if(domain.equalsIgnoreCase("gmail.com"))     
		   {        
			   try {
		        	System.out.print("Inside Try block");
		        //	driver.get("http://www.gmail.com");
		        	driver.findElement(By.className("android.widget.EditText")).sendKeys("https://"+domain);			        
			       ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.ENTER));
			        
			       System.out.print("Exit try block"); 
		        }
		
			   catch(Exception e)
			   {
    				System.out.print("Inside catch block");
    				
    					driver.findElement(By.xpath("//android.widget.EditText[@resource-id='com.android.chrome:id/url_bar']")).sendKeys("https://m.yopmail.come/");
    				((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.ENTER));
    				Thread.sleep(2000);
    				
			   }
		 
		   }
		  
		   else if(domain.equalsIgnoreCase("yopmail.com"))  
		   {
			   activity = new Activity(ObjectRepository.getString("global.capability.chromeAppPackage"), ObjectRepository.getString("global.capability.chromeAppActivity"));
		        activity.setStopApp(false);
		        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);	
		        domain = email_id.split("@")[1];
		        Thread.sleep(1000);
			       driver.findElement(By.xpath("//android.widget.ImageButton[@resource-id='com.android.chrome:id/menu_button']")).click(); 
			       driver.findElement(By.xpath("//android.widget.TextView[@text='New tab']")).click();
		        Thread.sleep(1000);
		        driver.findElement(By.className("android.widget.EditText")).clear();
		        driver.findElement(By.className("android.widget.EditText")).sendKeys(domain);			        
			       ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.ENTER));
		        
			        
			       Thread.sleep(1000);
			       driver.findElement(By.xpath("//android.widget.EditText[@resource-id='login']")).clear();
			       driver.findElement(By.xpath("//android.widget.EditText[@resource-id='login']")).sendKeys(email_id);  
			       driver.findElement(By.xpath("//android.widget.Button[@index='0']")).click();
			       Thread.sleep(2000);
			       
			
			       driver.findElement(By.xpath("//android.view.View[contains(@text,'Meed')]")).click();
			       Thread.sleep(1000);
			   String otptext=    driver.findElement(By.xpath("//android.view.View[contains(@text, 'Welcome to Meed ')]")).getText();
			   		
			       System.out.println("OTP TEXT is"+otptext);
			       String otp = domain = otptext.split(":")[1];
			       String[] temp =  otp.split(" ");
			       otp_value= temp[1];
			       
			     //  System.out.println("OTP IS: " + otp_value[1]);
			       
		        
		   }
		break;
				
			case "message":
				 activity = new Activity(ObjectRepository.getString("global.capability.settingsAppPackage"), ObjectRepository.getString("global.capability.settingsAppActivity"));
		        activity.setStopApp(false);
		        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);
		        driver.findElement(By.className("android.widget.LinearLayout")).click();
			break;
			
		}
    	    
        Thread.sleep(2000);
        
         //Re launch Meed App
        activity = new Activity(ObjectRepository.getString("global.capability.NewMeedAppPackage"), ObjectRepository.getString("global.capability.NewMeedAppActivity"));
        activity.setStopApp(false);
        int j=3;
        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);
      System.out.println("OTP is "+otp_value);
     
  
     for(int i=0;i<otp_value.length();i++)
     {
    	String temp = otp_value.substring(i, i+1);
    // 	System.out.println("temp " +temp);
 
   
   driver.findElement(By.xpath("//android.view.View[@index='"+j+"']")).click();
   switch(temp)
   {
   case("1"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_1));
   break;
   
   case("2"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_2));
   break;
   
   case("3"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_3));
   break;
   
   case("4"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_4));
   break;
   
   case("5"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_5));
   break;
   
   case("6"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_6));
   break;
   
   case("7"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_7));
   break;
   
   case("8"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_8));
   break;
   
   case("9"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_9));
   break;
   
   case("0"): ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.DIGIT_0));
   break;
   
   
   }
   
       ++j;
     }  
      Thread.sleep(5000);  	
        
    }
    
    
  //------------------Switching to Message App to get OTP --------------------
    
    @Given("^user switches to app \"([^\"]*)\" to get \"([^\"]*)\"$")
    public void user_switches_to_app_to_get(String app_name, String app_data) throws Throwable {
    	
    	
    	Activity activity; 
    	
    	
    	switch(app_name)
		{
			case "message":
				activity = new Activity(ObjectRepository.getString("global.capability.settingsAppPackage"), ObjectRepository.getString("global.capability.settingsAppActivity"));
		        activity.setStopApp(false);
		        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);
		        driver.findElement(By.className("android.widget.LinearLayout")).click();
				break;
				
				
			case"chrome":
				break;
    	
		}
    	
    	
   
    	 activity = new Activity(ObjectRepository.getString("global.capability.NewMeedAppPackage"), ObjectRepository.getString("global.capability.NewMeedAppActivity"));
         activity.setStopApp(false);
         
         ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);
         Thread.sleep(5000);
        
    }
    
    
    
  //------------------CALENDAR SELCTIONS --------------------

    	@Given("^user selects \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" from calendar$")
    	public void user_selects_from_calendar(String month, int day, int year) throws Throwable {
    	    // Write code here that turns the phrase above into concrete actions
    		
  		
    		Calendar mCalendar = Calendar.getInstance();    
        	String current_month = mCalendar.getDisplayName(Calendar.MONTH, Calendar.SHORT, Locale.getDefault());
        	System.out.println("MONTH VALUE IS RETREIVED AS --- " + current_month);
     	
        	
        	int current_day = mCalendar.get(Calendar.DAY_OF_MONTH);
        	System.out.println("Day VALUE IS RETREIVED AS --- " + current_day);
        	
        	int current_year = mCalendar.get(Calendar.YEAR);
        	System.out.println("Year VALUE IS RETREIVED AS --- " + current_year);
        	
        	
        	int currentmonthInt = mCalendar.get(Calendar.DAY_OF_MONTH);
        	System.out.println("Month VALUE IS RETREIVED AS --- " + currentmonthInt);
        
    			
    //	System.out.println("CURRENT DATE- " +driver.findElement(By.xpath("//android.view.View[contains(@text, 'Oct')]")).getText());	
 
    		TouchAction touchAction = new TouchAction((PerformsTouchActions) driver);
    		if(year>current_year)
    		{
    			do
    			{   
    				
    				WebElement current_year_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+current_year +"']"));
    				int cyear_x = current_year_val.getLocation().getX();
    	    		int cyear_y = current_year_val.getLocation().getY();
				
    				int temp=current_year+1;
    				WebElement current_year_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+temp+"']"));
    				int year_x = current_year_oneahead.getLocation().getX();
            		int year_y = current_year_oneahead.getLocation().getY();
    				touchAction.longPress(PointOption.point(year_x, year_y)).moveTo(PointOption.point(cyear_x, cyear_y)).release().perform();
    				++current_year;
    				System.out.println("Current Year is :" + current_year);
    				
    			}while (year>current_year);
    		}
    		else
    		{
    			
    		}
    		
    		
    	//If month is given in digits	
    		if(month.length()<=2)
    		{
    			
    			int month_int = Integer.parseInt(month);
    			
    			 if(month_int>currentmonthInt)
    	    		{
    	    			do
    	    			{
    	    				WebElement current_mon_val, current_mon_oneahead;
    	    				int cmon_x, cmon_y, mon_x, mon_y, temp;
    	    				
    	    				if(currentmonthInt<10)
    	    				{
    	    				 current_mon_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+currentmonthInt +"']"));
    	    				 cmon_x = current_mon_val.getLocation().getX();
    	    	    		 cmon_y = current_mon_val.getLocation().getY();
    	    				}
    	    				else
    	    				{
    	    					current_mon_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+currentmonthInt +"']"));
    	       				 cmon_x = current_mon_val.getLocation().getX();
    	       	    		 cmon_y = current_mon_val.getLocation().getY();
    	    				}
    					
    	    				temp=currentmonthInt+1;
    	    				if(temp<10)
    	    				{
    	    					current_mon_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+temp+"']"));
    	       				 mon_x = current_mon_oneahead.getLocation().getX();
    	               		 mon_y = current_mon_oneahead.getLocation().getY();
    	    				}
    	    				else
    	    				{
    	    				
    	    				 current_mon_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+temp+"']"));
    	    				 mon_x = current_mon_oneahead.getLocation().getX();
    	            		 mon_y = current_mon_oneahead.getLocation().getY();
    	    				}
    	    				touchAction.longPress(PointOption.point(mon_x, mon_y)).moveTo(PointOption.point(cmon_x, cmon_y)).release().perform();
    	    				++currentmonthInt;
    	    				System.out.println("Current Day is :" + currentmonthInt);
    	    				
    	    			}while (month_int>currentmonthInt);
    	    		}
    	    		else if(month_int<currentmonthInt)
    	    		{
    	    			
    	    			do
    	    			{	
    	    				WebElement current_mon_val, current_mon_oneahead;
    	    				int cmon_x, cmon_y, mon_x, mon_y, temp;
    	    				
    	    				if(currentmonthInt<10)
    	    				{
    	    				 current_mon_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+currentmonthInt +"']"));
    	    				 cmon_x = current_mon_val.getLocation().getX();
    	    	    		 cmon_y = current_mon_val.getLocation().getY();
    	    				}
    	    				else
    	    				{
    	    					current_mon_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+currentmonthInt +"']"));
    	       				 cmon_x = current_mon_val.getLocation().getX();
    	       	    		 cmon_y = current_mon_val.getLocation().getY();
    	    				}
    					
    	    				temp=currentmonthInt-1;
    	    				if(temp<10)
    	    				{
    	    					current_mon_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+temp+"']"));
    	       				 mon_x = current_mon_oneahead.getLocation().getX();
    	               		 mon_y = current_mon_oneahead.getLocation().getY();
    	    				}
    	    				else
    	    				{
    	    				
    	    				 current_mon_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+temp+"']"));
    	    				 mon_x = current_mon_oneahead.getLocation().getX();
    	            		 mon_y = current_mon_oneahead.getLocation().getY();
    	    				}
    	    				touchAction.longPress(PointOption.point(mon_x, mon_y)).moveTo(PointOption.point(mon_x, mon_y)).release().perform();
    	    				--currentmonthInt;
    	    				
    	    			}while (month_int<currentmonthInt);
    	    			
    	    		}
    	    
    			
    		}
    		//If month value is in Alphabets
    		
    		
    		else
    		{
    		
    			
    		// Doing Touch action for Months
    		List<String> months = Arrays.asList("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
    		int indexOfCurrentMonth = 0; int indexofinputMonth =0;
    		
    		System.out.println("Number of elements:" +months.size());

            for (int i=0; i<months.size();i++)
            {
            if(months.get(i).contentEquals(current_month))
            {
            	indexOfCurrentMonth=i;
            }  
            
            else if (months.get(i).contentEquals(month))          
            {
            	indexofinputMonth=i;
            }
     
            }
            System.out.println("Index of Current Month "+ indexOfCurrentMonth);
            System.out.println("Index of Entered Month "+ indexofinputMonth);
         
            if(indexofinputMonth>indexOfCurrentMonth)
    		{
    			do
    			{
    				
    				WebElement current_month_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+current_month +"']"));
    				int cmonth_x = current_month_val.getLocation().getX();
    	    		int cmonth_y = current_month_val.getLocation().getY();
				
    				int temp=indexOfCurrentMonth+1;
    				
    				
    				WebElement current_month_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+months.get(temp)+"']"));
    				int month_x = current_month_oneahead.getLocation().getX();
            		int month_y = current_month_oneahead.getLocation().getY();
    				touchAction.longPress(PointOption.point(month_x, month_y)).moveTo(PointOption.point(cmonth_x, cmonth_y)).release().perform();
    				++indexOfCurrentMonth;
    				System.out.println("Current Month index is :" + indexOfCurrentMonth);
    				
    			}while (indexofinputMonth>indexOfCurrentMonth);
    		}
            
            
    		else if (indexofinputMonth<indexOfCurrentMonth)
    		{
    			do
    			{
    				WebElement current_month_val = driver.findElement(By.xpath("//android.widget.Button[@text ='"+current_month +"']"));
    				int cmonth_x = current_month_val.getLocation().getX();
    	    		int cmonth_y = current_month_val.getLocation().getY();
				
    				int temp=indexOfCurrentMonth-1;
    				
    				
    				WebElement current_month_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+months.get(temp)+"']"));
    				int month_x = current_month_oneahead.getLocation().getX();
            		int month_y = current_month_oneahead.getLocation().getY();
    				touchAction.longPress(PointOption.point(month_x, month_y)).moveTo(PointOption.point(cmonth_x, cmonth_y)).release().perform();
    				--indexOfCurrentMonth;
    				System.out.println("Current Month index is :" + indexOfCurrentMonth);
    				
    			}while (indexofinputMonth<indexOfCurrentMonth);
    		}
    		}
    		
    		
    		//Touch action for Day 
            if(day>current_day)
    		{
    			do
    			{
    				WebElement current_day_val, current_day_oneahead;
    				int cday_x, cday_y, day_x, day_y, temp;
    				
    				if(current_day<10)
    				{
    				 current_day_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+current_day +"']"));
    				 cday_x = current_day_val.getLocation().getX();
    	    		 cday_y = current_day_val.getLocation().getY();
    				}
    				else
    				{
    					current_day_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+current_day +"']"));
       				 cday_x = current_day_val.getLocation().getX();
       	    		 cday_y = current_day_val.getLocation().getY();
    				}
				
    				temp=current_day+1;
    				if(temp<10)
    				{
    					current_day_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+temp+"']"));
       				 day_x = current_day_oneahead.getLocation().getX();
               		 day_y = current_day_oneahead.getLocation().getY();
    				}
    				else
    				{
    				
    				 current_day_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+temp+"']"));
    				 day_x = current_day_oneahead.getLocation().getX();
            		 day_y = current_day_oneahead.getLocation().getY();
    				}
    				touchAction.longPress(PointOption.point(day_x, day_y)).moveTo(PointOption.point(cday_x, cday_y)).release().perform();
    				++current_day;
    				System.out.println("Current Day is :" + current_day);
    				
    			}while (day>current_day);
    		}
    		else if(day<current_day)
    		{
    			
    			do
    			{	
    				WebElement current_day_val, current_day_oneahead;
    				int cday_x, cday_y, day_x, day_y, temp;
    				
    				if(current_day<10)
    				{
    				 current_day_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+current_day +"']"));
    				 cday_x = current_day_val.getLocation().getX();
    	    		 cday_y = current_day_val.getLocation().getY();
    				}
    				else
    				{
    					current_day_val	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+current_day +"']"));
       				 cday_x = current_day_val.getLocation().getX();
       	    		 cday_y = current_day_val.getLocation().getY();
    				}
				
    				temp=current_day-1;
    				if(temp<10)
    				{
    					current_day_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+0+temp+"']"));
       				 day_x = current_day_oneahead.getLocation().getX();
               		 day_y = current_day_oneahead.getLocation().getY();
    				}
    				else
    				{
    				
    				 current_day_oneahead	= driver.findElement(By.xpath("//android.widget.Button[@text ='"+temp+"']"));
    				 day_x = current_day_oneahead.getLocation().getX();
            		 day_y = current_day_oneahead.getLocation().getY();
    				}
    				touchAction.longPress(PointOption.point(day_x, day_y)).moveTo(PointOption.point(cday_x, cday_y)).release().perform();
    				--current_day;
    				//System.out.println("Current Day is :" + current_day);
    			}while (day<current_day);
    			
    		}
    		
    	
        	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 	
    		
    	}
    	
    	
    	//---------------------SELECTING FROM LIST- Android specific-----
    	@Given("^user selects option \"([^\"]*)\" from the list$")
    	public void user_selects_option_from_the_list(String list_value) throws Throwable {
    	    // Write code here that turns the phrase above into concrete actions
    		System.out.println("List name" + list_value);
    		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//android.view.View[@text='"+list_value+"']")));
    	    driver.findElement(By.xpath("//android.view.View[@text='"+list_value+"']")).click();
    	}
    	
    	
    	//------------------INDEX METHOD FOR LABEL --------------------

    	@Given("^user select label \"([^\"]*)\" at index \"([^\"]*)\"$")
    	public void user_select_label_at_index(String label_name, int index) throws Throwable {
    		// Write code here that turns the phrase above into concrete actions
    		
    		List<MobileElement> elements = driver.findElements(By.xpath("//*[@text='"+label_name+ "']"));
            System.out.println("Number of elements:" +elements.size());

            for (int i=0; i<elements.size();i++)
            {
            System.out.println("checkbox text:" + elements.get(i).getAttribute("text"));
            
           if(elements.get(i).equals(index))
        	   break;
           
            
            }
            elements.get(index).click();
            Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));
        
    		
    	}
    	
    	

    	@SuppressWarnings("rawtypes")
		@Given("^user presses device \"([^\"]*)\" button$")
    	public void user_presses_device_button(String button_name) throws Throwable {
    	    // Write code here that turns the phrase above into concrete actions
    	  
    		switch(button_name)
    		{
    			case "BACK":
    				((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.BACK));
    				break;
    			case "ENTER":
    				((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.ENTER));
    				break;
    			case "CAMERA":
    				((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.CAMERA));
    				break;
    			
    		}
 		
    	}
    	

 @After()
	public void tearDown() throws Throwable {		
	 System.out.println("Executing After of Step Defination");
	 try {
		 if (webelementHandler.getCurrentAndroidContext().contains("WEBVIEW")) {
		 		((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.APP_SWITCH));
		 		webelementHandler.clickButton(ObjectRepository.getString("Close_all"));
		 	}else {
		 		Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
		 		((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.APP_SWITCH));
		 		webelementHandler.clickButton(ObjectRepository.getString("Close_all"));
		 	}
	} catch (Exception e) {
		driver.quit();
	}
	 
	}
 
 /** @author vaishali.katta  */
 @Given("^user waits for app to load$")
 public void user_waits_for_app_to_load() throws Throwable {
 	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.className("android.widget.ProgressBar")));
	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
 }	
 
 /** @author vaishali.katta  */
 @Then("^user validates that \"([^\"]*)\" is displayed$")
 public void user_validates_that_is_displayed(String locator) throws Throwable {
  		wait.until(ExpectedConditions.visibilityOfElementLocated(ObjectRepository.getobjectLocator(locator)));   
		VerificationHandler.verifyTrue(driver.findElement(ObjectRepository.getobjectLocator(locator)).isDisplayed());
		Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
 }
 
 /** @author vaishali.katta  */
 @Given("^user checks the initial \"([^\"]*)\" of \"([^\"]*)\" account$")
 public void user_checks_the_initial_of_account(String type, String account) throws Throwable {
	 	String balancelocator1, balancelocator2;
	 
		balancelocator1 = "//*[@text='"+account+"']/following-sibling::android.view.View/android.view.View[@text='"+type+": ']/following-sibling::android.view.View[@resource-id='amount-value']";
	 	wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(balancelocator1)));
		String amountvalue = driver.findElement(By.xpath(balancelocator1)).getText();
		
		balancelocator2 = "//*[@text='"+account+"']/following-sibling::android.view.View/android.view.View[@text='"+type+": ']/following-sibling::android.view.View[@resource-id='amount-value']/following-sibling::android.view.View[@resource-id='decomal-value']";
		String decimalvalue = driver.findElement(By.xpath(balancelocator2)).getText();
		
		if (account.equalsIgnoreCase("CHECKING")) {
			checkingBalance = amountvalue+decimalvalue;
			checkingBalance = checkingBalance.replace("$", "").replace(",", "");			
		}else if (account.equalsIgnoreCase("LINE OF CREDIT")) {
			locBalance = amountvalue+decimalvalue;
			locBalance = locBalance.replace("$", "").replace(",", "");			
		}else if (account.equalsIgnoreCase("SAVINGS")) {
			savingsBalance = amountvalue+decimalvalue;
			savingsBalance = savingsBalance.replace("$", "").replace(",", "");	
		}	
		Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
 }
 
 /** @author vaishali.katta  */
 @Given("^user verify that \"([^\"]*)\" in \"([^\"]*)\" account is \"([^\"]*)\" by \"([^\"]*)\"$")
 public void user_verify_that_in_account_is_by(String type, String account, String transaction, String amount) throws Throwable {
	 
	    String actualbalance;
	 	String balancelocator1, balancelocator2;
	 	Double dblBalance;
	 	
		balancelocator1 = "//*[@text='"+account+"']/following-sibling::android.view.View/android.view.View[@text='"+type+": ']/following-sibling::android.view.View[@resource-id='amount-value']";
	 	wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(balancelocator1)));
		String amountvalue = driver.findElement(By.xpath(balancelocator1)).getText().replace(",", "");	
		
		balancelocator2 = "//*[@text='"+account+"']/following-sibling::android.view.View/android.view.View[@text='"+type+": ']/following-sibling::android.view.View[@resource-id='amount-value']/following-sibling::android.view.View[@resource-id='decomal-value']";
		String decimalvalue = driver.findElement(By.xpath(balancelocator2)).getText();
		
		actualbalance = amountvalue+decimalvalue;
		actualbalance = actualbalance.replace("$", "");	
				
		if (transaction.contains("debit")) {
			if (account.equalsIgnoreCase("CHECKING")) {
				dblBalance = Double.parseDouble(checkingBalance)-Double.parseDouble(amount);
				VerificationHandler.verifyTrue(actualbalance.contains(Double.toString(dblBalance)));			

			}else if (account.equalsIgnoreCase("LINE OF CREDIT")) {			
				dblBalance = Double.parseDouble(locBalance)-Double.parseDouble(amount);
				VerificationHandler.verifyTrue(actualbalance.contains(Double.toString(dblBalance)));
					
			}else if (account.equalsIgnoreCase("SAVINGS")) {
				dblBalance = Double.parseDouble(savingsBalance)-Double.parseDouble(amount);
				VerificationHandler.verifyTrue(actualbalance.contains(Double.toString(dblBalance)));
			}
		}else if (transaction.contains("credit")) {
			if (account.equalsIgnoreCase("CHECKING")) {
				dblBalance = Double.parseDouble(checkingBalance)+Double.parseDouble(amount);
				VerificationHandler.verifyTrue(actualbalance.contains(Double.toString(dblBalance)));			

			}else if (account.equalsIgnoreCase("LINE OF CREDIT")) {			
				dblBalance = Double.parseDouble(locBalance)+Double.parseDouble(amount);
				VerificationHandler.verifyTrue(actualbalance.contains(Double.toString(dblBalance)));
					
			}else if (account.equalsIgnoreCase("SAVINGS")) {
				dblBalance = Double.parseDouble(savingsBalance)+Double.parseDouble(amount);
				VerificationHandler.verifyTrue(actualbalance.contains(Double.toString(dblBalance)));
			}	
		}	
		Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
 } 
 
 /** @author vaishali.katta  */
 @Given("^user checks \"([^\"]*)\" amount$")
 public void user_checks_amount(String type) throws Throwable {
	 
	 if (type.equals("Full_Payment")) {
		 fullPaymentloc = driver.findElement(By.xpath("//android.view.View[@text='AMOUNT TO BE MOVED']/..//android.widget.EditText")).getText();
	 }else if (type.equals("Minimum_Payment")) {
		 minimumPaymentloc = driver.findElement(By.xpath("//android.view.View[@text='AMOUNT TO BE MOVED']/..//android.widget.EditText")).getText();
	} 
		Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
 }
 
 /** @author vaishali.katta  */
 @Given("^user verify that \"([^\"]*)\" transaction is listed in the transaction history of \"([^\"]*)\" account with note \"([^\"]*)\" and amount \"([^\"]*)\"$")
 public void user_verify_that_transaction_is_listed_in_the_transaction_history_of_account_with_note_and_amount(String type, String account, String note, String amount) throws Throwable {

	 Thread.sleep(2000);
	 String transAmount = null;
	 
	 String locator1 = "//android.view.View[@resource-id='transaction-type']";
	 String locator2 = "//android.view.View[@resource-id='transaction-type']/../../following-sibling::android.view.View//android.view.View[@resource-id='amount-value']";
	 String locator3 = "//android.view.View[@resource-id='transaction-type']/../../following-sibling::android.view.View//android.view.View[@resource-id='amount-value']/following-sibling::android.view.View[@resource-id='decomal-value']";
	 
	 wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.xpath(locator1)));
	 VerificationHandler.verifyTrue(driver.findElement(By.xpath(locator1)).getText().contains(note) && driver.findElement(By.xpath(locator1)).getText().contains(type));

	 if (amount.equals("Full_Payment")) {
		 amount = fullPaymentloc;
	 }else if (amount.equals("Minimum_Payment")) {
		 amount = minimumPaymentloc;
	}	 	 
	 transAmount = driver.findElement(By.xpath(locator2)).getText()+driver.findElement(By.xpath(locator3)).getText();  
	 VerificationHandler.verifyTrue(transAmount.contains(amount));
		Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
 }
 
 /** @author vaishali.katta  */
 @Given("^user verify that transfer is scheduled on \"([^\"]*)\" basis from \"([^\"]*)\" for amount \"([^\"]*)\" with \"([^\"]*)\"$")
 public void user_verify_that_transfer_is_scheduled_on_basis_from_for_amount_with(String frequency, String tofrom, String amount, String note) throws Throwable {
	 
	 String locator = ObjectRepository.getString("Latest_Scheduled_Transfer");
	 wait.until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath(locator+"//android.view.View[contains(@text,'"+tofrom+"')]"))));	 
	 WebElement activeTransfers = driver.findElement(By.xpath(locator+"//android.view.View[contains(@text,'"+tofrom+"')]"));
	 
	 boolean flag1 = driver.findElement(By.xpath(locator+"//android.view.View[contains(@text,'"+tofrom+"')]")).isDisplayed();
	 boolean flag2 = driver.findElement(By.xpath(locator+"//android.view.View[contains(@text,'"+amount+"')]")).isDisplayed();
	 boolean flag3 = driver.findElement(By.xpath(locator+"//android.view.View[contains(@text,'"+frequency+"')]")).isDisplayed();	 
	 activeTransfers.click();	
	 user_scrolls_down();
	 user_scrolls_down();
	 user_scrolls_down();
	 
	 String notes = driver.findElement(ObjectRepository.getobjectLocator("NOTE")).getText();
	 boolean flag4 = notes.contains(note);
	 	 
	 VerificationHandler.verifyTrue(flag1 && flag2 && flag3 && flag4); 	 
		Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
 }
 
 /** @author vaishali.katta  */
 @Given("^user validates \"([^\"]*)\" with expected value as \"([^\"]*)\"$")
 public void user_validates_with_expected_value_as(String actual, String expected) throws Throwable {
	 if (ObjectRepository.getString(actual).contains("//div")) {
		 webelementHandler.switchAndroidContext("WEBVIEW");
		 wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(ObjectRepository.getString(actual))));  
		 VerificationHandler.verifyEquals(driver.findElement(By.xpath(ObjectRepository.getString(actual))).getText(), expected);
	}else {
		 wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(ObjectRepository.getString(actual))));  
		 VerificationHandler.verifyEquals(driver.findElement(By.xpath(ObjectRepository.getString(actual))).getText(), expected);
	}
 }

 /** @author vaishali.katta  */
 @Given("^user switches to \"([^\"]*)\" app$")
 public void user_switches_to_app(String appname) throws Throwable {
	 
	 switch (appname) {
	 	case "chrome":
	 		try {
	 			activity = new Activity(ObjectRepository.getString("global.capability.chromeAppPackage"), ObjectRepository.getString("global.capability.chromeAppActivity"));
	 	        activity.setStopApp(false);
	 	        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);	                    
	 		} catch (Exception e) {
	 			System.err.println(driver.findElement(By.xpath(ObjectRepository.getString("Accept_continue"))).getText());
	 		       if (driver.findElement(By.xpath(ObjectRepository.getString("Accept_continue"))).getText().contains("Accept & continue")) {
	 		    	   driver.findElement(By.xpath(ObjectRepository.getString("Accept_continue"))).click();
	 		    	   driver.findElement(By.xpath(ObjectRepository.getString("No_Thanks"))).click();
	 		       }
	 		}finally {
	 			wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(ObjectRepository.getString("chrome_menu"))));
	 		    driver.findElement(By.xpath(ObjectRepository.getString("chrome_menu"))).click(); 
	 		    driver.findElement(By.xpath(ObjectRepository.getString("chrome_new_tab"))).click();
	 			Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
	 		}	 
		break;
	 	case "Dialer":
	 		try {
	 			activity = new Activity(ObjectRepository.getString("global.capability.dialerAppPackage"), ObjectRepository.getString("global.capability.dialerAppActivity"));
	 	        activity.setStopApp(false);
	 	        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);	
	 	        webelementHandler.switchAndroidContext("NATIVE");
	 		} catch (Exception e) {
	 			System.out.println("Inside Catch , Success"+e);
	 		       }	 			 
		break;
	 	case "Samsung Messaging":
	 		try {
	 			activity = new Activity(ObjectRepository.getString("global.capability.samsung.MessagingAppPackage"), ObjectRepository.getString("global.capability.samsung.MessagingAppActivity"));
	 	        activity.setStopApp(true);
	 	        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);	
		 	       Thread.sleep(8000);
		 	       if (webelementHandler.findElements(ObjectRepository.getString("2055093851")).size()>0) {
		 	    		  webelementHandler.clickButton(ObjectRepository.getString("2055093851"));
				   }
		 	       Thread.sleep(3000);
	 		} catch (Exception e) {
	 			System.out.println("Inside Catch , Success"+e);
	 		}	 			 
		break;
	 	case "LG Messaging":
	 		try {
	 			activity = new Activity(ObjectRepository.getString("global.capability.lg.MessagingAppPackage"), ObjectRepository.getString("global.capability.lg.MessagingAppActivity"));
	 	        activity.setStopApp(true);
	 	        ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);	
	 	        Thread.sleep(8000);
	 	        webelementHandler.findElement(By.xpath(ObjectRepository.getString("New_LG_Message"))).click();
	 	        Thread.sleep(3000);
	 		} catch (Exception e) {
	 			System.out.println("Inside Catch , Success"+e);
	 		}	 			 
		break;
	default:
		break;
	}			
	 

 }
 
 /** @author vaishali.katta  */
 @Given("^user navigates to \"([^\"]*)\" and go to the account of \"([^\"]*)\"$")
 public void user_navigates_to_and_go_to_the_account_of(String url, String user) throws Throwable {
	 
	  wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(ObjectRepository.getString("search_text_box"))));
	  driver.findElement(By.xpath(ObjectRepository.getString("search_text_box"))).click();
      driver.findElement(By.xpath(ObjectRepository.getString("url_bar"))).clear();
      driver.findElement(By.xpath(ObjectRepository.getString("url_bar"))).sendKeys(url);	
      
	  ((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.ENTER));        
	        
	  if (url.equals("yopmail.com")) {
	       Thread.sleep(2000);
	       wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(ObjectRepository.getString("yopmail_login"))));
	       driver.findElement(By.xpath(ObjectRepository.getString("yopmail_login"))).clear();
	       driver.findElement(By.xpath(ObjectRepository.getString("yopmail_login"))).sendKeys(user);  
	       driver.findElement(By.xpath("//android.widget.Button[@index='0']")).click();
	       Thread.sleep(2000);
	}	       
 }	
 
 /** @author vaishali.katta  */
 @Given("^user verify that Email is received from \"([^\"]*)\" with subject \"([^\"]*)\" and content \"([^\"]*)\"$")
 public void user_verify_that_Email_is_received_from_with_subject_and_content(String email, String subject, String content) throws Throwable {
	 
	 String locator = "//android.view.View[@resource-id='m1']/android.view.View";
	 System.err.println(driver.findElement(By.xpath(locator)).getText());
	 VerificationHandler.verifyTrue(driver.findElement(By.xpath(locator)).getText().contains(email) && driver.findElement(By.xpath(locator)).getText().contains(subject));
	 driver.findElement(By.xpath(locator)).click();
	 Thread.sleep(2000);
	 System.out.println(driver.findElement(By.xpath("//android.view.View[contains(@text,'"+content+"')]")).getText());
	 VerificationHandler.verifyTrue(driver.findElement(By.xpath("//android.view.View[contains(@text,'"+content+"')]")).isDisplayed());	 
 }

 /** @author vaishali.katta  */
 @Given("^user clicks on \"([^\"]*)\" after entering \"([^\"]*)\" in \"([^\"]*)\" and \"([^\"]*)\" in \"([^\"]*)\"$")
 public void user_clicks_on_after_entering_in_and_in(String login_button, String un, String un_textbox, String pwd, String pwd_textbox) throws Throwable {
	 	webelementHandler.switchAndroidContext("WEBVIEW"); 
	 	driver.switchTo().frame("paystand_checkout_iframe");
		 webelementHandler.enterText(ObjectRepository.getString(un_textbox), un);	
		 webelementHandler.enterText(ObjectRepository.getString(pwd_textbox), pwd);	
		 webelementHandler.clickButton(ObjectRepository.getString(login_button));	 
 }
 
 /** @author vaishali.katta  */
 @Given("^user enters answers to security questions and select \"([^\"]*)\" account for Payment$")
 public void user_enters_answers_to_security_questions_and_select_account_for_Payment(String accountType) throws Throwable {
	 
	 webelementHandler.enterText(ObjectRepository.getString("You_say_tomato_I_say"), "tomato");	 
	 webelementHandler.clickButton(ObjectRepository.getString("Submit_Answers"));	 
	 webelementHandler.enterText(ObjectRepository.getString("Name_on_account"), "name");	 
	 wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(ObjectRepository.getString("Account_holder_type"))));
	 driver.findElement(By.xpath(ObjectRepository.getString("Account_holder_type"))).click();	 
	 webelementHandler.selectByVisibleTextInMdSelectDropdown("Account_holder_type_dropdown", "Individual");	 
	 webelementHandler.clickButton(ObjectRepository.getString("Submit_Answers"));
	 Thread.sleep(5000);
	 	webelementHandler.clickElementByTextUsingActions("//div[@class='md-label']/div", accountType);
	 	webelementHandler.clickButton(ObjectRepository.getString("Select_Fund"));
	}
 
 @Given("^user enters \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" in paystand and click on \"([^\"]*)\"$")
 public void user_enters_in_paystand_and_click_on(String street, String city, String postalcode, String state, String paybutton) throws Throwable {
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Street"), "Test Street");
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_City"), "Test City");
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Postal_Code"), "22222");
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_State"), "New Jersey");
	 webelementHandler.clickButton(ObjectRepository.getString("Paystand_Pay"));
 }
 
 @Given("^user enters \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\" in paystand and click on \"([^\"]*)\"$")
 public void user_enters_in_paystand_and_click_on(String payamount, String payemail, String paycardname, String paycardnumber, String paycardexpiry, String payscode, String button) throws Throwable {
	 Thread.sleep(5000);
	 wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("paystand_checkout_iframe")));
	 driver.switchTo().frame("paystand_checkout_iframe");
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Amount"), payamount);
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Email"), payemail);
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Card_Name"), paycardname);
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Card_Number"), paycardnumber);
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Card_expiry"), paycardexpiry);
	 webelementHandler.enterText(ObjectRepository.getString("Paystand_Card_Security_Code"), payscode);
	 webelementHandler.clickButton(ObjectRepository.getString(button));
 }
 

 @Given("^user clicks on \"([^\"]*)\" of contact \"([^\"]*)\"$")
 public void user_clicks_on_of_contact(String element, String contactEmail) throws Throwable {
	 String locator =null;
	 try {
		 if (element.equals("Edit_Icon")) {
				 locator = "//android.view.View[contains(@text,'"+contactEmail+"')]/../../following-sibling::android.widget.Image";
				 webelementHandler.clickButton(locator);	
				}
		} catch (Exception e) {
			throw new Exception("Unable to click on contact with email "+contactEmail+e);
	}
 }

 @Given("^user validates that contact \"([^\"]*)\" is \"([^\"]*)\"$")
 public void user_validates_that_contact_is(String contactEmail, String action) throws Throwable {
	 String locator = null;
	 try {
		 //locator = "//android.view.View[@resource-id='recent-list']//android.view.View[contains(@text,'"+contactEmail+"')]";
		 locator = "//android.view.View[contains(@text,'"+contactEmail+"')]";
		 	if (webelementHandler.getCurrentAndroidContext().contains("WEBVIEW")) {
				webelementHandler.switchAndroidContext("NATIVE");
			}	 		
		 	if (action.equals("deleted")) {		 		
		 		VerificationHandler.verifyTrue(driver.findElements(By.xpath(locator)).isEmpty());
		 	}else if (action.equals("displayed")) {
		 		wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.xpath(locator)));
				VerificationHandler.verifyTrue(driver.findElements(By.xpath(locator)).size()>0);		 		
			}
	} catch (Exception e) {
		throw new Exception("Unable to validate if deleted/edited "+contactEmail+e);
	}
 }
 
 @Given("^user validates that \"([^\"]*)\" is \"([^\"]*)\"$")
 public void user_validates_that_is(String locator, String attribute) throws Throwable {
	 WebElement we = null;
	 if (webelementHandler.getCurrentAndroidContext().contains("WEBVIEW")) {
			webelementHandler.switchAndroidContext("NATIVE");}
	 if (ObjectRepository.getString(locator).contains("Xpath")) {
		 wait.until(ExpectedConditions.visibilityOfElementLocated(ObjectRepository.getobjectLocator(locator)));
		 we = driver.findElement(ObjectRepository.getobjectLocator(locator));
	}else {
	 wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(ObjectRepository.getString(locator))));
	 we = driver.findElement(By.xpath(ObjectRepository.getString(locator)));
	}
	 VerificationHandler.verifyTrue(we.getAttribute(attribute).equals("true"));
 }
	
 @Given("^user scrolls down to \"([^\"]*)\"$")
 public void user_scrolls_down_to(String locator) throws Throwable {
	 Dimension windowdimension = driver.manage().window().getSize();
	 int expectedx = (int) ((windowdimension.getWidth())*0.5);
	 int expectedy = (int) ((windowdimension.getHeight())*0.5);
	 System.err.println(" Window Position "+expectedx+ " " + expectedy);	 
	Thread.sleep(5000);
	wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(ObjectRepository.getobjectLocator(locator)));
	WebElement element = driver.findElement(ObjectRepository.getobjectLocator(locator));
	int x = element.getLocation().getX();
	int y = element.getLocation().getY();
	int updatedx, updatedy;
	System.err.println(locator+" x location "+x+" y location "+y);
	if (y>(int)((windowdimension.getHeight())*0.9)) {
		do {
			appaction.longPress(PointOption.point(x, y)).moveTo(PointOption.point(expectedx, expectedy)).release().perform();
			updatedx = element.getLocation().getX();
			updatedy = element.getLocation().getY();
			System.err.println(locator+" updated x location "+updatedx+" updated y location "+updatedy);
		} while (y<=updatedy);	
	}

	Thread.sleep(5000);	
 }
 
 @Given("^user enters \"([^\"]*)\" in meed app$")
 public void user_enters_in_meed_app(String transactionType) throws Throwable {
	 String otp = null;
	 List<WebElement> allelements = driver.findElements(By.xpath("//android.widget.TextView[contains(@text,'"+transactionType+"')]"));
	 String otpMsg = allelements.get(allelements.size()-1).getText()+" ";
	 if (otpMsg.contains("Enter the authorization code ")) {
		otp=StringUtils.substringBetween(otpMsg, "Enter the authorization code ", " ");
	 }else {
		otp = StringUtils.remove(otpMsg, StringUtils.substringBetween(otpMsg, "$", " ")).replace("P2P", "").replaceAll("[^0-9]", ""); 
	 }
	 System.err.println(otp);
	 
	 activity = new Activity(ObjectRepository.getString("global.capability.NewMeedAppPackage"), ObjectRepository.getString("global.capability.NewMeedAppActivity"));
     activity.setStopApp(false);
     ((AndroidDriver<MobileElement>) this.driver).startActivity(activity);
     wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//android.view.View[@resource-id='signup-verification-info']")));
     Thread.sleep(5000);
	 for (int i = 0; i < otp.length(); i++) {
		webelementHandler.pressAndroidKeyPadKey(String.valueOf(otp.charAt(i)));	
	 }	 
	 Thread.sleep(2000);
 }
 
 @Given("^user adds status in jira$")
 public void user_adds_status_in_jira() throws Throwable {
	 JiraXrayUtils.importCucumberJsonResults();
 }
 
 @Given("^user verify that \"([^\"]*)\" percent charge is applied to the \"([^\"]*)\" in CHECKING account for money movement of \"([^\"]*)\"$")
 public void user_verify_that_percent_charge_is_applied_to_the_in_CHECKING_account_for_money_movement_of(String percent, String type, String amount) throws Throwable {
	    String actualbalance;
	 	String balancelocator1, balancelocator2;
	 	Double dblBalance;
	 	DecimalFormat df = new DecimalFormat("0.00");
	 	df.setRoundingMode(RoundingMode.UP);
	 	
		balancelocator1 = "//*[@text='CHECKING']/following-sibling::android.view.View/android.view.View[@text='"+type+": ']/following-sibling::android.view.View[@resource-id='amount-value']";
	 	wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(balancelocator1)));
		String amountvalue = driver.findElement(By.xpath(balancelocator1)).getText().replace(",", "");
		
		balancelocator2 = "//*[@text='CHECKING']/following-sibling::android.view.View/android.view.View[@text='"+type+": ']/following-sibling::android.view.View[@resource-id='amount-value']/following-sibling::android.view.View[@resource-id='decomal-value']";
		String decimalvalue = driver.findElement(By.xpath(balancelocator2)).getText();
				
		actualbalance = amountvalue+decimalvalue;
		actualbalance = actualbalance.replace("$", "");
		
		String percentDeduction = df.format(Double.parseDouble(amount)*(Double.parseDouble(percent)/100));
		System.out.println("percentDeduction "+percentDeduction);
		dblBalance = Double.parseDouble(checkingBalance)+(Double.parseDouble(amount)-Double.parseDouble(percentDeduction));
		System.out.println("dblBalance "+dblBalance);
		VerificationHandler.verifyTrue(Double.toString(dblBalance).contains(actualbalance));			

		user_clicks_on_button("CHECKING");
		user_verify_that_transaction_is_listed_in_the_transaction_history_of_account_with_note_and_amount("Fee","CHECKING", "Money Movement Transt Fee", percentDeduction);
 }
 
}



    
	

