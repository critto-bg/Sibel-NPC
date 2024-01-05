APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN AssuresLeatherGolem
    SAY ~We will be there. Inform your master, good golem.~

    IF ~~ THEN
      DO ~SetGlobal("IaSLawrencePlot","GLOBAL",1)~
      EXIT
  END
END

BEGIN ~S!SLEAT3~

IF ~Global("IaSibelTalks","GLOBAL",27)~ THEN BEGIN Start
  SAY ~Greetings, <CHARNAME>! Master awaits you in the local tavern. Make haste, the matter is urgent.~

  IF ~~ THEN EXTERN ~S!SibelJ~ AssuresLeatherGolem
END