#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Invite Member
#Scenario: #NA
Feature: Invite Friends to Meed
@RegressionPack @TC001+Invite_Friends
Scenario Outline: Verify Meed customer is able to invite friends to Meed app 
Given user launches "Meed" app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user clicks on button "Invite"
 And user validates that "Invite_Members" is displayed
 
 And user clicks on button "Invite_a_friend"
  And user enters text "<Invitees>" in textbox "INVITEES" 
  And user clicks on button "Continue"  
  And user validates that "Invite_new_member" is displayed
  And user clicks on button "Invite"
  And user validates "Success_Message" with expected value as "<ExpectedMessage>"
  
  And user clicks on button "Bring_On_MeedShare"
  And user validates that "MeedShare" is displayed
  
 And user switches to "chrome" app
 And user navigates to "yopmail.com" and go to the account of "<Invitees>"
 And user verify that Email is received from "<Email>" with subject "<Subject>" and content "<ExpectedContent>"
  
  Examples: 
    |   Platform    |   Email                   |   Username     |   Password    |  	Invitees				    | ExpectedMessage 																	| Subject | ExpectedContent |
    |   Android     |   meluser12new@yopmail.com   |   meluser12	 |   Password-1  | 		 user25feb@yopmail.com		| Nice job! You’ll earn a Share for everyone who joins and keeps an active account! | Join Meed, The World's First Digital Banking Club | Hi, you should join the Meed Banking Club, I think you’ll like it. Members get a great way to manage their money straight from their phone, plus there are 3 cash back programs that could help you earn $100s and save $100s – it could be like having an extra paycheck a year! |