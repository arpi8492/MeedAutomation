package stepDefinations;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import com.cucumber.listener.Reporter;
import com.gargoylesoftware.htmlunit.javascript.host.Element;

import org.openqa.selenium.By;
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
import net.prodigylabs.test.BaseTest;

import org.junit.Assert;


public class GenericSteps extends BaseTest{

	//public AndroidDriver<MobileElement> driver;
	 WebDriver driver;
    public WebDriverWait wait;
   
    DesiredCapabilities caps = new DesiredCapabilities();
	ScreenshotHandler screenshot = null;
	String sName = null;
    
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
	
    			
    	try 
    		{	
    		
    		System.out.println("Property Value: " +ObjectRepository.getobjectLocator(button_name));
    		driver.findElement(ObjectRepository.getobjectLocator(button_name)).click();
 	 
    		}
    
    	catch(Exception e) 
    		{
    	
    		String button_value = button_name.split("_")[0];
    		Thread.sleep(1000);
    		driver.findElement(By.xpath("//*[contains(@text, '"+button_value+"')]")).click();; 
    		System.out.println("Inside Catch , Success");
   		}
    	
    	
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));   	
    }
    
  //------------------LABEL CLICK---------------------
    @Given("^user clicks on label \"([^\"]*)\"$")
    public void label(String label_name) throws Throwable {  
    	try
    	{
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
    		if(textbox_name.contentEquals("AMOUNT_TO_BE_MOVED") || textbox_name.contentEquals("AMOUNT_TO_BE_SENT"))
    		{
    			 
    			System.out.println("Property Value: " +ObjectRepository.getobjectLocator(textbox_name));
    			
    			driver.findElement(ObjectRepository.getobjectLocator(textbox_name)).click();
        		driver.findElement(ObjectRepository.getobjectLocator(textbox_name)).sendKeys(text_value);
    			((AndroidDriver) driver).pressKey(new KeyEvent(AndroidKey.SPACE));
    		}
    		else
    		{
    			
    				System.out.println("Property Value : " +ObjectRepository.getobjectLocator(textbox_name));	
    		
    		driver.findElement(ObjectRepository.getobjectLocator(textbox_name)).clear();
    		driver.findElement(ObjectRepository.getobjectLocator(textbox_name)).sendKeys(text_value);
    		}
    		
    	}
    	catch(Exception e) {
    		
    		//System.out.println("VALUE OF THE FIELD "+driver.switchTo().activeElement().getText());
    		
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
    		driver.findElement(By.xpath("//*[contains(@text, '"+dnd_value+"')]")).click();
    		
    		System.out.println("Inside Catch , Success");	*/
      
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
       
    	@SuppressWarnings("rawtypes")
		TouchAction touchAction = new TouchAction((PerformsTouchActions) driver);
    	touchAction.longPress(PointOption.point(200, 550)).moveTo(PointOption.point(200, 200)).release().perform();
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName)); 
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
    	Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
    } 
    
  //------------------INDEX METHOD FOR TEXTBOX ---------------------
    @Given("^user enters \"([^\"]*)\" in textbox at index \"([^\"]*)\"$")
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
      
        }
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
	public void tearDown() throws Exception {		
		System.out.println("Executing After of Step Defination");
        Reporter.addScreenCaptureFromPath(screenshot.captureScreenShot(sName));  
		driver.quit();
	}
	
}	



    
	

