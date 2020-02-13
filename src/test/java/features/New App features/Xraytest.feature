#Author:vaishali.katta@prodigylabs.net
#Keywords Summary : JIRA Xray
#Feature: IMport Test results 
#Scenario: #NA
Feature: Import Test Results
@PROT-48
Scenario Outline: Verify test result import to jira xray 
Given user adds status in jira

  Examples: 
    |   Platform    |   Email                           |   Username     |   Password    |   
    |   Android     |   meluser12@yopmail.com   |   meluser12 |   Password-1 |  
  