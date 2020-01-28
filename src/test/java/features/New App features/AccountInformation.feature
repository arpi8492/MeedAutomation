#Author: akash.deep@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Login New App
#Scenario: #NA
Feature: Account info
@RegressionPack @TC001
Scenario Outline: Verify that the Meed application displays the YTD/Year to Date (sum of all interest deposits on SAV account) is displayed in the account summary for SAV account
#One time transfer
Given user launches the app in "<Platform>" device
And user waits for "5" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
And user clicks on button "SAVINGS"
And user clicks on button "Query"
#Assertion required



  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|	
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|
	
	
	@RegressionPack @TC002
Scenario Outline: Verify that the Meed applcation displays the APR rate in the account summary for LOC account
#One time transfer
Given user launches the app in "<Platform>" device
And user waits for "5" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
And user clicks on button "LINE_OF_CREDIT"
And user clicks on button "Query"
#Validation required



  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|	
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|