#Author: akash.deep@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Closure/Account Statuses
#Scenario: #NA
Feature: Validate the behavior of application when user logins when there is different active account locks/status	

@RegressionPack @TC001
Scenario Outline: Verify that the user is not able to login to Meed app when the account status is Frozen Meed
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
  And user validates "Error" field with expected value as "<Error>"
  And user waits for "3" seconds
 And user clicks on button "OK"
 And user waits for "2" seconds
 And user clicks on button "close"
 And user waits for "2" seconds
And user validates "LoginScreenWelcomeMessage" field with expected value as "<WelcomeMessage>"
 


  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    | Error | WelcomeMessage |
    |   Android     |   meluser14@yopmail.com   		|   meluser14 	 |   Tester-1 | Thank you for logging into the Meed Banking Club App. We are currently unable to access your account. Please dial 1(833)-213-6333 to speak with a Customer Service Representative about the status of your account.| Welcome back! |
    
    @RegressionPack @TC002
Scenario Outline: Verify that the user is not able to login to Meed app when the account status is Credit Only Meed
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
And user validates "Error" field with expected value as "<Error>"
  And user waits for "3" seconds
 And user clicks on button "OK"
 And user waits for "2" seconds
 And user clicks on button "close"
 And user waits for "2" seconds
And user validates "LoginScreenWelcomeMessage" field with expected value as "<WelcomeMessage>" 

 


  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |	Error | WelcomeMessage |
    |   Android     |   meluser14@yopmail.com   		|   meluser14 	 |   Tester-1 | Thank you for logging into the Meed Banking Club App. Currently this account is locked due to recent activity. For additional information, please dial 1(833)-213-6333 to speak with a Customer Service Representative.| Welcome back! |