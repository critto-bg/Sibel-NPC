BEGIN ~S!SINNK~

IF ~True()~ THEN BEGIN Root
  SAY ~Welcome, traveler! Are you in need of a rest?~
  IF ~~ THEN REPLY ~Indeed we are! Shows us what rooms you have, dear man.~ DO ~RestParty()~ EXIT
  IF ~~ THEN REPLY ~No, maybe later. I'll be going now.~ EXIT
END
