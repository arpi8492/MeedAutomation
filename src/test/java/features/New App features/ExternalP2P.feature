#Author: Harman Singh
#Keywords Summary : Android Automation
#Feature: External P2P
#Scenario: #NA
Feature: External P2P
@TC001_P2P_External_Transfer
Scenario Outline: Verify Meed customer is able to successfully send P2P external transfers
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
And user clicks on button "Send_Money"
And user waits for "5" seconds
And user clicks on button "ALLOW"
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

#Add step for OTP
 

#And user enters text "<Amount>" in textbox "AMOUNT_TO_BE_SENT"

#And user enters text "P2P External automation" in textbox "NOTES"

#And user clicks on button "Confirm_Details"

#And user clicks on button "Send_Money"

#And user switches to app "message" to get "OTP"
		
		Examples:
		|Platform | Email                |Username |Password   |recipient                    | Amount|First_Name|Last_Name|Mobile_Number|Key|
		|Android  |jan21meed@yopmail.com |meluser16|Password-1 |external.customer@yopmail.com| 10.00 |Ext Name  |Sin      |9189516170   |P2P|

