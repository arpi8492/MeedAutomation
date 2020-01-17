#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Login New App
#Scenario: #NA
Feature: Internal Transfer
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to Savings)
#One time transfer
Given user launches the app in "<Platform>" device
  And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
  And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
  And user checks the initial "Available" of "CHECKING" account
  And user checks the initial "Available" of "SAVINGS" account
 And user clicks on button "Move_Money"
  And user scrolls down
  And user scrolls down
  And user scrolls down
  And user clicks on button "Move_Between_Accounts"
  And user scrolls down
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
   And user scrolls down 
  #And user clicks on button "SCHEDULE"
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user clicks on button "Move_money"
  And user clicks on button "Done"
   And user waits for "10" seconds
  And user clicks on button "Home"
   And user waits for "3" seconds
  And user verify that "Available" of "CHECKING" account is reduced by "<Amount>"
  And user verify that "Available" of "SAVINGS" account is increased by "<Amount>"
  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|	 	Amount		|	
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|		1.00		|
	
	
	@RegressionPack @TC002
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Savings to Checkings)
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
    And user clicks on button "Move_Between_Accounts"
  And user waits for "3" seconds

  And user selects option "Savings_Account" from the dropdown "TRANSFER_FROM"
   And user waits for "2" seconds
	And user scrolls down
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
   And user scrolls down
  
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "3" seconds
  And user clicks on button "Done"
  And user waits for "3" seconds
  
  Examples: 
  | Platform  | Email                         | Username        | Password    |   Amount    | 
  | Android   | meluser12@yopmail.com		  | meluser12     | Password-1 |   1.00    	|
  
  
  @RegressionPack @TC003
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to LOC)
#CUSTOM AMOUNT
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
  And user clicks on button "Move_Between_Accounts"
  And user waits for "3" seconds

  And user selects option "Line_Of_Credit" from the dropdown "TRANSFER_TO"
   And user waits for "2" seconds
	And user scrolls down
	And user waits for "2" seconds
	 And user clicks on button "Custom_Amount" 
	
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
   And user scrolls down
  
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "10" seconds
  And user clicks on button "Done"
  And user waits for "3" seconds
  
  Examples: 
  | Platform  | Email                         | Username     | Password   |   Amount    | 
  | Android   | meluser12@yopmail.com		  | meluser12    | Password-1 |   1.00  	  |
  
  
  @RegressionPack @TC004
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to LOC)
#FULL PAYMENT
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
  And user clicks on button "Move_Between_Accounts"
  And user waits for "3" seconds

  And user selects option "Line_Of_Credit" from the dropdown "TRANSFER_TO"
   And user waits for "2" seconds
	And user scrolls down
	And user waits for "2" seconds
	 And user clicks on button "Full_Payment" 
   And user scrolls down
  
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "10" seconds
  And user clicks on button "Done"
  And user waits for "3" seconds
  
  Examples: 
  | Platform  | Email                         | Username        | Password    |   Amount    | 
  | Android   | meluser12@yopmail.com		  | meluser12       | Password-1  |   1.00    |
  
  @RegressionPack @TC005
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to LOC)
#MINIMUM PAYMENT
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
  And user clicks on button "Move_Between_Accounts"
  And user waits for "3" seconds

  And user selects option "Line_Of_Credit" from the dropdown "TRANSFER_TO"
   And user waits for "2" seconds
	And user scrolls down
	And user waits for "2" seconds
	 And user clicks on button "Minimum_Payment" 
   And user scrolls down
  
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "10" seconds
  And user clicks on button "Done"
  And user waits for "3" seconds
  
  Examples: 
  | Platform  | Email                         | Username        | Password    |   Amount    | 
  | Android   | meluser12@yopmail.com         | meluser12       | Password-1  |   1.00    	|
  
  
  
  @RegressionPack @TC006
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to Savings)
#Scheduled transfer
Given user launches the app in "<Platform>" device
And user waits for "15" seconds
  And user clicks on button "Get_started"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
  And user clicks on button "Move_Between_Accounts"
  And user waits for "5" seconds
   And user scrolls down
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
	 And user scrolls down
	  And user clicks on button "SCHEDULE"
  And user selects radio button "Monthly"
  And user clicks on button "EDIT"
  And user waits for "2" seconds
 And user selects "Dec" "02" "2023" from calendar
 And user clicks on button "DONE"
 And user waits for "2" seconds
 And user clicks on button "Continue"
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "10" seconds
  And user clicks on button "Done"
  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password		|	 	Amount		|	
	|	Android		|	meluser12@yopmail.com 	|	meluser12		|	Password-1		|		1.00		|
	