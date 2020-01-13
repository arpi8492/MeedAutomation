#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Management 
#Scenario: #NA

Feature: Account management  
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to Freeze card from Account Managment option
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "ACCOUNT_MANAGEMENT"
    And user waits for "2" seconds
   And user clicks on button "CARD"
   And user waits for "2" seconds
    And user clicks on button "Freeze_Card"
    And user waits for "2" seconds
    And user selects checkbox "Freeze_Card_Now"
    And user waits for "2" seconds
    And user clicks on button "OK"
    
    
 Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	@TC002
	Scenario Outline: Verify Meed customer is able to report Lost/Stolen card from Account Managment option
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "ACCOUNT_MANAGEMENT"
    And user waits for "2" seconds
   And user clicks on button "CARD"
   And user waits for "2" seconds
    And user clicks on button "Lost/Stolen"
    And user waits for "2" seconds
    And user selects checkbox "CALL_NOW"
    And user waits for "2" seconds
    
    
 Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	
	@TC003
	Scenario Outline: Verify Meed customer is able to replace card from Account Managment option
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "ACCOUNT_MANAGEMENT"
    And user waits for "2" seconds
   And user clicks on button "Replace_Card"
   And user waits for "2" seconds
    
  
 Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	
	@TC004
	Scenario Outline: Verify Meed customer is able to change card PIN from Account Managment option
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "ACCOUNT_MANAGEMENT"
    And user waits for "2" seconds
   And user clicks on button "CARD_PIN"
   And user waits for "2" seconds
    
  
 Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	