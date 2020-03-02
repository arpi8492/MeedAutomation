#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Login New App
#Scenario: #NA
Feature: Internal P2P Transfer new app
@RegressionPack @TC005_Direct_Deposit
Scenario Outline: Verify Meed customer is able to view legal documents in Meed app 
Given user launches "Meed" app in "<Platform>" device

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
  