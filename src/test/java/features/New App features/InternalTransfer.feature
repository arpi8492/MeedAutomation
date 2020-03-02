#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Login New App
#Scenario: #NA
Feature: Internal Transfer
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to Savings)
#One time transfer
Given user launches "Meed" app in "<Platform>" device
  And user clicks on button "Get_started"
  And user enters text "<Email>" in textbox "Your_email"
  And user clicks on button "Continue"
  And user enters text "<Username>" in textbox "Username"
  And user enters text "<Password>" in textbox "Password"
  And user clicks on button "Log_In"
  
  And user checks the initial "Available" of "CHECKING" account
  And user checks the initial "Available" of "SAVINGS" account
  And user clicks on button "Move_Money"
  #And user scrolls down to "Move_Between_Accounts" 
  And user scrolls down
  And user scrolls down
  And user clicks on button "Move_Between_Accounts"
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
  And user scrolls down
  And user enters text "<Note>" in textbox "NOTE"
  And user clicks on button "Confirm_details" 
  And user clicks on button "Move_money"
  And user clicks on button "Done"
  And user waits for "10" seconds
   
  And user clicks on button "Home"
  And user waits for "3" seconds
  And user verify that "Available" in "CHECKING" account is "debited" by "<Amount>"
  And user verify that "Available" in "SAVINGS" account is "credited" by "<Amount>"
  And user clicks on button "CHECKING"
  And user verify that "Debit" transaction is listed in the transaction history of "CHECKING" account with note "<Note>" and amount "<Amount>"
  And user clicks on button "Back"
  And user scrolls down
  And user clicks on button "SAVINGS" 
  And user clicks on button "History" 
  And user verify that "Credit" transaction is listed in the transaction history of "SAVINGS" account with note "<Note>" and amount "<Amount>"
  
  Examples: 
	|	Platform	|	Email						|	Username	|	Password	|	 	Amount		|	Note 							              |
	|	Android		|	meeduat54update@yopmail.com	|	Meeduat54	|	Password@1	|		1.00		| Testing Checking to Savings transfer Automation |
	
	
	@RegressionPack @TC002
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Savings to Checkings)
Given user launches "Meed" app in "<Platform>" device
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
  And user waits for "5" seconds
  And user clicks on button "Move_Between_Accounts"
  And user selects option "Savings_Account" from the dropdown "TRANSFER_FROM"
  And user scrolls down
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
  And user scrolls down
  
  And user enters text "<Note>" in textbox "NOTE"
  And user clicks on button "Confirm_details" 
  And user clicks on button "Move_money"
  And user clicks on button "Done"
  And user waits for "5" seconds
  
  And user clicks on button "Home"
  And user waits for "3" seconds
  And user verify that "Available" in "SAVINGS" account is "debited" by "<Amount>"
  And user verify that "Available" in "CHECKING" account is "credited" by "<Amount>"
  And user clicks on button "CHECKING"
  And user verify that "Credit" transaction is listed in the transaction history of "CHECKING" account with note "<Note>" and amount "<Amount>"
  And user clicks on button "Back"
  And user scrolls down
  And user clicks on button "SAVINGS" 
  And user clicks on button "History" 
  And user verify that "Debit" transaction is listed in the transaction history of "SAVINGS" account with note "<Note>" and amount "<Amount>"
  
  Examples: 
  | Platform  | Email                         | Username        | Password    	|   Amount      | Note 											  |
  | Android   | meluser12@yopmail.com		  | meluser12       | Password-1    |   1.10    	| Testing Savings to Checking transfer Automation |
  
  
  @RegressionPack @TC003
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to LOC)
#CUSTOM AMOUNT
Given user launches "Meed" app in "<Platform>" device
  And user clicks on button "Get_started"
  And user enters text "<Email>" in textbox "Your_email"
  And user clicks on button "Continue"
  And user enters text "<Username>" in textbox "Username"
  And user enters text "<Password>" in textbox "Password"
  And user clicks on button "Log_In"
  
  And user checks the initial "Available" of "CHECKING" account
  And user checks the initial "Available" of "LINE OF CREDIT" account
  And user clicks on button "Move_Money"
  And user scrolls down
  And user scrolls down
  And user scrolls down
  And user clicks on button "Move_Between_Accounts" 

  And user selects option "Line_Of_Credit" from the dropdown "TRANSFER_TO"
  And user scrolls down
  And user clicks on button "Custom_Amount" 	
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
  And user scrolls down
  
  And user enters text "<Note>" in textbox "NOTE"
  And user clicks on button "Confirm_details" 
  And user clicks on button "Move_money"
  And user clicks on button "Done"
  And user waits for "5" seconds
  
  And user clicks on button "Home"
  And user waits for "3" seconds
  And user verify that "Available" in "CHECKING" account is "debited" by "<Amount>"
  And user verify that "Available" in "LINE OF CREDIT" account is "credited" by "<Amount>"
  And user clicks on button "CHECKING"
  And user verify that "Debit" transaction is listed in the transaction history of "CHECKING" account with note "<Note>" and amount "<Amount>"
  And user clicks on button "Back"
  And user clicks on button "LINE_OF_CREDIT" 
  And user scrolls down
  And user verify that "Credit" transaction is listed in the transaction history of "LINE OF CREDIT" account with note "<Note>" and amount "<Amount>"
  
  
  Examples: 
  | Platform  | Email                         | Username     | Password   |   Amount      | Note |
  | Android   | meluser1update@yopmail.com		  | meluser1    | Password@1 |   1.25  	  | Testing Checking to LOC Custom amount transfer Automation |
  
  
  @RegressionPack @TC004
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to LOC)
#FULL PAYMENT
Given user launches "Meed" app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"

 And user checks the initial "Available" of "CHECKING" account
 And user checks the initial "Available" of "LINE OF CREDIT" account
 And user clicks on button "Move_Money"
 And user scrolls down
 And user scrolls down
 And user scrolls down
 And user clicks on button "Move_Between_Accounts"

 And user waits for "3" seconds
 And user selects option "Line_Of_Credit" from the dropdown "TRANSFER_TO"
 And user scrolls down
  And user waits for "2" seconds
 And user clicks on button "Full_Payment" 
 And user checks "Full_Payment" amount  
 And user scrolls down
  
 And user enters text "<Note>" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user clicks on button "Move_money"
 And user clicks on button "Done"
 And user waits for "3" seconds
 
  And user clicks on button "Home"
  And user waits for "3" seconds
  And user verify that "Available" in "CHECKING" account is "debited" by "<Amount>"
  And user verify that "Available" in "LINE OF CREDIT" account is "credited" by "<Amount>"
  And user clicks on button "CHECKING"
  And user verify that "Debit" transaction is listed in the transaction history of "CHECKING" account with note "<Note>" and amount "Full_Payment"
  And user clicks on button "Back"
  And user clicks on button "LINE_OF_CREDIT" 
  And user scrolls down
  And user verify that "Credit" transaction is listed in the transaction history of "LINE OF CREDIT" account with note "<Note>" and amount "Full_Payment"
  
  Examples: 
  | Platform  | Email                         	  | Username       | Password    | Note |
  | Android   | meluser1update@yopmail.com		  | meluser1       | Password@1  | Testing Checking to LOC Full Payment transfer Automation |
  
  @RegressionPack @TC005
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to LOC)
#MINIMUM PAYMENT
Given user launches "Meed" app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user checks the initial "Available" of "CHECKING" account
 And user checks the initial "Available" of "LINE OF CREDIT" account
 And user clicks on button "Move_Money"
 And user scrolls down
 And user scrolls down
 And user scrolls down
 And user clicks on button "Move_Between_Accounts"
 
 And user waits for "3" seconds
 And user selects option "Line_Of_Credit" from the dropdown "TRANSFER_TO"
 And user scrolls down
 And user waits for "2" seconds
 And user clicks on button "Minimum_Payment" 
  And user checks "Minimum_Payment" amount 
 And user scrolls down
  
 And user enters text "<Note>" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "10" seconds
 And user clicks on button "Done"
 And user waits for "3" seconds
 
  And user clicks on button "Home"
  And user waits for "3" seconds
  And user verify that "Available" in "CHECKING" account is "debited" by "<Amount>"
  And user verify that "Available" in "LINE OF CREDIT" account is "credited" by "<Amount>"
  And user clicks on button "CHECKING"
  And user verify that "Debit" transaction is listed in the transaction history of "CHECKING" account with note "<Note>" and amount "Minimum_Payment"
  And user clicks on button "Back"
  And user clicks on button "LINE_OF_CREDIT" 
  And user scrolls down
  And user verify that "Credit" transaction is listed in the transaction history of "LINE OF CREDIT" account with note "<Note>" and amount "Minimum_Payment"
 
  
  Examples: 
  | Platform  | Email                         | Username        | Password    |  Note |
  | Android   | meluser12@yopmail.com         | meluser12       | Password-1  | Testing Checking to LOC Minimum Payment transfer Automation |
  
  
  
  @RegressionPack @TC006
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to Savings)
#Scheduled transfer
Given user launches "Meed" app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user clicks on button "Move_Money"
 And user scrolls down
 And user scrolls down
 And user scrolls down
 And user clicks on button "Move_Between_Accounts"
 And user scrolls down
 And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
 And user scrolls down
 And user clicks on button "SCHEDULE"
 And user selects radio button "<Frequency>"
 And user clicks on button "EDIT"
 And user waits for "2" seconds
 And user selects "Jan" "22" "2020" from calendar
 And user clicks on button "DONE"
 And user clicks on button "Continue"
 And user enters text "<Note>" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "10" seconds
 And user clicks on button "View_Scheduled_Tranfers"
 And user waits for "5" seconds
  
 And user verify that transfer is scheduled on "<Frequency>" basis from "Checking to Savings" for amount "<Amount>" with "<Note>"
  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password		|	 	Amount		| Frequency |	Note |
	|	Android		|	meluser12@yopmail.com 	|	meluser12		|	Password-1		|		1.00		| Monthly 	| Testing Internal transfer Automation |
	
@RegressionPack @TC001_Akash
Scenario Outline: Verify that the user gets valid error message when the user is performing internal transfer from DDA to SAV more than available balance
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
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
   And user scrolls down
  And user clicks on button "Move_Between_Accounts"
  And user waits for "5" seconds
   And user scrolls down
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
  And user validates "InsufficientFundsError" field with expected value as "<Error>"
   #
  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|	 	Amount		|	Error	|
	|	Android		|	meluser14@yopmail.com	|	meluser14		|	Tester-1	|		999.00		|	There are insufficient funds available to make the requested transfer.|
	
	