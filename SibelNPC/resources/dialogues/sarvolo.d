APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelRespondsVolo
    SAY @3400 /* Someone should prove that women are not the second gender. */
    IF ~~ THEN EXTERN ~SARVOLO~ 9
  END
END

APPEND ~SARVOLO~
  IF ~~ THEN BEGIN VoloSibel
    SAY @3401 /* With her famous and scary war cry, 'you would do well to fear a woman's wrath', Sibel Arcanis, the wise and strong adventurer, equals an entire brigade on the field of battle. */
    IF ~~ THEN EXTERN ~S!SibelJ~ SibelRespondsVolo
  END
END

EXTEND_TOP ~SARVOLO~ 9 #1
  IF ~IfValidForPartyDialogue("S!Sibel")~ THEN
    REPLY @3402 /* Tell me about Sibel. */
    GOTO VoloSibel
END