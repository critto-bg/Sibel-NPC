BEGIN ~S!SMESS1~

IF ~True()~ THEN BEGIN Start
  SAY @3250 /* <CHARNAME>! Duchess Liia Jannath requires your immediate presence. Please, come with me, if you will. */

  IF ~~ THEN
    DO ~SetGlobal("IaAmberPlot","GLOBAL",2)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("S!scut11")~
    EXIT
END
