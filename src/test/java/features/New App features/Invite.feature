#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Invite Member
#Scenario: #NA
Feature: Invite Friends to Meed
@RegressionPack @TC001+Invite_Friends
Scenario Outline: Verify Meed customer is able to invite friends to Meed app 
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
 And user clicks on button "Invite"
  And user waits for "2" seconds
 
 And user clicks on button "Invite_a_friend"
  And user waits for "2" seconds
  And user enters text "<Invitees>" in textbox "INVITEES"
 
  And user clicks on button "Continue"
   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                   |   Username     |   Password    |  	Invitees						| 
    |   Android     |   meluser12@yopmail.com   |   meluser12	 |   Password-1  | 		 user@yopmail.com		|