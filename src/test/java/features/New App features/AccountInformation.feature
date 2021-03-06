#Author: akash.deep@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Information
#Scenario: #NA
Feature: Account info
@RegressionPack @TC001
Scenario Outline: Verify that the Meed application displays the YTD/Year to Date is displayed in the account summary for SAV account
#One time transfer
Given user launches "Meed" app in "<Platform>" device
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
	|	Platform	|	Email					   							|	Username			|	Password		|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|
	
	
@RegressionPack @TC002
Scenario Outline: Verify that the Meed applcation displays the APR rate in the account summary for LOC account
#One time transfer
Given user launches "Meed" app in "<Platform>" device
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
And user waits for "2" seconds
And user validates "APRRate" field with expected value as "<APR>"
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		| APR 																															|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	| The interest rate on your Line of Credit is currently: 15.49% APR |
	
	
@RegressionPack @TC003
Scenario Outline: Verify that the Meed application displays the APY rate 1.25% in the account summary for SAV account
#One time transfer
Given user launches "Meed" app in "<Platform>" device
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
And user waits for "2" seconds
And user validates "APYRate" field with expected value as "<APY>"
  
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		| APY 																											|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	| The Interest Rate on your Savings is currently: 1.25% APY, $181.25 YTD |	
	
	
	