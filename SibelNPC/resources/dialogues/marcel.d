BEGIN ~S!SMARCE~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY @3150 /* Hello, traveler. Marcel Arcanis at your service. You are looking for supplies, I presume? */
  ++ @3151 /* Hello, Marcel. Call me <CHARNAME>. Do you have anything to sell? Lord Arcanis says times have been tough lately. */ + ToughTimes
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY @3152 /* Welcome back, <CHARNAME>. Looking for supplies? */
  ++ @3153 /* Hello, Marcel. Do you have anything to sell? */ + BuyStuff
END

IF ~~ THEN BEGIN ToughTimes
  SAY @3154 /* Old Tristan ain't wrong, <CHARNAME>. The economy is slowly degrading. My stock's not what it used to be either. But I have a few bits and bobs if you need them. */
  ++ @3155 /* Show me what you have, Marcel. */ + BuyStuff
  ++ @3156 /* Maybe later. Take care, Marcel. */ + Leave
END

IF ~~ THEN BEGIN BuyStuff
  SAY @3157 /* I have some work tools here: saws, gears, wrenches... It ain't much, but all of good quality. A single Arcanis coin for each. */

  IF ~Global("IaSoldSaw","LOCALS",0) NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY @3158 /* I will take a saw. */
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!ssaw",Player1,1,0,0) SetGlobal("IaSoldSaw","LOCALS",1)~
    GOTO SoldStuff

  IF ~Global("IaSoldGear","LOCALS",0) NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY @3159 /* I will take a gear. */
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!sgear",Player1,1,0,0) SetGlobal("IaSoldGear","LOCALS",1)~
    GOTO SoldStuff

  IF ~Global("IaSoldWrench","LOCALS",0) NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY @3160 /* I will take a wrench. */
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!swren",Player1,1,0,0) SetGlobal("IaSoldWrench","LOCALS",1)~
    GOTO SoldStuff

  ++ @3156 /* Maybe later. Take care, Marcel. */ + Leave
END

IF ~~ THEN BEGIN SoldStuff
  SAY @3161 /* I hope it'll serve you well! */
  IF ~~ THEN REPLY @3162 /* Thank you, Marcel. */ EXIT
END

IF ~~ THEN BEGIN Leave
  SAY @3163 /* Goodbye! */
  IF ~~ THEN EXIT
END
