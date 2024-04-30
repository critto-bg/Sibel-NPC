BEGIN ~S!SIBE25~

IF ~Global("IaSibelSummoned","GLOBAL",1)~ THEN BEGIN FirstMeeting
  SAY @3450 /* What strange place is this, <CHARNAME>? Wherever it may be, are you ready to join forces and pursue our goals together again? */

  IF ~~ THEN
    REPLY @3451 /* I am glad to have you back, Sibel. Let us depart. */
    DO ~SetGlobal("IaSibelSummoned","GLOBAL",2)~
    GOTO SibelJoinsAgain

  IF ~~ THEN
    REPLY @3452 /* Not just yet... Please, wait awhile here. */
    DO ~SetGlobal("IaSibelSummoned","GLOBAL",2)~
    GOTO SibelToldToWait
END

IF ~Global("IaSibelSummoned","GLOBAL",2)~ THEN BEGIN CameBack
  SAY @3453 /* <CHARNAME>, you return! Are we to continue our travels? */

  ++ @3454 /* Yes, join with me, Sibel. */ + SibelJoinsAgain
  ++ @3455 /* No. Please, wait for me a moment longer. */ + SibelToldToWaitMore
END

IF ~~ THEN BEGIN SibelJoinsAgain
  SAY @3456 /* Wonderful. Lead on, <CHARNAME>, and I shall follow. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelJoined","LOCALS",1) JoinParty()~
    EXIT
END

IF ~~ THEN BEGIN SibelToldToWait
  SAY @3457 /* Very well, I shall do so. Come back soon, <CHARNAME>. */

  IF ~~ THEN
    DO ~MoveToPointNoInterrupt([1510.1370]) Face(0)~
    EXIT
END

IF ~~ THEN BEGIN SibelToldToWaitMore
  SAY @3458 /* Certainly. I hope you change your mind soon. */

  IF ~~ THEN EXIT
END