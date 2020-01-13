#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Invite Member
#Scenario: #NA

Feature: Invite member
@RegressionPack @TC001
Scenario Outline: Verify Meed customer is able to successfully invite members using Meed App
Given user launches the app in "<Platform>" device
  And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "INVITE"
   And user waits for "5" seconds
   And user clicks on button "DENY"
   And user waits for "2" seconds
   And user clicks on button "DENY"
   And user enters email "<recipient>"
   And user clicks on button "NEXT"
   And user waits for "2" seconds
   And user clicks on button "INVITE"
   And user waits for "2" seconds
   And user clicks on button "CLOSE"
   
 
    Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	recipient			|
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	accd@abc.com	|
	
	
@TC002	
Scenario Outline: Verify Meed customer is able to track the invitations sent using Meed App
Given user launches the app in "<Platform>" device
  And user enters email "<Email>"
   And user clicks on button "GET_STARTED"
   And user enters text "<Username>" in textbox "Username"
   And user enters text "<Password>" in textbox "Password"
   And user clicks on button "LOGIN"
   And user waits for "10" seconds
   And user clicks on button "INVITE"
   And user waits for "5" seconds
   And user clicks on button "DENY"
   And user waits for "2" seconds
   And user clicks on button "DENY"
   And user clicks on button "TRACK_INVITEES"
   And user waits for "2" seconds
   And user clicks on button "Sent"
   And user waits for "2" seconds
     
 
    Examples: 
	|	Platform	|	Email													|	Username			|	Password		|	
	|	Android		|	manoj.chauhan@prodigylabs.net	|	mchauhan9189	|	Qwerty123!!	|	