#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Information 
#Scenario: #NA

Feature: Account Information  
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is view Account information
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "ACCOUNT_INFORMATION"
    And user waits for "2" seconds
    And user clicks on button "ACCOUNT_DETAILS"
    And user waits for "2" seconds
    
 
    Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	
@RegressionPack @TC002
Scenario Outline: Verify Meed customer is view statments information
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "ACCOUNT_INFORMATION"
    And user waits for "2" seconds
    And user clicks on button "STATEMENTS"
    And user waits for "2" seconds
    
 
    Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	