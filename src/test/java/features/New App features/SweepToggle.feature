#Author: akash.deep@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Move Between accounts
#Scenario: #NA
Feature: Settings
@RegressionPack @TC001
Scenario Outline: Verify that the user is able to Turn the Sweep Toggle 'on' in the app
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
And user clicks on button "More"
And user waits for "2" seconds
And user scrolls down
And user clicks on button "Settings"
And user waits for "2" seconds
And user clicks on button "Sweep"
And user waits for "2" seconds
And user selects checkbox "SweepOn"
And user clicks on button "Save_Changes"
And user waits for "2" seconds 
And user clicks on button "OK"
 
  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|	 	Amount		|	
	|	Android		|	meluser14@yopmail.com	|	meluser14		|	Tester-1	|		999.00		|
