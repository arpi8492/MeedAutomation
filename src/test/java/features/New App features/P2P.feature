#Author: meluser12@yopmail.com
#Keywords Summary : Android Automation 
#Feature: Account Move Money (New App)
#Scenario: #NA
Feature: P2P Transfer

@RegressionPack @TC001_P2P_Send_Money
Scenario Outline: Verify Meed customer is able to successfully Pay Friends having Meed membership - Send Money
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 #And user clicks on button "Cancel"
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
 And user waits for "2" seconds
 And user scrolls down
 And user clicks on button "Send_Money" 
 And user clicks on button "Allow"
 And user waits for "5" seconds

 And user enters text "<recipient>" in textbox "Email_or_existing_contact_name"  
 And user selects option "<recipient>" from the list
 And user clicks on button "Next"
 And user waits for "2" seconds 
  
 And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_SENT"
 And user enters text "P2P automation notes" in textbox "NOTES"
 And user clicks on button "Confirm_Details"
 And user clicks on button "Send_Money"
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 
 And user validates "Success_Message" with expected value as "You've sent $<Amount> to <recipient>"

  Examples: 
    |   Platform    |   Email                   	  |   Username  |   Password   |   recipient             |  Amount  |
    |   Android     |   meeduat54update@yopmail.com   |   Meeduat54 |   Password@1 |   meluser7@yopmail.com  |   2.00  |
    
    
    
    @RegressionPack @TC001_P2P_Request_Money
Scenario Outline: Verify Meed customer is able to request money in Meed app 
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
  And user clicks on button "Request_Money"
  And user waits for "2" seconds

  And user enters text "<recipient>" in textbox "Email"
  And user clicks on button "Next"
  And user waits for "2" seconds 
  And user clicks on button "Next"
  And user waits for "2" seconds 
  
  And user enters text "<Amount>" in textbox "AMOUNT_REQUESTED"
  And user enters text "P2P automation notes" in textbox "NOTES"
  And user clicks on button "Confirm_Details"
  And user clicks on button "Request_Money"
  And user switches to app "message" to get "OTP"

  Examples: 
    |   Platform    |   Email                   |   Username  |   Password   |   recipient             |  Amount  |
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |   meluser7@yopmail.com  |   10.00  |