BEGIN ~S!SCAT~

IF ~NumTimesTalkedTo(0) Global("IaGotFood","LOCALS",0)~ THEN BEGIN FirstMeeting
  SAY ~Hello, <RACE>. I am hungry. Do you have any food for me?~
  + ~NumItemsPartyGT("S!sfood",0)~ + ~Hello, cat. I have some food with me. Would you like it?~ DO ~TakePartyItemNum("S!sfood",1) DestroyItem("S!sfood")~ GOTO GiveFood
  ++ ~Not at the moment. I will try to locate some for you.~ + Leave
END

IF ~NumTimesTalkedToGT(0) Global("IaGotFood","LOCALS",0)~ THEN BEGIN SubsequentMeeting
  SAY ~You came back, <RACE>. I am still hungry. Do you have any food for me?~
  + ~NumItemsPartyGT("S!sfood",0)~ + ~Hello, cat. I have some food with me. Would you like it?~ DO ~TakePartyItemNum("S!sfood",1) DestroyItem("S!sfood")~ GOTO GiveFood
  ++ ~Not at the moment. I will try to locate some for you.~ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY ~I will wait here, <RACE>.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN GiveFood
  SAY ~Meow, tasty! I am grateful, <RACE>. I have found these shiny coins. Take them.~
  IF ~~ THEN REPLY ~Thank you, cat.~ DO ~GiveItemCreate("S!scoin",Player1,2,0,0) SetGlobal("IaGotFood","LOCALS",1)~ EXIT
END
