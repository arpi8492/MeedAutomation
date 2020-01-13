#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation POC
#Feature: Internal Transfer
#Scenario: #NA

Feature: P2P Transfer  

Scenario Outline: Verify Meed customer is able to successfully able to view scheduled transfers
 Given user launches the app in "<Platform>" device
   
   
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|