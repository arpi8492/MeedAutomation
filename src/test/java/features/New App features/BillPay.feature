#Author: Harman
#Keywords Summary : Android Automation 
#Feature: Bill pay service
#Scenario: #NA
Feature: Bill pay service
@TC001_Pay_with_debit_card
Scenario Outline: Verify Meed customer is able to pay bills using debit card 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
 And user scrolls down
 And user scrolls down
 And user scrolls down
 And user clicks on button "Pay_Bills"
 And user waits for "2" seconds
 And user clicks on button "Pay_with_Debit_Card"
 And user clicks on button "Continue"
 And user clicks on button "Skip"
 And user clicks on button "Netflix"
 And user validates that "Netflix" is displayed
  And user waits for "10" seconds
  Examples: 
    |   Platform    |   Email                     |   Username  |   Password   |    
    |   Android     |   meluser12new@yopmail.com  |   meluser12 |   Password-1 |   
    
 
@TC001_BillPay_Add_Payee
Scenario Outline: Verify Meed customer is able to add a bill payee in the app
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
 And user scrolls down
 And user clicks on button "Pay_Bills"
 And user clicks on button "Bill_Pay_Service"
 And user clicks on button "Continue"
 And user waits for "2" seconds 
 And user clicks on button "Add_a_payee"
 And user enters "<Payee_name>" in textbox at index "0"
 And user waits for "3" seconds
 #And user enters "<Payee_nick>" in textbox at index "1"
 #And user waits for "3" seconds
 And user enters "<Payee_account_#>" in textbox at index "2"
 And user waits for "3" seconds
 And user enters "<Payee_account_#>" in textbox at index "3"
 And user clicks on button "Person"
 And user waits for "2" seconds
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters "<Address>" in textbox at index "0"
 And user enters "<City>" in textbox at index "1"
 And user waits for "2" seconds
 And user clicks on button "STATE"
 And user waits for "2" seconds
 And user clicks on button "Alaska"
 And user waits for "2" seconds
 And user enters "<ZIP_CODE>" in textbox at index "3"
 And user waits for "2" seconds
 And user enters "<Phone_Number>" in textbox at index "4"
 And user waits for "2" seconds
 And user clicks on button "Continue"  
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 And user validates "Success_Message" with expected value as "You added a new payee! Now you can make payments from this app. Allow a 1-day delivery time"
 And user clicks on button "Done" 
 And user validates that contact "<Payee_name>" is "displayed"

   Examples: 
    |   Platform    |   Email                  |   Username  |   Password   |Payee_name   |  Amount  |Payee_nick |Payee_account_#|    Address  | City| ZIP_CODE|Phone_Number    |        
    |   Android     |   jan21meed@yopmail.com  |   meluser16 |   Prodigy@1 |  VAISHALI K |   10.00  |     Sun   | 12345         | BaySt       |Tulsa|   34567 |(918) 951-8081  |
   
@TC001_BillPayment_Person
Scenario Outline: Verify Meed customer is able to send bill payment to payee type person
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user waits for "5" seconds
 And user clicks on button "Move_Money"
 And user scrolls down
 And user scrolls down
 And user clicks on button "Pay_Bills"
 And user clicks on button "Bill_Pay_Service"
 And user clicks on button "Continue"
  And user waits for "5" seconds
 And user clicks on button "Add_a_payee"
 
 And user enters "<Payee_name>" in textbox at index "0"
 And user waits for "3" seconds
 #And user enters "<Payee_nick>" in textbox at index "1"
 #And user waits for "3" seconds
 And user enters "<Payee_account_#>" in textbox at index "2"
 And user waits for "3" seconds
 And user enters "<Payee_account_#>" in textbox at index "3"
 And user clicks on button "Person"
 And user waits for "2" seconds
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters "<Address>" in textbox at index "0"
 And user enters "<City>" in textbox at index "1"
 And user waits for "2" seconds
 And user clicks on button "STATE"
 And user waits for "2" seconds
 And user clicks on button "Alaska"
 And user waits for "2" seconds
 And user enters "<ZIP_CODE>" in textbox at index "3"
 And user waits for "2" seconds
 And user enters "<Phone_Number>" in textbox at index "4"
 And user waits for "2" seconds
 And user clicks on button "Continue"  
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 And user validates "Success_Message" with expected value as "You added a new payee! Now you can make payments from this app. Allow a 1-day delivery time"
 And user clicks on button "Make_A_Payment" 
 And user enters text "<Amount>" in textbox "PAYMENT_AMOUNT"
 And user clicks on button "Confirm_Details"
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 And user validates "Success_Message" with expected value as "You've scheduled$<Amount>to <Payee_name>"
 And user waits for "10" seconds
 
   Examples: 
    |   Platform    |   Email                  |   Username  |   Password   |Payee_name   |  Amount  |Payee_nick |Payee_account_#|    Address  | City| ZIP_CODE|Phone_Number    |        
    |   Android     |   jan21meed@yopmail.com  |   meluser16 |   Prodigy@1 |  VAISHALI K |   10.00  |     Sun   | 12345         | BaySt       |Tulsa|   34567 |(918) 951-8081  |
    
 @TC001_BillPayment_Company
Scenario Outline: Verify Meed customer is able to send bill payment to payee type company
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user waits for "7" seconds
 And user clicks on button "Move_Money"
 And user scrolls down
 And user scrolls down
 And user clicks on button "Pay_Bills"
 And user clicks on button "Bill_Pay_Service"
 And user clicks on button "Continue"
  And user waits for "7" seconds
 And user clicks on button "Add_a_payee"
 
 And user enters "<Payee_name>" in textbox at index "0"
 And user waits for "3" seconds
 #And user enters "<Payee_nick>" in textbox at index "1"
 #And user waits for "3" seconds
 And user enters "<Payee_account_#>" in textbox at index "2"
 And user waits for "3" seconds
 And user enters "<Payee_account_#>" in textbox at index "3"
 And user clicks on button "Company"
 And user waits for "2" seconds
 And user clicks on button "Continue"
 And user waits for "2" seconds
 And user enters "<Address>" in textbox at index "0"
 And user enters "<City>" in textbox at index "1"
 And user waits for "2" seconds
 And user clicks on button "STATE"
 And user waits for "2" seconds
 And user clicks on button "Alaska"
 And user waits for "2" seconds
 And user enters "<ZIP_CODE>" in textbox at index "3"
 And user waits for "2" seconds
 And user enters "<Phone_Number>" in textbox at index "4"
 And user waits for "2" seconds
 And user clicks on button "Continue"  
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 And user validates "Success_Message" with expected value as "You added a new payee! Now you can make payments from this app. Allow a 5-day delivery time"
 And user clicks on button "Make_A_Payment" 
 And user enters text "<Amount>" in textbox "PAYMENT_AMOUNT"
 And user selects checkbox "Repeat_payment_monthly"
 And user clicks on button "CALENDER"
 And user waits for "2" seconds
 And user selects "Feb" "27" "2020" from calendar
 And user clicks on button "DONE"
 And user waits for "2" seconds
 And user clicks on button "Confirm_Details"
 And user waits for "2" seconds
 And user switches to "Samsung Messaging" app
 And user enters "authorization code" in meed app
 And user validates "Success_Message" with expected value as "You've scheduled$<Amount>to <Payee_name>"
 And user validates "Success_Message_subtitle" with expected value as "Recurring monthly from Feb 27, 2020"
 
   Examples: 
    |   Platform    |   Email                  |   Username  |   Password  | Payee_name    |  Amount  |Payee_nick |Payee_account_#|  Address  | City| ZIP_CODE|Phone_Number    |        
    |   Android     |   jan21meed@yopmail.com  |   meluser16 |   Prodigy@1 |  PRODIGY LABS |   10.00  |     PL    | 12345         | BaySt       |Tulsa|   34567 |(918) 951-8081  |
