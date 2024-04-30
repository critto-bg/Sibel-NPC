APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN RepliesTreeLife
    SAY @3260 /* Your fight is my fight. You've thrown yourself in countless dangers on my behalf. Tis' time I did the same for you, <CHARNAME>! */

    COPY_TRANS PLAYER1 33
  END
END

APPEND ~PLAYER1~
  IF ~~ THEN BEGIN SibelTreeTalk
    SAY @3261 /* Sibel, steadfast and loyal, she stood at your side countless times in the past. The burden of the family legacy is a heavy weight upon her shoulders, the one she carries with pride, determined to face what is yet to come. */

    IF ~~ THEN
      REPLY @3262 /* Sibel, you don't have to take the next step with me. This isn't your fight. */
      EXTERN ~S!SibelJ~ RepliesTreeLife

    IF ~~ THEN
      REPLY @3263 /* The battle for my soul lies ahead, Sibel. Are you prepared to see it through? */
      EXTERN ~S!SibelJ~ RepliesTreeLife
  END
END

EXTEND_BOTTOM ~PLAYER1~ 33
  IF ~InParty("S!Sibel") IsValidForPartyDialog("S!Sibel") InMyArea("S!Sibel") Global("IaSibelTreeLifeTalk","GLOBAL",0)~ THEN
    DO ~SetGlobal("IaSibelTreeLifeTalk","GLOBAL",1)~
    GOTO SibelTreeTalk
END