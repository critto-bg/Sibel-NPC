APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN GreetsLeatherGolem
    SAY ~This is unexpected. Greetings, golem. Who is this master that you speak of?~

    IF ~GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN ~S!SLEAT1~ SoA
    IF ~GlobalGT("Chapter","GLOBAL",7)~ THEN EXTERN ~S!SLEAT1~ ToB
  END

  IF ~~ THEN BEGIN LeavesToMeetVirtus
    SAY ~We will come as soon as possible.~

    IF ~~ THEN
      DO ~SetGlobal("IaSVirtusArrives","GLOBAL",1) SetGlobal("IaSibelTalks","GLOBAL",15) SetGlobalTimer("IaSLeatherTimer","GLOBAL",6)~
      EXIT
  END
END

BEGIN ~S!SLEAT1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Start
  SAY ~Sibel Arcanis! The master awaits you!~

  IF ~~ THEN EXTERN ~S!SibelJ~ GreetsLeatherGolem
END

IF ~~ THEN BEGIN SoA
  SAY ~Virtus Arcanis awaits you in Copper Coronet. Make haste. His patience has limits.~

  IF ~~ THEN EXTERN ~S!SibelJ~ LeavesToMeetVirtus
END

IF ~~ THEN BEGIN ToB
  SAY ~Virtus Arcanis awaits you in the local tavern. Make haste. His patience has limits.~

  IF ~~ THEN EXTERN ~S!SibelJ~ LeavesToMeetVirtus
END
