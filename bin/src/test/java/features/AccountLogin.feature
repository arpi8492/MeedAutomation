#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Login
#Scenario: #NA
Feature: Account Login 
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully able to login in Meed App and not able login successfully
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "5" seconds

  Examples: 
	|	Platform	|	Email					|	Username			|	Password		|		
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	|	Android		|	abc@prodigylabs.net				|	manojchauhan	|	password22	|		
	
@TC002	
Scenario Outline: Verify Meed customer is able to successfully retrieve username 
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user clicks on link "Forgot_Username"
   And user enters email "<Email>"
   And user clicks on button "SEND"
   And user waits for "3" seconds
   And user clicks on button "OK"
   And user waits for "3" seconds
   
   Examples:
   |	Platform	|	Email													|	
   |	Android		|	Manoj.chauhan@prodigylabs.net	|
   
@TC003
Scenario Outline: Verify Meed customer is able to successfully retrieve password 
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user clicks on link "Forgot_Password"
    And user waits for "3" seconds
   And user enters text "<Username>" in textbox "Please_provide_your_username"
   And user waits for "2" seconds
   And user clicks on button "NEXT"
   And user waits for "2" seconds
   And user enters text "<sport>" in textbox "Favorite_sport_?"
   And user clicks on button "SUBMIT"
   And user enters text "<city>" in textbox "City_where_you_were_born?"
   And user waits for "2" seconds
   And user clicks on button "SUBMIT"
   And user enters text "<Password>" in textbox "Choose_password"
   And user enters text "<Password>" in textbox "Confirm_password"
   And user clicks on button "RESET"
   And user clicks on button "OK"
   
   Examples:
   |	Platform	|	Email										|	Username		|	Food		|	sport		|	city	|	Password		|
   |	Android		|	meedtest70@yopmail.com	|	Meedtest70	|	chicken	|	soccer	| india	|	Password-1	|
   
  
   