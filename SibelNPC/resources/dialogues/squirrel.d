BEGIN ~S!SSQUI~

IF ~Global("IaSamaraPlot","GLOBAL",1)~ THEN BEGIN FirstMeeting
  SAY ~Squuik! I am injured!~
  ++ ~You don't seem too well. Let me heal you.~ + ThankYou
  ++ ~I am looking for Samara fruit. Can you climb the tree if I heal you?~ + Yes
END

IF ~~ THEN BEGIN ThankYou
  SAY ~Thank you.~
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN Yes
  SAY ~Yes, <RACE>, I will.~
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",2)~ EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",2)~ THEN BEGIN StillInjured
  SAY ~Squuik! I am injured!~
  IF ~~ THEN EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",3)~ THEN BEGIN Healed
  SAY ~I feel better now, thank you. What can I do for you?~
  ++ ~I need some Samara fruit. Can you help me?~ + WillHelp
END

IF ~~ THEN BEGIN WillHelp
  SAY ~That should be easy. I will climb the tree and bring some for you. Meet me at the entrance of the Alchemy Tower.~
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",4)~ EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",6)~ THEN BEGIN Chased
  SAY ~Help me! A snake is chasing me!~
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",7)~ EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",8)~ THEN BEGIN Saved
  SAY ~Thank you, <RACE>! Here is the fruit you asked for!~
  IF ~~ THEN DO ~GiveItemCreate("S!ssama",Player1,0,0,0) SetGlobal("IaSamaraPlot","GLOBAL",9) EscapeArea()~ EXIT
END
