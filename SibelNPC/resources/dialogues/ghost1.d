APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN GreetsRegiMessenger
    SAY @2600 /* Who are you, ghost? */

    IF ~~ THEN EXTERN ~S!SGHOS1~ ComeAndFindOut
  END
END

BEGIN ~S!SGHOS1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Start
  SAY @2601 /* Sibel! Come and meet me in the sewers beneath Copper Coronet! */

  IF ~~ THEN EXTERN ~S!SibelJ~ GreetsRegiMessenger
END

IF ~~ THEN BEGIN ComeAndFindOut
  SAY @2602 /* Hurry! Come and you will find out. */

  IF ~~ THEN
    DO ~SetGlobal("IaSRegiPlot","GLOBAL",3) SetGlobalTimer("IaSGhostTimer","LOCALS",6)~
    EXIT
END
