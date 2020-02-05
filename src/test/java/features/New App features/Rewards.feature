#Author: meluser12@yopmail.com
#Keywords Summary : Android Automation 
#Feature: Account Move Money (New App)
#Scenario: #NA
Feature: Meed Rewards

@RegressionPack @TC001+Meed_Extras
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
    
    @RegressionPack @TC002+Meed_Shares
Scenario Outline: Verify Meed customer is able to view Meed Share to Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 
 And user clicks on button "Rewards"
 And user validates that "Rewards" is displayed
  
  And user clicks on button "MeedShare"
  And user clicks on button "ACTIVE_SHARES"
  And user clicks on button "Back"
  
  And user clicks on button "THIS_MONTH"
  And user clicks on button "Back"
  And user clicks on button "TOTAL"
  And user clicks on button "Back"
  
  And user waits for "5" seconds
  

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |   
    
    
    @RegressionPack @TC003+Meed_Travel
Scenario Outline: Verify Meed customer is able to view Meed Travel to Meed app 
Given user launches the app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user clicks on button "Rewards"
 And user validates that "Rewards" is displayed
  And user clicks on button "MeedTravel"
  And user scrolls down    
  And user clicks on button "Book_via_MeedTravel"
  And user validates "Note" with expected value as "<ExpectedNote>"
  And user clicks on button "Im_good_with_that"
  And user waits for "5" seconds 
  

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |  ExpectedNote | 
    |   Android     |   meluser12@yopmail.com  		    |   meluser12	 |   Password-1 |  You’re now leaving the Meed app and going to a third-party website with different Terms & Conditions. |
    
    
    
    @RegressionPack @TC004+Meed_Cover
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