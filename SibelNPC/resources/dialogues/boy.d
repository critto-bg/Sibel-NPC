APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelGreetsBoy
    SAY ~Yes, I am Sibel.~
    IF ~~ THEN EXTERN ~S!SBOY01~ GivesStuff
  END
END

BEGIN ~S!SBOY01~

IF ~Global("IaSibelTalks","GLOBAL",7)~ THEN BEGIN FirstMeeting
  SAY ~Hello. Are you Sibel Arcanis?~

  IF ~~ THEN EXTERN ~S!SibelJ~ SibelGreetsBoy
END

IF ~~ THEN BEGIN GivesStuff
  SAY ~Someone paid me to give this envelope to you.~

  IF ~~ THEN
    DO ~GiveItemCreate("S!samul","S!sibel",0,0,0)
        GiveItemCreate("S!slet01","S!sibel",0,0,0)
        SetGlobal("IaSibelTalks","GLOBAL",8)
        RealSetGlobalTimer("IaSibelDialogue","GLOBAL",6)
        EscapeArea()~
    EXIT
END
