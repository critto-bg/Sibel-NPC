APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelRespondsCelvan
    SAY @2150 /* How do you know all those things? */
    IF ~~ THEN EXTERN ~CELVAN~ 1
  END
END

APPEND ~CELVAN~
  IF WEIGHT #-1
     ~See("S!Sibel")
      InParty("S!Sibel")
      IfValidForPartyDialogue("S!Sibel")
      RandomNum(2,2)
      Global("IaCelvanSibel","AR0300",0)~ THEN
  BEGIN CelvanSibel
    SAY @2151 /* There once was a girl and her father.
He told of a curse to her and no other;
If she and friends stay together
She will then craft the finest leather,
Though her enemies are yet to bother. */
    IF ~~ THEN DO ~SetGlobal("IaCelvanSibel","AR0300",1)~ EXTERN ~S!SibelJ~ SibelRespondsCelvan
  END
END
