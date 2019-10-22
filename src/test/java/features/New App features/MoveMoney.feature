#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Move Money (New App)
#Scenario: #NA
Feature: Move Money new app
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully perform direct deposit 
Given user launches the app in "<Platform>" device
And user waits for "5" seconds
 And user clicks on button "Apply_now"
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
  And user clicks on button "Direct_Deposit"
  And user waits for "2" seconds
  And user clicks on button "CONTINUE"
  And user enters text "Employer" in textbox "Employer_Name"
  And user selects checkbox at index "0"
  # And user selects checkbox "I_agree_to_receive_via_email_a_Direct_Deposit_form_which_includes_my_Employer's_Name,_my_Bank_Account_Number_and_Routing_Number"
    And user waits for "2" seconds
    And user clicks on button "EMAIL_DIRECT_DEPOSIT_FORM"
    And user waits for "2" seconds
    And user clicks on button "Let's_explore_a_bit"
    And user waits for "2" seconds
 

  Examples: 
	|	Platform	|	Email										|	Username			|	Password		|		
	|	Android		|	Meedoct091@yopmail.com	|	Meedoct091		|	Password-1	|	
  
  
  @RegressionPack @TC002
Scenario Outline: Verify Meed customer is able to successfully transfer from other banks 
Given user launches the app in "<Platform>" device
And user waits for "5" seconds
 And user clicks on button "Apply_now"
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
  And user clicks on button "Transfer_From_Other_Banks"
  And user waits for "10" seconds
  And user enters text "<Amount>" in textbox "Make_a_payment"
  And user enters text "<Email>" in textbox "Email_Address"
  And user waits for "2" seconds
  
  Examples: 
	|	Platform	|	Email										|	Username			|	Password		|		Amount	|
	|	Android		|	Meedoct091@yopmail.com	|	Meedoct091		|	Password-1	|		10			|
  
 @RegressionPack @TC003
Scenario Outline: Verify Meed customer is able to successfully deposit from Credit/Debit Card 
Given user launches the app in "<Platform>" device
And user waits for "5" seconds
 And user clicks on button "Apply_now"
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
  And user waits for "10" seconds
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
	|	Platform	|	Email										|	Username			|	Password		|		Amount	|	CardNumber				|
	|	Android		|	Meedoct091@yopmail.com	|	Meedoct091		|	Password-1	|		10			|	4242424242424242	|
	
	
	