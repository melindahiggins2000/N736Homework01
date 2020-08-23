* Encoding: UTF-8.

PRESERVE.
SET DECIMAL DOT.

* CHANGE TO YOUR FILE FOLDER.
* NOTE - this in on a WINDOWS operating system.

GET DATA  /TYPE=TXT
  /FILE="C:\N736\exercise01\Dataset_02_fixq2.csv"
  /ENCODING='UTF8'
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  SubjectID AUTO
  Age AUTO
  WeightPRE AUTO
  WeightPOST AUTO
  Height AUTO
  SES AUTO
  GenderSTR AUTO
  GenderCoded AUTO
  q1 AUTO
  q2 AUTO
  q3 AUTO
  q4 AUTO
  q5 AUTO
  /MAP.
RESTORE.
CACHE.
EXECUTE.
DATASET NAME DataSet3 WINDOW=FRONT.

* Define Variable Properties - see Variable View.

VARIABLE LABELS SubjectID 'Subject ID'.
VARIABLE LABELS Age 'Age in years'.
MISSING VALUES Age(9, 99).

VARIABLE LABELS WeightPRE 'Weight before treatment (in pounds)'.
VARIABLE LABELS WeightPOST 'Weight after treatment (in pounds)'.
VARIABLE LABELS Height 'Height (in decimal feet)'.
VARIABLE LABELS SES 'pseudo-Socio-economic status'.
VALUE LABELS SES
  1 'Low Income'
  2 'Average Income'
  3 'High Income'.

VARIABLE LABELS GenderSTR 'Gender in text'.
MISSING VALUES GenderSTR('      ').

VARIABLE LABELS GenderCoded 'Gender coded as a number'.
VALUE LABELS GenderCoded
  1 'Male'
  2 'Female'.

VARIABLE LABELS  q1 'Question 1'.
VALUE LABELS q1
  1 'None of the time'
  2 'A little of the time'
  3 'Some of the time'
  4 'A lot of the time'
  5 'All of the time'.
MISSING VALUES q1(9, 99).

VARIABLE LABELS  q2 'Question 2'.
VALUE LABELS q2
  1 'None of the time'
  2 'A little of the time'
  3 'Some of the time'
  4 'A lot of the time'
  5 'All of the time'.
MISSING VALUES q2(9, 99).

VARIABLE LABELS  q3 'Question 3'.
VALUE LABELS q3
  1 'None of the time'
  2 'A little of the time'
  3 'Some of the time'
  4 'A lot of the time'
  5 'All of the time'.
MISSING VALUES q3(9, 99).

VARIABLE LABELS  q4 'Question 4'.
VALUE LABELS q4
  1 'None of the time'
  2 'A little of the time'
  3 'Some of the time'
  4 'A lot of the time'
  5 'All of the time'.
MISSING VALUES q4(9, 99).

VARIABLE LABELS  q5 'Question 5'.
VALUE LABELS q5
  1 'None of the time'
  2 'A little of the time'
  3 'Some of the time'
  4 'A lot of the time'
  5 'All of the time'.
MISSING VALUES q5(9, 99).

EXECUTE.

FREQUENCIES VARIABLES=SubjectID Age WeightPRE WeightPOST Height SES GenderSTR GenderCoded q1 q2 q3 
    q4 q5
  /NTILES=4
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN
  /HISTOGRAM
  /ORDER=ANALYSIS.

* correct Weight in kg to Weight in pounds.
* create NEW variable WeightPRE_corrected.

IF  (WeightPRE < 100) WeightPRE_corrected=WeightPRE * 2.20462.
EXECUTE.

* recode a value back into the same variable.
* can be done but not advised unless
* original dataset is saved and not changed.

RECODE Height (2.6=6.2).
EXECUTE.


