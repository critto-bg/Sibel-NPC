BEGIN ~S!SDRUIN~

IF ~True()~ THEN BEGIN NoSleep
  SAY ~We do not approve of vagrants sleeping in the streets, stranger. You are welcome to find lodging in our tavern.~

  IF ~~ THEN DO ~EscapeArea()~ EXIT
END
