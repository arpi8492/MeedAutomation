#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation POC
#Feature: Settings
#Scenario: #NA

Feature: Settings  
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to change language to espanaol from settings
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "5" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "SETTINGS"
   And user clicks on button "Change_Language"
   And user waits for "1" seconds
   And user clicks on button "MEXICO"
   And user waits for "3" seconds
   And user clicks on button "OK"
   
   Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	@TC002
	Scenario Outline: Verify Meed customer is able to view Version info in settings
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "5" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "SETTINGS"
   And user clicks on button "Version_Info"
   And user waits for "3" seconds
   
   
   Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	@TC003
	Scenario Outline: Verify Meed customer is able to change contact preference in settings
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "5" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "SETTINGS"
   And user clicks on button "Contact_Preferences" 
   And user waits for "3" seconds
   And user selects checkbox "Email[0]"
   And user selects checkbox "Email[1]"
   And user waits for "4" seconds
   

   Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	
	@TC004
	Scenario Outline: Verify Meed customer is able to change contact preference in settings
 Given user launches the app in "<Platform>" device
   And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "5" seconds
   And user clicks on button "Menu"
   And user waits for "2" seconds
   And user clicks on button "SETTINGS"
   And user clicks on button "Sweep" 
   And user waits for "3" seconds
   And user selects checkbox "Slide_to_turn_Sweep_OFF/ON"
   And user waits for "4" seconds
  	And user clicks on button "SAVE_CHANGES" 
  	And user clicks on button "OK"
   

   Examples: 
	|	Platform	|	Email													|	Username			|	Password		|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	
	