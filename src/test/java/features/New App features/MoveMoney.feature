#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Move Money (New App)
#Scenario: #NA
Feature: Move Money new app
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully perform direct deposit 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"

 And user clicks on button "Move_Money"
 And user clicks on button "Direct_Deposit"
 And user validates that "Direct_Deposit" is displayed
 And user clicks on button "Continue"
 And user enters text "Employer" in textbox "Employer_Name"
 And user selects checkbox at index "0"
 # And user selects checkbox "I_agree_to_receive_via_email_a_Direct_Deposit_form_which_includes_my_Employer's_Name,_my_Bank_Account_Number_and_Routing_Number"
 And user clicks on button "Email_Direct_Deposit_Form"
 And user validates that "Thank_you" is displayed
 And user clicks on button "Let's_Explore_A_Bit"
 And user waits for "2" seconds
  
 And user switches to "chrome" app
 And user navigates to "yopmail.com" and go to the account of "<Email>"
 And user verify that Email is received from "Meed" with subject "<Subject>" and content "<ExpectedContent>"
 
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	| Subject | ExpectedContent |
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	| Fund Your Meed Account |	Direct Deposit Form |
  
  
  @RegressionPack @TC002
Scenario Outline: Verify Meed customer is able to successfully transfer from other banks 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user checks the initial "Balance" of "CHECKING" account
 And user clicks on button "Move_Money"
 And user clicks on button "Transfer_From_Other_Banks"
 And user clicks on button "eCheck_from_other_bank"
 And user clicks on button "Continue"
 And user validates that "Transfer_From_Other_Bank" is displayed
 #And user waits for "30" seconds
 And user enters text "<Email>" in textbox "Email_Address"
 And user enters text "<Amount>" in textbox "Make_a_payment" 
 And user enters text "Charles Schwab" in textbox "Search_Banks" 
 And user validates that "Charles_Schwab" is displayed
 And user clicks on button "Next"
 
 And user clicks on "Secure_Login" after entering "<Paystand_Username>" in "Paystand_Username" and "<Paystand_Password>" in "Paystand_Password"  
 And user enters answers to security questions and select "CHECKING" account for Payment
 And user enters "<Street>","<City>","<Postal Code>","<State>" in paystand and click on "Pay"
 And user validates "Paystand_Success_Message" with expected value as "<ExpectedMessage>"
 
 And user clicks on button "Done"
 And user waits for "10" seconds
   
 And user clicks on button "Home"
 And user waits for "3" seconds
 And user verify that "Balance" in "CHECKING" account is "credited" by "<Amount>"
   
  Examples: 
	|	Platform	|	Email						|	Username		|	Password	|		Amount		| Paystand_Username | Paystand_Password | ExpectedMessage |
	|	Android		|	meluser1update@yopmail.com	|	meluser1		|	Password@1	|		22.20		| paystand_test    | paystand_good |  Your money's being moved. |
  
 @RegressionPack @TC003
Scenario Outline: Verify Meed customer is able to successfully deposit from Credit/Debit Card 
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
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
  And user clicks on button "Credit/Debit_Cards"
    And user waits for "2" seconds
   # And user clicks on button "Continue_1"
   And user clicks on button at index "1"
  And user waits for "5" seconds
  And user enters text "<Amount>" in textbox "Make_a_payment"  
  And user enters text "<Email>" in textbox "Email_Address"
  And user enters text "Manoj" in textbox "Name_on_Card"
  And user enters text "<CardNumber>" in textbox "Card_Number"
  And user enters text "01/22" in textbox "MM/YY"
  And user enters text "111" in textbox "CSC"
  And user scrolls down
  And user clicks on button "Enter_Billing_Information"
   And user waits for "3" seconds
  And user enters text "81 street" in textbox "Street"
  And user enters text "Tulsa" in textbox "City"
  And user enters text "11111" in textbox "Postal_Code"
  And user enters text "Oklahoma" in textbox "State"  
  And user scrolls down
  And user waits for "2" seconds
  And user clicks on button "Pay"
   And user waits for "10" seconds
  And user clicks on button "DONE"
  And user waits for "2" seconds    


  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|		Amount	|	CardNumber			|
	|	Android		|	meluser1update@yopmail.com	|	meluser1		|	Password@1	|		10		|	4242424242424242	|
	

	@RegressionPackTC004
Scenario Outline: Verify that the user is able to select 'E-Transfer' from other bank option 
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
 And user clicks on button "Move_Money"
  And user waits for "2" seconds
  And user scrolls down
  And user clicks on button "Transfer_From_Other_Banks"
   And user waits for "5" seconds
   And user clicks on button "eTransfer_from_other_bank"
   And user clicks on button "Continue"  
	#Need to write verification method

  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|
	|	Android		|	meluser12@yopmail.com	|	meluser14		|	Password-1	|
	
	
	
	