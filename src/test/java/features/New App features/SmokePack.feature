#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 

#Scenario: #NA
Feature: Smoke Testing
@SmokePack @TC001_Invite_Friends
Scenario Outline: Verify Meed customer is able to invite friends to Meed app 
Given user launches the app in "<Platform>" device
And user waits for "15" seconds
 And user clicks on button "Apply_now"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Invite"
  And user waits for "5" seconds
 
 And user clicks on button "Invite_a_friend"
  And user waits for "2" seconds
  And user enters text "<Invitees>" in textbox "INVITEES"
 
  And user clicks on button "Continue"
   And user waits for "5" seconds
  And user clicks on button "Invite" 
   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	Invitees						| 
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! | 		 manojuser3@yopmail.com		|
	
	
	@SmokePack @TC002_Internal_Transfer_DDA_To_SAV
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to Savings))
#One time transfer
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
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
   And user scrolls down
  And user clicks on button "Move_Between_Accounts"
  And user waits for "5" seconds
   And user scrolls down
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
   And user scrolls down
  
  #And user clicks on button "SCHEDULE"
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
And user waits for "3" seconds
  And user clicks on button "Done"
  
  Examples: 
	|	Platform	|	Email													|	Username				|	Password		|	 	Amount	|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189		|	Qwerty123!!	|		1.00		|
	
	@SmokePack @TC003_Internal_Transfer_SAV_To_DDA
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Savings to Checkings))
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
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
   And user scrolls down
   And user scrolls down
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
 And user waits for "5" seconds
  And user clicks on button "Done"
  And user waits for "3" seconds
  
  Examples: 
  | Platform  | Email                         | Username        | Password    |   Amount    | 
  | Android   | manoj.chauhan@prodigylabs.net | mchauhan9189    | Qwerty123!! |   5.00    	|
  
  @SmokePack @TC004_Scheduled_Payment
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to Savings))
#Scheduled transfer
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
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
   And user scrolls down
    And user scrolls down
  And user clicks on button "Move_Between_Accounts"
  And user waits for "5" seconds
   And user scrolls down
  And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_MOVED"
	 And user scrolls down
	  And user clicks on button "SCHEDULE"
  And user selects radio button "Monthly"
  And user clicks on button "EDIT"
  And user waits for "2" seconds
 And user selects "Dec" "23" "2020" from calendar
 And user clicks on button "DONE"
 And user waits for "2" seconds
 And user clicks on button "Continue"
 And user enters text "Testing Internal transfer Automation" in textbox "NOTE"
 And user clicks on button "Confirm_details" 
 And user waits for "3" seconds
 And user clicks on button "Move_money"
 And user waits for "5" seconds
  And user clicks on button "Done"
  
  Examples: 
	|	Platform	|	Email													|	Username				|	Password		|	 	Amount		|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189		|	Qwerty123!!	|		11.00		|
	
	
	
	
	@SmokePack @TC005_Direct_Deposit
Scenario Outline: Verify Meed customer is able to successfully perform direct deposit 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
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
    And user clicks on button "Let_explore_a_bit"
    And user waits for "2" seconds
 

  Examples: 
	|	Platform	|	Email													|	Username				|	Password		|		
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189		|	Qwerty123!!	|	
	
	
	@SmokePack @TC006_Deposit_From_Cards
Scenario Outline: Verify Meed customer is able to successfully deposit from Credit/Debit Card 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
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
	|	Platform	|	Email													|	Username			|	Password			|		Amount	|	CardNumber				|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189		|	Qwerty123!!	|		10			|	4242424242424242	|
  
  
  
  @SmokePack @TC007_More_EDIT_NICKNAME
Scenario Outline: Verify Meed customer is able to edit Nickname in Meed app 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
 And user clicks on button "Apply_now"
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
 And user clicks on button "Personal_Details"
  And user waits for "3" seconds
  And user select label "EDIT" at index "1"
  And user waits for "2" seconds
  And user enters text "<Nickname>" in textbox "NAME_OR_NICKNAME"  
  And user clicks on button "SAVE"
  And user waits for "3" seconds
 	And user clicks on button "Back"
 	And user waits for "2" seconds
 	And user clicks on button "Home"
 	And user waits for "5" seconds
 	And user validates "Greetings" field with expected value as "Hi <Nickname>!"
 	And user waits for "2" seconds
 	

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  Nickname	|
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! | 		Manoj		|
    
    
    
    @SmokePack @TC008_More_Freeze_Card
Scenario Outline: Verify Meed customer is able to view Freeze/Unfreeze Card in Meed app 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
 And user clicks on button "Apply_now"
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
 
 And user clicks on button "Card"
  And user waits for "2" seconds
  And user scrolls down 
  And user clicks on label "Freeze_Card"
   And user waits for "2" seconds
   And user clicks on button "freeze_Card"
   And user waits for "4" seconds
  
  And user clicks on label "Unfreeze_Card"
   And user waits for "1" seconds
   And user clicks on button "Unfreeze_Card"
   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! | 		 
    
    @SmokePack @TC009_More_Report_Stolen
Scenario Outline: Verify Meed customer is able to report Lost/Stolen Card in Meed app 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
 And user clicks on button "Apply_now"
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
 
 And user clicks on button "Card"
  And user waits for "2" seconds
  And user scrolls down 
  And user clicks on label "Report_Lost/Stolen"
   And user waits for "2" seconds
   And user scrolls down 
   And user clicks on button "CALL_NOW"
   And user waits for "1" seconds

   And user clicks on button "Call"
   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! | 		 
 
 
   
      
    
     @SmokePack @TC010_More_Contact_preferences
Scenario Outline: Verify Meed customer is able to Change Contact Preferences in Meed app 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
 And user clicks on button "Apply_now"
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
  
  And user clicks on label "Contact_Preferences"
   And user waits for "2" seconds
And user scrolls down
And user scrolls down
And user selects checkbox at index "2"

  And user waits for "3" seconds
And user selects checkbox at index "3"

And user clicks on button "Back"
And user waits for "3" seconds

  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! | 	
    
    
    @SmokePack @TC011_Meed_Extras
Scenario Outline: Verify Meed customer is able to view Meed Rewards to Meed app 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
 And user clicks on button "Apply_now"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Rewards"
  And user waits for "2" seconds
 
  And user clicks on button "MeedExtras"
  And user clicks on button "Okay"
  
  And user scrolls down
  And user scrolls down
  And user clicks on label "See_All_Offers"
  And user waits for "3" seconds
  And user scrolls down
  And user scrolls down
   And user clicks on button "Back"
   And user waits for "3" seconds
   And user clicks on label "See_Nearby_Offers"
 
  And user waits for "5" seconds

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! | 
  
  
     @SmokePack @TC012_Meed_Cover
Scenario Outline: Verify Meed customer is able to view Meed Cover to Meed app 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
 And user clicks on button "Apply_now"
 And user waits for "3" seconds
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
 And user clicks on button "Rewards"
  And user waits for "2" seconds
 
 And user clicks on button "MeedCover"
  And user waits for "2" seconds
  And user clicks on button "View_Policy"
   And user waits for "2" seconds
   And user clicks on button "Allow"
   And user waits for "2" seconds
   And user scrolls down
   And user scrolls down
   And user scrolls down
   
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! |  
    
    
       
    @SmokePack @TC013_Privacy_&_legal
Scenario Outline: Verify Meed customer is able to view legal documents in Meed app 
Given user launches the app in "<Platform>" device

And user waits for "10" seconds
 And user clicks on button "Apply_now"
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
  And user scrolls down
  And user scrolls down
  And user clicks on button "Privacy_&_Legal"
  And user waits for "25" seconds
  
  And user clicks on label "Checking_Account_Agreement"
  And user clicks on button "Allow"
  And user waits for "2" seconds
  And user clicks on button "back"
  
  
 # And user presses device "BACK" button
  And user waits for "5" seconds
   And user clicks on label "Checking_Truth_In_Savings_Disclosure"
  # And user scrolls down
 # And user scrolls down
 And user waits for "2" seconds
  And user clicks on button "back"
  
   And user waits for "2" seconds
   And user clicks on label "Electronic_Communications"
  And user clicks on button "back"
  
   And user waits for "2" seconds
   And user clicks on label "Electronic_Funds_Transfer_Disclosure"
 And user clicks on button "back"
  And user waits for "2" seconds
  And user scrolls down
  
  And user clicks on label "Fee_Schedule"
   And user waits for "2" seconds
  And user clicks on button "back" 
  And user waits for "2" seconds
  
  And user scrolls down
 
  And user clicks on label "Funds_Availability_Disclosure"
    And user waits for "2" seconds
  And user clicks on button "back" 
   And user waits for "2" seconds
   
  And user scrolls down

  And user clicks on label "Online_Banking_Agreement"  
   And user waits for "2" seconds
  And user clicks on button "back" 
   And user waits for "2" seconds
  And user scrolls down
 
  And user clicks on label "Privacy_Notice"  
   And user waits for "2" seconds
  And user clicks on button "back" 
   And user waits for "2" seconds
  And user scrolls down

  And user clicks on label "Savings_Truth_In_Savings_Disclosure"  
     And user waits for "2" seconds
  And user clicks on button "back" 
   And user waits for "2" seconds
  And user scrolls down

  And user clicks on label "Truth_In_Lending_Disclosure_and_Agreement"  
     And user waits for "2" seconds
  And user clicks on button "back" 
   And user waits for "2" seconds
  And user scrolls down
 
  And user clicks on label "W-9"  
     And user waits for "2" seconds
  And user clicks on button "back" 
  
  And user waits for "10" seconds

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! |
       
      
  # needs to be updated based upon new binary
   @SmokePack @TC014_P2P_Sent_money
Scenario Outline: Verify Meed customer is able to successfully Pay Friends having Meed membership - Send Money
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
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
  And user clicks on button "Send_Money"
  And user waits for "2" seconds
  And user clicks on button "Deny"
  

  
  #TO BE COMPLETED

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   recipient               |  Amount  |
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! |   meedtest75@yopmail.com  |   10.00          |
    
    
  
@SmokePack @TC016_More_Change_Language
Scenario Outline: Verify Meed customer is able to Change Language to Spanish in Meed app 
Given user launches the app in "<Platform>" device
And user waits for "10" seconds
 And user clicks on button "Apply_now"
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
  
  And user clicks on label "Change_Language"
   And user waits for "2" seconds

  And user clicks on label "Espanol"
   And user waits for "1" seconds

   And user clicks on button "Back"
   And user clicks on label "Cambiar_idioma"
   And user waits for "2" seconds

  And user clicks on label "English"
   And user clicks on button "Back"
   And user waits for "5" seconds
   
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   manoj.chauhan@prodigylabs.net   |   mchauhan9189 |   Qwerty123!! | 
    