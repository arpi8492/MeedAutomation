#Author: meluser12@yopmail.com
#Keywords Summary : Android Automation 
#Feature: More Section in New meed App
#Scenario: #NA
Feature: Validate More Menu options in New Meed App

@RegressionPack @TC001_More_EDIT_NICKNAME
Scenario Outline: Verify Meed customer is able to edit Nickname in Meed app 
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
 And user clicks on button "Personal_Details"
  And user waits for "3" seconds
  And user select label "EDIT" at index "1"
  And user waits for "2" seconds
  And user enters text "<Nickname>" in textbox "NAME_OR_NICKNAME"  
    And user waits for "3" seconds
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
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		AutoNickName		| 


@RegressionPack @TC001.1_More_Update_Email
Scenario Outline: Verify Meed customer is able to update email id in Meed app 
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

 And user clicks on button "Personal_Details"
  And user waits for "3" seconds
  And user scrolls down
  And user scrolls down
  And user select label "EDIT" at index "3"
  And user waits for "2" seconds
  And user enters text "<NewEmail>" in textbox "NEW_EMAIL"
  And user enters text "<NewEmail>" in textbox "CONFIRM_EMAIL"
  And user clicks on button "SAVE"
  And user waits for "10" seconds
 	#OTP Journey
 	
   
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  NewEmail	|
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		autoemail@yopmail.com		| 



@RegressionPack @TC002_More_Account_Details
Scenario Outline: Verify Meed customer is able to view Account Details in Meed app 
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
 
 And user clicks on button "Account_Details"
  And user waits for "2" seconds
  And user scrolls down 
  And user clicks on button "Back"

   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 
   
 
 
 @RegressionPack @TC003_More_Freeze_Card
Scenario Outline: Verify Meed customer is able to view Freeze/Unfreeze Card in Meed app 
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
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 
    
    @RegressionPack @TC004_More_Report_Stolen
Scenario Outline: Verify Meed customer is able to report Lost/Stolen Card in Meed app 
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
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 
 
 
 
 
 @RegressionPack @TC005_More_Replace_Card
Scenario Outline: Verify Meed customer is able to Replace Card in Meed app 
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
 
 And user clicks on button "Card"
  And user waits for "2" seconds
  And user scrolls down 
  And user clicks on label "Replace_Card"
   And user waits for "2" seconds

   And user clicks on button "CALL_NOW"
   And user waits for "1" seconds

   And user clicks on button "Call"
   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |
 
 
 
 @RegressionPack @TC006_More_Card_PIN
Scenario Outline: Verify Meed customer is able to call customer care for Card PIN issues in Meed app 
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
 
 And user clicks on button "Card"
  And user waits for "2" seconds
  And user scrolls down 
  And user clicks on label "Card_PIN"
   And user waits for "2" seconds

   And user clicks on button "CALL_NOW"
   And user waits for "1" seconds

   And user clicks on button "Call"
   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 
 
 
    
    
    @RegressionPack @TC007_More_Statements
Scenario Outline: Verify Meed customer is able to view Statements in Meed app 
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
 
 And user clicks on button "Statements"
  And user waits for "2" seconds
  And user scrolls down 
  And user clicks on button "Back"
   And user waits for "5" seconds
  
  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  	
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		
    
    
    
    
    @RegressionPack @TC008_More_Change_Language
Scenario Outline: Verify Meed customer is able to Change Language to Spanish in Meed app 
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
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |  
    
    
    @RegressionPack @TC009_More_Contact_preferences
Scenario Outline: Verify Meed customer is able to Change Contact Preferences in Meed app 
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
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 | 		 
    
    
    @RegressionPack @TC010_More_Version_Info
Scenario Outline: Verify Meed customer is able to view App version info in Meed app 
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
  
  And user clicks on label "Version_Info"
  And user waits for "3" seconds
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
 And user clicks on button "More"
  And user waits for "2" seconds
  And user scrolls down
  And user scrolls down
  And user scrolls down
  And user clicks on button "Privacy_&_Legal"
  And user waits for "15" seconds
     
  And user clicks on label "Fee_Schedule"
  And user clicks on button "Allow"
  And user waits for "2" seconds  
  And user clicks on button "back" 
  And user waits for "5" seconds
 
  And user clicks on label "Funds_Availability_Disclosure"   
  And user clicks on button "back"
  And user waits for "5" seconds  

  And user clicks on label "Online_Banking_Agreement"  
  And user clicks on button "back" 
  And user waits for "5" seconds
  
  And user clicks on label "Privacy_Notice"  
  And user clicks on button "back" 
  And user waits for "5" seconds

  And user clicks on label "Savings_Truth_In_Savings_Disclosure"  
  And user clicks on button "back" 
  And user waits for "5" seconds
  
  And user clicks on label "Truth_In_Lending_Disclosure_and_Agreement"  
  And user clicks on button "back" 
  And user waits for "5" seconds  

  And user scrolls down
  And user waits for "5" seconds  
  And user clicks on label "W-9"  
  And user clicks on button "back" 
  And user waits for "5" seconds  
     
  And user clicks on label "Checking_Account_Agreement"
  And user clicks on button "back"
    
  # And user presses device "BACK" button
  And user waits for "5" seconds
  And user clicks on label "Checking_Truth_In_Savings_Disclosure"
  # And user scrolls down
  # And user scrolls down
  And user waits for "2" seconds
  And user clicks on button "back"
  
  And user waits for "5" seconds
  And user scrolls down
  And user waits for "5" seconds
  And user clicks on label "Electronic_Communications"
  And user clicks on button "back"
  
  And user waits for "5" seconds
  And user scrolls down
  And user waits for "5" seconds
  And user clicks on label "Electronic_Funds_Transfer_Disclosure"
  And user clicks on button "back" 
  And user waits for "20" seconds

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |  
 
    
   @RegressionPack @TC001_Message_Center
Scenario Outline: Verify Meed customer is able view Message Center in Meed app 
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
 And user clicks on button "More"
  And user waits for "2" seconds
  And user scrolls down
  And user scrolls down
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
  And user clicks on button "Message_Center"
  And user waits for "3" seconds
  And user clicks on button "Back"
  And user waits for "10" seconds

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |   
    
   
    @RegressionPack @TC001_Contact_Us
Scenario Outline: Verify Meed customer is able contact us in Meed app 
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
 And user clicks on button "More"
  And user waits for "2" seconds
  And user scrolls down
  And user scrolls down
     And user waits for "2" seconds
   And user scrolls down
   And user waits for "2" seconds
      And user scrolls down
   And user waits for "2" seconds
         And user scrolls down
   And user waits for "2" seconds
  And user clicks on button "Contact_Us"
  And user waits for "3" seconds
  And user clicks on button "Back"
  And user waits for "10" seconds

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |        
    