BEGIN ~S!SIBE25~

IF ~Global("IaSibelSummoned","GLOBAL",1)~ THEN BEGIN FirstMeeting
  SAY ~What strange place is this, <CHARNAME>? Wherever it may be, are you ready to join forces and pursue our goals together again?~

  IF ~~ THEN
    REPLY ~I am glad to have you back, Sibel. Let us depart.~
    DO ~SetGlobal("IaSibelSummoned","GLOBAL",2)~
    GOTO SibelJoinsAgain

  IF ~~ THEN
    REPLY ~Not just yet... Please, wait awhile here.~
    DO ~SetGlobal("IaSibelSummoned","GLOBAL",2)~
    GOTO SibelToldToWait
END

IF ~Global("IaSibelSummoned","GLOBAL",2)~ THEN BEGIN CameBack
  SAY ~<CHARNAME>, you return! Are we to continue our travels?~

  ++ ~Yes, join with me, Sibel.~ + SibelJoinsAgain
  ++ ~No. Please, wait for me a moment longer.~ + SibelToldToWaitMore
END

IF ~~ THEN BEGIN SibelJoinsAgain
  SAY ~Wonderful. Lead on, <CHARNAME>, and I shall follow.~

  IF ~~ THEN
    DO ~SetGlobal("IaSibelJoined","LOCALS",1) JoinParty()~
    EXIT
END

IF ~~ THEN BEGIN SibelToldToWait
  SAY ~Very well, I shall do so. Come back soon, <CHARNAME>.~

  IF ~~ THEN
    DO ~MoveToPointNoInterrupt([1510.1370]) Face(0)~
    EXIT
END

IF ~~ THEN BEGIN SibelToldToWaitMore
  SAY ~Certainly. I hope you change your mind soon.~

  IF ~~ THEN EXIT
END