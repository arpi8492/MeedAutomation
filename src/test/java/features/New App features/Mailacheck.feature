#Mailacheck.feature
#Author: Harman
#Keywords Summary : Android Automation 
#Scenario: #NA
Feature: Mail a check
@TC001_Mail_a_check
Scenario Outline: Verify Meed customer is able to Mail a check from the app
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
And user scrolls down
And user scrolls down
And user scrolls down
And user scrolls down
And user clicks on button "Mail_A_Check"
And user waits for "2" seconds
And user clicks on button "Add_a_payee"
And user enters "<Payee_name>" in textbox at index "0"
And user waits for "1" seconds
And user enters "<Payee_nick_name>" in textbox at index "1"
And user waits for "2" seconds
And user enters "<Payee_account_#>" in textbox at index "2"
And user waits for "2" seconds
And user enters "<Payee_account_#>" in textbox at index "3"
And user clicks on button "Person"
And user clicks on button "Continue"
And user waits for "2" seconds
And user enters "<Address>" in textbox at index "0"
And user enters "<City>" in textbox at index "1"
 And user clicks on button "STATE"
 And user waits for "2" seconds
 And user clicks on button "Alaska"
 And user waits for "2" seconds
 And user enters "<ZIP_CODE>" in textbox at index "3"
 And user waits for "2" seconds
 And user enters "<Phone_Number>" in textbox at index "4"
 And user waits for "2" seconds
 And user clicks on button "Continue" 
 
 
 Examples: 
    |   Platform    |   Email                   |   Username  |   Password   |Payee_name|  Amount  |Payee_nick_name |Payee_account_#|    Address  | City| ZIP_CODE|Phone_Number|        
    |   Android     |   jan21meed@yopmail.com   |   meluser16 |   Password-1 |   Random |   10.00  |     George     | 12345        | BaySt   |Tulsa|   34567 |9189516170  |
  
 
 