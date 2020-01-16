#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Login New App
#Scenario: #NA
Feature: Account Login 
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully able to login in Meed App and not able login successfully
Given user launches the app in "<Platform>" device  
And user waits for app to load
  And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 Then user validates that "Home" is displayed

  Examples: 
	|	Platform	|	Email							|	Username			|	Password		|		
	|	Android		|	meluser12@yopmail.com			|	meluser12			|	Password-1		|	
	

@RegressionPack @TC002
Scenario Outline: Verify Meed customer is able to view all the accounts in Meed App
Given user launches the app in "<Platform>" device
And user waits for app to load
And user clicks on button "Get_started"
And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "CHECKING"
 Then user validates that "Checking" is displayed
 And user clicks on button "Back"
 And user scrolls down
 And user clicks on button "LINE_OF_CREDIT"
 Then user validates that "Line_Of_Credit" is displayed
 And user clicks on button "Back"
 And user clicks on button "SAVINGS"
  Then user validates that "Savings" is displayed
 And user clicks on button "Back"

Examples: 
	|	Platform	|	Email					|	Username		|	Password	|		
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|	
	
#Test case to retrieve username and password - to be written (options currently unavailable in the app)
   

   