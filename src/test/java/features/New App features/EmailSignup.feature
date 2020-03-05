#Author: akash.deep@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Email Signup
#Scenario: #NA
Feature: Email Signup
@RegressionPack @TC001
Scenario Outline: Verify that the user is able to signup on Yahoomail 
Given user launches "chrome" app in "<Platform>" device
And user navigates to "yahoomail.com" and go to the account of "<Invitees>"
And user clicks on button "Create_An_Account"
And user waits for "5" seconds
And user enters text "<First_Name>" in textbox "FirstName"
And user enters text "<Last_Name>" in textbox "LastName"
And user enters text "<Email_Address>" in textbox "EmailAddress"
And user enters text "<Email_Password>" in textbox "EmailPassword"
And user enters text "<Email_Phonenumber>" in textbox "EmailPhonenumber"
And user clicks on button "Birth_Month"
And user clicks on button "January"
And user enters text "<Birth_Day>" in textbox "Day"
And user enters text "<Birth_Year>" in textbox "Year"
And user clicks on button "Email_Continue"
And user clicks on button "TextVerification"
And user switches to "LG Messaging" app
And user enters "verification code" in Chrome app
And user waits for "8" seconds
And user validates that "Yahoo_success_message" is displayed

  Examples: 
	|	Platform	|	First_Name	|	Last_Name |	Email_Address |	Email_Password | Email_Phonenumber | Birth_Day | Birth_Year	|	
	|	Android		|	MeedEmail3 |	Qwerty| meedtestemail03 | Password-123 | 9189518064 | 20 | 1990 |