#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation  
#Feature: P2P
#Scenario: #NA

Feature: P2P Transfer  
@RegressionPack
Scenario Outline: Verify Meed customer is able to successfully able to send money through P2P on mobile device to existing customer
Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "P2P_TRANSFER"
   And user waits for "15" seconds
   And user wats for "15" seconds
   And user enters text in textbox with index "1"
   
   
     
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	Amount	|	Recipient							|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	50.66		|	meedqe75@yopmail.com	|
	