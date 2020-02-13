#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Scenario: #NA
Feature: Smoke Testing
@SmokePack @TC001_Invite_Friends
Scenario Outline: Verify Meed customer is able to invite friends to Meed app 
Given user launches the app in "<Platform>" device
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
    |   Android     |   meluser12@yopmail.com   |   meluser12	 |   Password-1  | 		 user23jan@yopmail.com		| Nice job! You’ll earn a Share for everyone who joins and keeps an active account! | Join Meed, The World's First Digital Banking Club | Hi, you should join the Meed Banking Club, I think you’ll like it. Members get a great way to manage their money straight from their phone, plus there are 3 cash back programs that could help you earn $100s and save $100s – it could be like having an extra paycheck a year! |
	
	
	@SmokePack @TC002_Internal_Transfer_DDA_To_SAV
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
	|	Platform	|	Email					|	Username		|	Password	|	 	Amount		|	Note 							              |
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|		1.00		| Testing Checking to Savings transfer Automation |

	
	@SmokePack @TC003_Internal_Transfer_SAV_To_DDA
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Savings to Checkings)
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
  
  @SmokePack @TC004_Scheduled_Payment
Scenario Outline: Verify Meed customer is able to successfully able to move money between accounts (Checkings to Savings)
#Scheduled transfer
Given user launches the app in "<Platform>" device
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
	
	@SmokePack @TC005_Direct_Deposit
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
	
	
	@SmokePack @TC006_Deposit_From_Cards
Scenario Outline: Verify Meed customer is able to successfully deposit from Credit/Debit Card 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"

 And user checks the initial "Balance" of "CHECKING" account
 And user clicks on button "Move_Money"
 And user scrolls down
 And user clicks on button "Credit/Debit_Cards"
 And user clicks on button "Continue_On_Credit/Debit_Card_popup"

 And user enters "<Amount>","<Email>","<CardName>","<CardNumber>","<Expiry>","<SecurityCode>" in paystand and click on "Paystand_Enter_Billing_Information"
 And user enters "<Street>","<City>","<Postal Code>","<State>" in paystand and click on "Pay"
 And user validates "Paystand_Success_Message" with expected value as "<ExpectedMessage>"
  
 And user clicks on button "Done"
 And user waits for "10" seconds
   
 And user clicks on button "Home"
 And user waits for "3" seconds
 And user verify that "Balance" in "CHECKING" account is "credited" by "<Amount>"


  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|		Amount	|	CardNumber			| CardName 			 | Expiry | SecurityCode | ExpectedMessage |
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|		11.50	|	4242424242424242	| TestAutomationCard | 02/28  | 222 | Your money's being moved. |
  
  @SmokePack @TC007_More_EDIT_NICKNAME
Scenario Outline: Verify Meed customer is able to edit Nickname in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"
 And user clicks on button "Personal_Details"
 And user select label "EDIT" at index "1"
 And user enters text "<Nickname>" in textbox "NAME_OR_NICKNAME"  
 And user clicks on button "SAVE"
 And user clicks on button "Back"
 And user clicks on button "Home"
 And user validates "Greetings" field with expected value as "Hi <Nickname>!"

 	

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  Nickname	|
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		AutoNickName		|  
    
    
    @SmokePack @TC008_More_Freeze_Card
 @RegressionPack @TC003_More_Freeze_Card
Scenario Outline: Verify Meed customer is able to view Freeze/Unfreeze Card in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
  And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More" 
 And user clicks on button "Card"
 And user scrolls down 
 And user clicks on label "Freeze_Card"
 And user clicks on button "freeze_Card"
   And user waits for "3" seconds
 And user validates that "Unfreeze_Card" is displayed   
 And user clicks on label "Unfreeze_Card"
 And user clicks on button "Unfreeze_Card"
    And user waits for "3" seconds
 And user validates that "Freeze_Card" is displayed 
  
  Examples: 
    |   Platform    |   Email                   |   Username  |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |  		 
    
    @SmokePack @TC009_More_Report_Stolen
Scenario Outline: Verify Meed customer is able to report Lost/Stolen Card in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"
 And user clicks on button "Card"
 And user scrolls down 
 And user clicks on label "Report_Lost/Stolen"
 And user scrolls down 
 And user clicks on button "CALL_NOW"
 And user clicks on button "Call"
 And user waits for "5" seconds
 And user switches to "Dialer" app
 And user validates "Dialer_digits" with expected value as "<Expected Contact No>"
 
  Examples: 
    |   Platform    |   Email                   |   Username  |   Password   |  	Expected Contact No |
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 (833) 213-6333 | 	 
     
    
     @SmokePack @TC010_More_Contact_preferences
Scenario Outline: Verify Meed customer is able to Change Contact Preferences of Meed Banking Club in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"
 And user scrolls down
 And user clicks on button "Settings"
   
And user clicks on label "Contact_Preferences"
And user scrolls down
And user selects checkbox at index "2"
And user waits for "2" seconds
And user selects checkbox at index "3"
And user waits for "3" seconds
And user validates that "Meed_Banking_Club_Email" is "checked"
And user validates that "Meed_Banking_Club_Push_Notification" is "checked"
  
  Examples: 
    |   Platform    |   Email                   |   Username     |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 	
    
    
    @SmokePack @TC011_Meed_Extras
Scenario Outline: Verify Meed customer is able to view Meed Rewards - Meed Extras in to Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"

 And user clicks on button "Rewards"
 And user validates that "Rewards" is displayed   
  And user clicks on button "MeedExtras"
  And user clicks on button "Okay"
  And user validates that "Featured_Offers" is displayed
  And user validates that "Categories" is displayed  
  And user scrolls down
  And user scrolls down  
  And user clicks on label "See_All_Offers"
  And user validates that "All_deals" is displayed
  And user clicks on button "Back"
  And user clicks on label "See_Nearby_Offers"
  And user clicks on button "Allow_only_while_using_the_app"
  And user validates that "Nearby_Offers" is displayed
  And user validates that "Your_Location" is displayed 
  And user waits for "5" seconds

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 
  
  
     @SmokePack @TC012_Meed_Cover
Scenario Outline: Verify Meed customer is able to view Meed Cover to Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In" 
 And user clicks on button "Rewards"
 And user validates that "Rewards" is displayed  
 And user clicks on button "MeedCover"
 And user clicks on button "View_Policy"
 And user clicks on button "Allow"
 And user validates that "cover_policy.pdf" is displayed
 And user clicks on button "back" 
  
  Examples: 
    |   Platform    |   Email                   |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12    |   Password-1  |  
        
       
    @SmokePack @TC013_Privacy_&_legal
Scenario Outline: Verify Meed customer is able to view legal documents in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"
  And user scrolls down
    And user waits for "2" seconds  
  And user scrolls down
    And user waits for "2" seconds  
  And user scrolls down
    And user waits for "2" seconds  
  And user scrolls down
    And user waits for "2" seconds 
      And user scrolls down
    And user waits for "2" seconds 
  And user clicks on button "Privacy_&_Legal"
  And user clicks on label "Fee_Schedule"
  And user clicks on button "Allow"
  And user validates that "Fee_Scheduletc.pdf" is displayed  
  And user clicks on button "back" 

  And user clicks on label "Funds_Availability_Disclosure"   
  And user validates that "Funds_Availability_Disclosuretc.pdf" is displayed 
  And user clicks on button "back"

  And user clicks on label "Online_Banking_Agreement" 
  And user validates that "Online_Banking_Agreementtc.pdf" is displayed  
  And user clicks on button "back" 
  
  And user clicks on label "Privacy_Notice"  
  And user validates that "Privacy_Noticetc.pdf" is displayed  
  And user clicks on button "back" 
  
  And user clicks on label "Savings_Account_Agreement"  
  And user validates that "Savings_Account_Agreementtc.pdf" is displayed  
  And user clicks on button "back" 

  And user clicks on label "Savings_Truth_In_Savings_Disclosure"  
  And user validates that "Savings_Truth_In_Savings_Disclosuretc.pdf" is displayed  
  And user clicks on button "back" 

  And user clicks on label "Truth_In_Lending_Disclosure_and_Agreement"  
    And user validates that "Truth_In_Lending_Disclosure_and_Agreementtc.pdf" is displayed
  And user clicks on button "back" 
  And user waits for "5" seconds  
  And user scrolls down
  And user waits for "5" seconds  
  And user clicks on label "W-9" 
    And user validates that "W-9tc.pdf" is displayed 
  And user clicks on button "back" 
     
  And user clicks on label "Checking_Account_Agreement"
    And user validates that "Checking_Account_Agreementtc.pdf" is displayed
  And user clicks on button "back"
    
  And user clicks on label "Checking_Truth_In_Savings_Disclosure"
  And user validates that "Checking_Truth_In_Savings_Disclosuretc.pdf" is displayed
  And user clicks on button "back"
  
  And user waits for "5" seconds
  And user scrolls down
  And user waits for "5" seconds
  And user clicks on label "Electronic_Communications"
    And user validates that "Electronic_Communicationstc.pdf" is displayed
  And user clicks on button "back"
  
  And user waits for "5" seconds
  And user scrolls down
  And user waits for "5" seconds
  And user clicks on label "Electronic_Funds_Transfer_Disclosure"
    And user validates that "Electronic_Funds_Transfer_Disclosuretc.pdf" is displayed
  And user clicks on button "back" 

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |  
       
      
  # needs to be updated based upon new binary
   @SmokePack @TC014_P2P_Sent_money
Scenario Outline: Verify Meed customer is able to successfully Pay Friends having Meed membership - Send Money
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
  And user clicks on button "Send_Money"
  And user waits for "2" seconds
  And user clicks on button "Deny"
  

  
  #TO BE COMPLETED

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   recipient               |  Amount  |
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |   meedtest75@yopmail.com  |   10.00          |
    
    
  
@SmokePack @TC016_More_Change_Language
Scenario Outline: Verify Meed customer is able to Change Language to Spanish in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"
 And user scrolls down
 And user clicks on button "Settings"  
And user clicks on label "Change_Language"
And user clicks on label "Espanol"
And user validates that "Cambiar_Idioma" is displayed
And user clicks on button "Back"
And user validates that "Configuración" is displayed
And user validates that "Preferencias_de_contacto" is displayed
And user validates that "Información_de_la_versión" is displayed
And user validates that "Transferencia_automática" is displayed
And user clicks on label "Cambiar_idioma"
And user clicks on label "English"
And user validates that "Change_Language" is displayed
And user clicks on button "Back"
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |  
    