#Author: meluser12@yopmail.com
#Keywords Summary : Android Automation 
#Feature: More Section in New meed App
#Scenario: #NA
Feature: Validate More Menu options in New Meed App

@RegressionPack @TC001_More_EDIT_NICKNAME
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


@RegressionPack @TC002_More_Account_Details
Scenario Outline: Verify Meed customer is able to view Account Details in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"
 
 And user clicks on button "Account_Details"
 And user validates that "ACCOUNT_NUMBER" is displayed
 And user validates that "BANK_ROUTING_NUMBER" is displayed
 And user validates that "INVITER'S_EMAIL" is displayed
 And user scrolls down 
 And user validates that "MEMBER_SINCE" is displayed
 And user clicks on button "Back"
  
  Examples: 
    |   Platform    |   Email                   |   Username     |   Password    |  
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 
   
 
 
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
    
    @RegressionPack @TC004_More_Report_Stolen
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
 
 
 @RegressionPack @TC005_More_Replace_Card
Scenario Outline: Verify Meed customer is able to Replace Card in Meed app 
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
 And user clicks on label "Replace_Card"
 And user clicks on button "CALL_NOW"
 And user clicks on button "Call"
 And user waits for "5" seconds
 And user switches to "Dialer" app
 And user validates "Dialer_digits" with expected value as "<Expected Contact No>"
  
  Examples: 
    |   Platform    |   Email                   |   Username   |   Password    |  	Expected Contact No |
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |(833) 213-6333 |
 
 
 
 @RegressionPack @TC006_More_Card_PIN
Scenario Outline: Verify Meed customer is able to call customer care for Card PIN issues in Meed app 
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
 And user clicks on label "Card_PIN"
 And user clicks on button "CALL_NOW"
 And user clicks on button "Call"
 And user waits for "5" seconds
 And user switches to "Dialer" app
 And user validates "Dialer_digits" with expected value as "<Expected Contact No>"
 
  Examples: 
    |   Platform    |   Email                   |   Username     |   Password    |  	Expected Contact No |
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 	(833) 213-6333 |	 
 
@RegressionPack @TC007_More_Statements
Scenario Outline: Verify Meed customer is able to view Statements in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"

 And user clicks on button "Statements"
 And user validates that "Statements" is displayed
 And user scrolls down 
 And user clicks on button "Back"
  
  Examples: 
    |   Platform    |   Email                   |   Username     |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		   
    
    
@RegressionPack @TC008_More_Change_Language
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
    
    
    @RegressionPack @TC009_More_Contact_preferences
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
    
    
@RegressionPack @TC010_More_Version_Info
Scenario Outline: Verify Meed customer is able to view App version info in Meed app 
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
 And user clicks on label "Version_Info"
 And user validates that "VERSION" is displayed
 And user validates that "RELEASE_DATE" is displayed
And user clicks on button "Back"
And user waits for "3" seconds

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 
    
    
    
#@RegressionPack @TC001_More_Version_Info
#Scenario Outline: Verify Meed customer is able to view App version info in Meed app 
#Given user launches the app in "<Platform>" device
#And user waits for "5" seconds
# And user clicks on button "Get_started"
# And user waits for "3" seconds
# And user enters text "<Email>" in textbox "Your_email"
# And user clicks on button "Continue"
# And user waits for "2" seconds
# And user enters text "<Username>" in textbox "Username"
# And user enters text "<Password>" in textbox "Password"
# And user clicks on button "Log_In"
# And user waits for "5" seconds
# And user clicks on button "More"
#  And user waits for "2" seconds
#And user scrolls down
#  And user scrolls down
#  And user scrolls down
#  
# And user clicks on button "Privacy_&_Legal"
#  And user waits for "20" seconds
#    And user scrolls down
#     And user waits for "5" seconds
# And user clicks on label "Checking_Account_Agreement" 
# And user clicks on button "Back"
# 
#  Examples: 
#    |   Platform    |   Email                           |   Username     |   Password    |  Nickname	|
#    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		Manoj		|    
    
@RegressionPack @TC001_Privacy_&_legal
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
 
    
   @RegressionPack @TC001_Message_Center
Scenario Outline: Verify Meed customer is able view Message Center in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "More"
   And user waits for "2" seconds
  And user scrolls down
  And user waits for "2" seconds
  And user scrolls down
  And user waits for "2" seconds
  And user scrolls down
  And user waits for "2" seconds
  And user scrolls down
  And user waits for "2" seconds
  And user clicks on button "Message_Center"
  And user validates that "Message_Center" is displayed
  And user clicks on button "Back"

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |   
    

@RegressionPack @TC001_SweepToggle_ON
Scenario Outline: Verify that the user is able to Turn the Sweep Toggle 'on' in the app
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
 And user clicks on button "More"
  And user waits for "2" seconds
  And user scrolls down
  And user clicks on button "Settings"
  And user waits for "2" seconds
  And user clicks on button "Sweep"
  And user waits for "2" seconds
  And user selects checkbox "Slide_to_turn_Sweep_OFF/ON"
  And user clicks on button "Save_Changes"
  And user clicks on button "OK"
  And user validates that "Slide_to_turn_Sweep_OFF/ON" is "checked"
  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|	 	Amount		|	
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|		999.00		|
	
@TC001_Contact_Us
Scenario Outline: Verify Meed customer is able to use Contact Us functionality
Given user launches the app in "<Platform>" device
And user clicks on button "Get_started"
And user enters text "<Email>" in textbox "Your_email"
And user clicks on button "Continue"
And user enters text "<Username>" in textbox "Username"
And user enters text "<Password>" in textbox "Password"
And user clicks on button "Log_In"
And user clicks on button "More"
  And user waits for "2" seconds
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
And user clicks on button "Contact_Us"
And user clicks on button "How_do_I_make_a_transfer"
And user validates "Great_question" with expected value as "<Answer1>"
And user validates "An_Internal_Transfer" with expected value as "<Answer2>"
And user validates "A_P2P_or_Send/Receive_Money_Transfer" with expected value as "<Answer3>"
      
 Examples: 
|	Platform	|	Email					|	Username		|	Password	| Answer1 |	Answer2 | Answer3 |
|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	| Great question, to make a transfer you must first select the type of transfer you would like to make from the options under move money at the bottom of the home page. | An Internal Transfer is used to transfer between your Meed accounts. To do an internal transfer, select the From & To accounts then tap Next and complete the remaining fields. When done, tap Next and then Confirm the transfer. | A P2P or Send/Receive Money Transfer is used to transfer between your Meed account and another Meed Member. The guided prompts are easy and simple to follow. |

@TC001_Update_Phone_Number
Scenario Outline: Validate that user is successfully able to update the phone number in the app
Given user launches the app in "<Platform>" device
And user clicks on button "Get_started"
And user enters text "<Email>" in textbox "Your_email"
And user clicks on button "Continue"
And user enters text "<Username>" in textbox "Username"
And user enters text "<Password>" in textbox "Password"
And user clicks on button "Log_In"
And user waits for "5" seconds
And user clicks on button "More"
And user waits for "10" seconds
And user clicks on button "Personal_Details"
And user scrolls down
And user waits for "5" seconds
And user scrolls down
And user clicks on button "PHONE_NUMBER_EDIT"
And user enters text "<Phone_Number>" in textbox "New_Phone_Number"
And user enters text "<Work_Phone_Number>" in textbox "New_Work_Phone_Number"
And user clicks on button "Save"
 And user switches to "LG Messaging" app
 And user enters "authorization code" in meed app
 And user validates "Mobile_Phone_Number" with expected value as "<Expected Mobile Phone Number>"
 And user scrolls down
 And user validates "Work_Phone_Number" with expected value as "<Expected Work Phone Number>"

Examples: 
|	Platform	|	Email					|	Username		|	Password	| Phone_Number     | Work_Phone_Number | Expected Mobile Phone Number | Expected Work Phone Number |
|	Android		|	meedtest80@yopmail.com	|	Meedtest80		|	Password-1	| (918) 951-8064   | (918) 951-8081 | +19189518064 | +19189518081 |

@RegressionPack @TC001.1_More_Update_Email
Scenario Outline: Verify Meed customer is able to update email id in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "8" seconds
 And user clicks on button "More"
 And user waits for "3" seconds
 And user clicks on button "Personal_Details"
  And user waits for "3" seconds
 And user select label "EDIT" at index "3"
 And user enters text "<NewEmail>" in textbox "NEW_EMAIL"
 And user enters text "<NewEmail>" in textbox "CONFIRM_EMAIL"
 And user clicks on button "SAVE"
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 And user waits for "8" seconds
 And user validates "EMAIL_ID" with expected value as "<NewEmail>"
  And user waits for "2" seconds

  Examples: 
    |   Platform    |   Email                    |   Username  |   Password   |  NewEmail	|
    |   Android     |   meluser12new@yopmail.com   |   meluser12 |   Password-1 | meluser12@yopmail.com		| 

@RegressionPack @TC001.1_More_Update_Address
Scenario Outline: Verify Meed customer is able to update Address in Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "8" seconds
 And user clicks on button "More"
 And user waits for "3" seconds
 And user clicks on button "Personal_Details"
 And user waits for "3" seconds
 And user select label "EDIT" at index "2"
 And user enters text "<Address Line>" in textbox "ADDRESS_LINE"
 And user enters text "<City>" in textbox "CITY"
 And user clicks on button "STATE"
 And user clicks on button "Alaska"
 And user enters text "<ZIP CODE>" in textbox "ZIP_CODE"
  And user waits for "8" seconds
 And user clicks on button "SAVE"
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 And user waits for "8" seconds
 And user validates "STREET_ADDRESS_Line1" with expected value as "<Address Line>"
 And user validates "STREET_ADDRESS_Line2" with expected value as "<City>,"
 And user waits for "2" seconds

  Examples: 
    |   Platform    |   Email                    |   Username  |   Password   |  Address Line	    | City   | State  | ZIP CODE    |
    |   Android     |   meluser12new@yopmail.com |   meluser12 |   Password-1 | 123 Automation St	| Appium | Alaska | 73006-8011	 |
