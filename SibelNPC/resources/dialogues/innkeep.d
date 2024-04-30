BEGIN ~S!SINNK~

IF ~True()~ THEN BEGIN Root
  SAY @2750 /* Welcome, traveler! Are you in need of a rest? Free of charge for a friend of Lord Arcanis. */
  IF ~~ THEN REPLY @2751 /* Indeed we are! Shows us what rooms you have, dear man. */ DO ~RestParty()~ EXIT
  IF ~~ THEN REPLY @2752 /* No, maybe later. I'll be going now. */ EXIT
END
