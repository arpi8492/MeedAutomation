#Author: akash.deep@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Send money Internationally
#Scenario: #NA
Feature: Internal Transfer
@RegressionPack @TC001
Scenario Outline: Verify that the user is able to send money internationally
#One time transfer
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
     And user waits for "5" seconds
   And user scrolls down
   And user waits for "5" seconds
      And user scrolls down
   And user waits for "5" seconds
  And user clicks on button "Send_Money_Internationally"
   And user clicks on button "Remitly"
   And user waits for "5" seconds
   And user clicks on button "I'm_Good_With_That"
 #validation left(User should reach external website)
  
  Examples: 
	|	Platform	|	Email					|	Username		|	Password	|
	|	Android		|	meluser12@yopmail.com	|	meluser12		|	Password-1	|