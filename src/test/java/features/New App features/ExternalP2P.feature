#Author: Harman Singh
#Keywords Summary : Android Automation
#Feature: External P2P
#Scenario: #NA
Feature: External P2P
@TC001_P2P_External_Transfer
Scenario Outline: Verify Meed customer is able to successfully send P2P external transfers to new external contacts
Given user launches the app in "<Platform>" device
And user clicks on button "Get_started"
And user enters text "<Email>" in textbox "Your_email"
And user clicks on button "Continue"
And user enters text "<Username>" in textbox "Username"
And user enters text "<Password>" in textbox "Password"
And user clicks on button "Log_In"
And user waits for "5" seconds
And user clicks on button "Move_Money"
And user waits for "2" seconds
And user scrolls down
And user clicks on button "Send_Money"
And user waits for "5" seconds
And user clicks on button "Allow"
And user waits for "5" seconds
And user enters "<recipient>" in textbox at index "0"
And user waits for "2" seconds
And user selects option "<recipient>" from the list
And user clicks on button "Next"
And user waits for "2" seconds
And user enters "<First_Name>" in textbox at index "0"
And user enters "<Last_Name>" in textbox at index "1"
And user enters "<Mobile_Number>" in textbox at index "2"
And user selects checkbox "Invite"
And user clicks on button "Next"
And user enters "<Key>" in textbox at index "0"
And user enters "<Key>" in textbox at index "1"
And user clicks on button "Next"
And user switches to "Samsung Messaging" app
And user enters "authorization code" in meed app
And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_SENT"
And user enters text "P2P External automation" in textbox "NOTES"
And user clicks on button "Confirm_Details"
And user clicks on button "Send_Money"
And user waits for "2" seconds
And user validates "Success_Message" with expected value as "You've sent $<Amount> to <recipient>"
		
Examples:
|Platform | Email                |Username |Password   |recipient                     | Amount|First_Name|Last_Name|Mobile_Number|Key|
|Android  |jan21meed@yopmail.com |meluser16|Password-1 |external.customer2@yopmail.com| 10.00 |Ext Name  |Sin      |9189516170   |P2P|

@RegressionPack @TC001_Ext_P2P_Daily_Limits
Scenario Outline: Verify Meed customer daily limit exceed message when attempted to transfer more than 2,500
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "5" seconds
And user clicks on button "Move_Money"
And user waits for "2" seconds
And user scrolls down
And user clicks on button "Send_Money"
And user waits for "5" seconds
And user clicks on button "Allow"
And user waits for "5" seconds
And user enters "<recipient>" in textbox at index "0"
And user waits for "2" seconds
And user selects option "<recipient>" from the list
And user clicks on button "Next"
And user waits for "2" seconds
And user enters "<First_Name>" in textbox at index "0"
And user enters "<Last_Name>" in textbox at index "1"
And user enters "<Mobile_Number>" in textbox at index "2"
And user selects checkbox "Invite"
And user clicks on button "Next"
And user enters "<Key>" in textbox at index "0"
And user enters "<Key>" in textbox at index "1"
And user clicks on button "Next"
And user switches to "Samsung Messaging" app
And user enters "authorization code" in meed app
And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_SENT"
And user enters text "P2P External automation" in textbox "NOTES"
And user clicks on button "Confirm_Details"
And user clicks on button "Send_Money"
And user waits for "2" seconds
And user validates "Error" with expected value as "<Daily Limit message>"
		
Examples:
|Platform | Email                		|Username |Password   |recipient                     | Amount  |First_Name|Last_Name|Mobile_Number|Key| Daily Limit message |
|Android  |meeduat54update@yopmail.com  |Meeduat54|Password@1 |external.customer3@yopmail.com| 2501.00 |Ext Name  |Sin      |9189516170   |P2P| Daily limit of USD 2500.0 exceeded. |


