BEGIN ~S!SCOMM~

IF ~RandomNum(3,1)~ THEN BEGIN FirstPhrase
  SAY ~The economy has been declining as of late.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN SecondPhrase
  SAY ~Ever since Lord Arcanis lost his eye-sight, he has not been able to take care of the leather industry.~
  IF ~~ THEN EXIT
END

IF ~Global("IaTreePlot","GLOBAL",0) RandomNum(3,3)~ THEN BEGIN ThirdPhrase
  SAY ~I think you need to talk to Lord Arcanis. You can find his house in the south-western part of the village.~
  IF ~~ THEN EXIT
END

IF ~GlobalGT("IaTreePlot","GLOBAL",0) GlobalLT("IaTreePlot","GLOBAL",4) RandomNum(3,3)~ THEN BEGIN FourthPhrase
  SAY ~We are glad you're here to help the village.~
  IF ~~ THEN EXIT
END

IF ~GlobalGT("IaTreePlot","GLOBAL",3) RandomNum(3,3)~ THEN BEGIN FifthPhrase
  SAY ~Now that the tree is cured, our lives are bound to be improved. Thank you, stranger.~
  IF ~~ THEN EXIT
END
