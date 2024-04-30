BEGIN ~S!SSQUI~

IF ~Global("IaSamaraPlot","GLOBAL",1)~ THEN BEGIN FirstMeeting
  SAY @3800 /* Squuik! I am injured! */
  ++ @3801 /* You don't seem too well. Let me heal you. */ + ThankYou
  ++ @3802 /* I am looking for Samara fruit. Can you climb the tree if I heal you? */ + Yes
END

IF ~~ THEN BEGIN ThankYou
  SAY @3803 /* Thank you. */
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN Yes
  SAY @3804 /* Yes, <RACE>, I will. */
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",2)~ EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",2)~ THEN BEGIN StillInjured
  SAY @3800 /* Squuik! I am injured! */
  IF ~~ THEN EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",3)~ THEN BEGIN Healed
  SAY @3805 /* I feel better now, thank you. What can I do for you? */
  ++ @3806 /* I need some Samara fruit. Can you help me? */ + WillHelp
END

IF ~~ THEN BEGIN WillHelp
  SAY @3807 /* That should be easy. I will climb the tree and bring some for you. Meet me at the entrance of the Alchemy Tower. */
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",4)~ EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",6)~ THEN BEGIN Chased
  SAY @3808 /* Help me! A snake is chasing me! */
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",7)~ EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",8)~ THEN BEGIN Saved
  SAY @3809 /* Thank you, <RACE>! Here is the fruit you asked for! */
  IF ~~ THEN DO ~GiveItemCreate("S!ssama",Player1,0,0,0) SetGlobal("IaSamaraPlot","GLOBAL",9) EscapeArea()~ EXIT
END
