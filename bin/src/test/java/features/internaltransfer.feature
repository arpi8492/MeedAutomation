#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation POC
#Feature: Internal Transfer
#Scenario: #NA

Feature: Internal Transfer  
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully able to make internal transfer from DDA to Savings on mobile device
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "INTERNAL_TRANSFER"
   And user waits for "2" seconds
   And user clicks on button "NEXT"
   And user enters text "<Amount>" in textbox "Amount"
   And user selects option "Once"  from the dropdown "Frequency"
   And user waits for "2" seconds
   And user clicks on button "NEXT"
   And user clicks on button "CONFIRM"
   And user waits for "2" seconds
   And user validates "Amount" field with expected value as "$<Amount>"
   And user validates "Frequency" field with expected value as "Monthly"
   
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	Amount	|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	50.66		|
	
	@TC002
	Scenario Outline: Verify Meed customer is able to successfully able to make internal transfer from Savings to DDA on mobile device
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "INTERNAL_TRANSFER"
   And user waits for "2" seconds
   And user swipes right to select "SAVINGS"
   And user waits for "5" seconds
   And user clicks on button "NEXT"
   And user enters text "<Amount>" in textbox "Amount"
   And user selects option "Monthly"  from the dropdown "Frequency"
   And user waits for "2" seconds
   And user clicks on button "NEXT"
   And user clicks on button "CONFIRM"
   And user waits for "2" seconds
   And user validates "Amount" field with expected value as "$<Amount>"
   And user validates "Frequency" field with expected value as "Monthly"
   
   
	Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	Amount	|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	50.66		|
	 
  @TC003
 Scenario Outline: Verify Meed customer is able to successfully able to make internal transfer from DDA to LOC on mobile device
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "INTERNAL_TRANSFER"
   And user waits for "2" seconds
    And user swipes right to select "LINE_OF_CREDIT"
   And user clicks on button "NEXT"
   #And user enters text "<Amount>" in textbox "Amount"
   #And user selects option "Monthly"  from the dropdown "Frequency"
   And user waits for "2" seconds
   And user clicks on button "NEXT"
   And user clicks on button "CONFIRM"
   And user waits for "2" seconds
  # And user validates "Amount" field with expected value as "$<Amount>"
   #And user validates "Frequency" field with expected value as "Monthly"
   
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	Amount	|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	2.09		| 
	
	@TC004
	Scenario Outline: Verify Meed customer is able to successfully able to view scheduled transfers
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "INTERNAL_TRANSFER"
   And user waits for "2" seconds
   And user clicks on button "SCHEDULED_TRANSFERS"
   And user waits for "5" seconds
   
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|
	
	@TC005
	Scenario Outline: Verify Meed customer is able to successfully able to make internal transfer from DDA to Savings on mobile device
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "INTERNAL_TRANSFER"
   And user waits for "2" seconds
   And user clicks on button "NEXT"
   And user enters text "<Amount>" in textbox "Amount"
   And user selects option "Monthly"  from the dropdown "Frequency"
   And user waits for "2" seconds
   And user clicks on button "NEXT"
   And user clicks on button "CONFIRM"
   And user waits for "2" seconds
   And user validates "Amount" field with expected value as "$<Amount>"
   And user validates "Frequency" field with expected value as "Monthly"
   
  Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	Amount	|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	50.66		|
  