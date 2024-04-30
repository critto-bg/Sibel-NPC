BEGIN ~S!SCAT~

IF ~NumTimesTalkedTo(0) Global("IaCatFood","ARIA28",0)~ THEN BEGIN FirstMeeting
  SAY @2100 /* Hello, <RACE>. I am hungry. Do you have any food for me? */
  IF ~~ THEN REPLY @2101 /* Not at the moment. I will try to locate some for you. */ DO ~SetGlobal("IaCatFood","ARIA28",1)~ GOTO Leave
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY @2102 /* You came back, <RACE>. I am still hungry. Do you have any food for me? */

  IF ~Global("IaCatFood","ARIA28",2) NumItemsPartyGT("S!sfood",0)~ THEN
    REPLY @2103 /* Hello, cat. I have some food with me. Would you like it? */
    DO ~TakePartyItemNum("S!sfood",1) DestroyItem("S!sfood")~
    GOTO GiveFood

  ++ @2101 /* Not at the moment. I will try to locate some for you. */ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY @2104 /* I will wait here, <RACE>. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN GiveFood
  SAY @2105 /* Meow, tasty! I am grateful, <RACE>. I have found these shiny coins. Take them. */
  IF ~~ THEN REPLY @2106 /* Thank you, cat. */ DO ~GiveItemCreate("S!scoin",Player1,2,0,0) SetGlobal("IaCatFood","ARIA28",3)~ EXIT
END
