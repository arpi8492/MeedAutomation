#Author: manoj.chauhan@prodigylabs.net
#Keywords Summary : Android Automation 
#Feature: Account Onboarding New App
#Scenario: #NA
Feature: Customer Onboarding new app
@RegressionPack @TC001_Meed_Onboarding
Scenario Outline: Verify Meed customer is able onboard themselves in Meed app 
Given user launches "Meed" app in "<Platform>" device
 And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Nickname>" in textbox "Name_or_Nickname"
 And user clicks on button "Next"
 And user waits for "2" seconds
 And user clicks on button "Let's_do_it"
 And user waits for "20" seconds
 #And user enters text "<Inviter Code>" in textbox "Inviter's_email_or_code"
 #And user clicks on button "Continue"
 And user waits for "5" seconds
 And user clicks on button "USA"

 And user switches to "chrome" app to get "OTP" for account with email "<Email>"  and password "Password-1"

 And user waits for "3" seconds
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user enters text "<Password>" in textbox "Repeat_password"
 And user clicks on button "Next"
 #And user waits for "5" seconds
 #And user enters text "<Username>" in textbox "Username"
 #And user enters text "<Password>" in textbox "Password"
 #And user clicks on button "Log_In"
 
 And user waits for "8" seconds 
 And user clicks on button "I'm_good_to_go"  
 And user clicks on button "ALLOW" 
 And user clicks on label "Driver_License"
 And user waits for "30" seconds

And user enters text "<FirstName>" in textbox "First_Name"
And user enters text " " in textbox "Middle_Name"
And user enters text "<LastName>" in textbox "Last_Name"
And user clicks on label "DOB"
And user selects date "01" "11" "1955" from calendar
And user clicks on button "DONE"
And user waits for "2" seconds
And user enters text "<SSN>" in textbox "Social_Security"

And user scrolls down 
And user selects dropdown at index "0"
 And user clicks on label "Science" 
 And user waits for "2" seconds
And user enters text "7000" in textbox "Monthly_Income"
And user scrolls down
And user selects dropdown at index "1"
 And user clicks on label "Investments" 
 And user waits for "2" seconds
 And user selects dropdown at index "2"
 And user clicks on label "0-1000" 
 And user waits for "2" seconds
 And user selects dropdown at index "3"
 And user clicks on label ">5000-15000" 
 And user waits for "2" seconds 
 And user clicks on button "Next"
 And user waits for "2" seconds
 And user enters text "<HomeAddress>" in textbox "Home_Address"
 And user enters text "<City>" in textbox "city"
 
And user selects dropdown at index "0"
And user scrolls down
And user scrolls down
 And user clicks on label "<State>" 
 And user waits for "10" seconds
 And user enters text "<ZIPCode>" in textbox "ZIP_Code"
 And user enters text "<Mobile>" in textbox "Mobile_Number"
 And user scrolls down
 And user scrolls down
 #And user selects radio button "No_I_am_neither."
  And user clicks on button "Next"
  And user waits for "2" seconds
 And user enters text "<IdentityNumber>" in textbox "Identity_Number" 
 And user clicks on button "Next"
 
 And user waits for "30" seconds
 
 And user selects checkbox at index "0"
 And user selects checkbox at index "1"
 And user scrolls down
 And user scrolls down
 And user selects checkbox at index "0"
 And user selects checkbox at index "1"
 And user selects checkbox at index "2"
 
  And user clicks on button "Next"
  And user waits for "10" seconds
  
  And user clicks on button "Deposit_money" 
  And user waits for "2" seconds
  And user scrolls down
  And user clicks on button "Credit_Debit_Card"
  And user clicks on button "Move_On"
  And user waits for "5" seconds
  #And user enters text "10.00 " in textbox "Checking_Amount"
  #And user enters text "10.00 " in textbox "Savings_Amount"
  And user clicks on button "Continue" 
 
  And user waits for "2" seconds
  And user enters "<Amount>","<Email>","<CardName>","<CardNumber>","<Expiry>","<SecurityCode>" in paystand and click on "Paystand_Enter_Billing_Information"
  And user enters "<Street>","<City>","<Postal Code>","<State>" in paystand and click on "Pay"
  And user waits for "5" seconds
  And user validates "Paystand_Success_Message" with expected value as "<ExpectedMessage>"
  
  And user clicks on button "Done"
  And user waits for "10" seconds
  
  Examples: 
    |   Platform    |   Email                   	 |	Nickname | Inviter Code    | Username     	 |   Password   |  FirstName	| LastName	|	dob			|	SSN			|	HomeAddress			    |	City	|	State  		 |	ZIPCode	|	Mobile		   |	IdentityNumber	| Amount	|	CardNumber			| CardName 			 | Expiry | SecurityCode | ExpectedMessage |
    |   Android     |   meedprodigy1@gmail.com   |  PA	     |	corporate1850  | Custpromo5		 |   Password-1	| 	ELLEN		|	GARZA	|	11/11/1955  |	666994832	|	4311 COM CADDO LINE RD	|	APACHE	|	Oklahoma	 |	73006	|	(580) 492-0012 |	100000012   	| 12	    |	4242424242424242	| TestAutomationCard | 02/28  | 222           | Thank you! This payment is now settled. |

@RegressionPack @TC001_Meed_Onboarding1
Scenario Outline: Verify Meed customer is able onboard themselves in Meed app
Given user launches "Meed" app in "<Platform>" device
And user clicks on button "Get_started"
 And user enters text "<Email>" in textbox "Your_email"
 And user clicks on button "Continue"
 And user enters text "<Username>" in textbox "Username"
 And user enters text "<Password>" in textbox "Password"
 And user clicks on button "Log_In"
 And user waits for "10" seconds
 
And user clicks on button "Deposit_money" 
And user waits for "2" seconds
And user scrolls down
And user clicks on button "Credit_Debit_Card"
And user clicks on button "Move_On"
And user waits for "5" seconds
#And user enters text "10.00 " in textbox "Checking_Amount"
#And user enters text "10.00 " in textbox "Savings_Amount"
 And user clicks on button "Continue" 
 
 And user waits for "2" seconds
 And user enters "<Amount>","<Email>","<CardName>","<CardNumber>","<Expiry>","<SecurityCode>" in paystand and click on "Paystand_Enter_Billing_Information"
 And user enters "<Street>","<City>","<Postal Code>","<State>" in paystand and click on "Pay"
 And user validates "Paystand_Success_Message" with expected value as "<ExpectedMessage>"
  
 And user clicks on button "Done"
 And user waits for "10" seconds
 
 
  Examples: 
    |   Platform    |   Email                  	   |	Nickname | Inviter Code  | Username     	 |   Password   |  FirstName	| LastName		|	dob			|	SSN			|	HomeAddress			    |	City	|	State  		 |	ZIPCode	|	Mobile		   |	IdentityNumber	| Amount	|	CardNumber			| CardName 			 | Expiry | SecurityCode | ExpectedMessage |
    |   Android     |   vaishaliprodigy2@yahoo.com   |  PA	     |	corporate1919| Prodigy13feb |   Prodigy5*	| 	HAMMEZ		|	MARQUIRDT	|	02/01/1989  |	666995300	|	219 W MADISON ST UNIT 5	|	CHICAGO	|	Illinois	 |	60606	|	(312) 214-0011	|	I31000000436	| 12	|	4242424242424242	| TestAutomationCard | 02/28  | 222 | Thank you! This payment is now setteled |
 