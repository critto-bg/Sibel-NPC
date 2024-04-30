EXTEND_TOP ~FATESP~ 6
  IF ~!Dead("S!Sibel") Global("IaSibelSummoned","GLOBAL",0)~ THEN
    REPLY @2500 /* Bring me Sibel Arcanis, the human thief/cleric. */
    DO ~SetGlobal("IaSibelSummoned","GLOBAL",1)~
    GOTO 8
END
