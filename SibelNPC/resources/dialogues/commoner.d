BEGIN ~S!SCOMM~

IF ~RandomNum(3,1)~ THEN BEGIN FirstPhrase
  SAY ~The economy has been declining as of late.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN SecondPhrase
  SAY ~Ever since Lord Arcanis lost his eye-sight, he has not been able to take care of the leather industry.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN ThirdPhrase
  SAY ~I think you need to talk to Lord Arcanis. You can find his house in the south-western part of the village.~
  IF ~~ THEN EXIT
END