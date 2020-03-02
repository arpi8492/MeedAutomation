#Author: akash.deep@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Forgot Username on login screen
#Scenario: #NA
Feature: Forgot Username
@RegressionPack @TC001
Scenario Outline: Verify that the user is able to retrieve the Username on Android devices
Given user launches "Meed" app in "<Platform>" device
And user waits for "5" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
And user clicks on button "Forgot_your_username_or_password?"
And user clicks on button "Forgot_Username"
And user enters text "<Email>" in textbox "Please_provide_your_email_address."
And user clicks on button "Continue"
And user clicks on button "Finish"
And user switches to "chrome" app 
And user navigates to "yopmail.com" and go to the account of "<Email>"
And user verify that Email is received from "dummywso2mail" with subject "<Subject>" and content "Privacy"
  Examples: 
	|	Platform	|	Email							| Subject                  | 
	|	Android		|	meluser14@yopmail.com			| MEED - Account Recovery  | 