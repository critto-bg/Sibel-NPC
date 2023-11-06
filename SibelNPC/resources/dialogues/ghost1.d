APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN GreetsRegiMessenger
    SAY ~Who are you, ghost?~

    IF ~~ THEN EXTERN ~S!SGHOS1~ ComeAndFindOut
  END
END

BEGIN ~S!SGHOS1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Start
  SAY ~Sibel! Come and meet me in the sewers beneath Copper Coronet!~

  IF ~~ THEN EXTERN ~S!SibelJ~ GreetsRegiMessenger
END

IF ~~ THEN BEGIN ComeAndFindOut
  SAY ~Hurry! Come and you will find out.~

  IF ~~ THEN
    DO ~SetGlobal("IaSRegiPlot","GLOBAL",3) SetGlobalTimer("IaSGhostTimer","LOCALS",6)~
    EXIT
END
