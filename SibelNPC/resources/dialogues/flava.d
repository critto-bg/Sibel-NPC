BEGIN ~S!SFLAVA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY @2550 /* Well met, traveler. Call me Flava, the most reliable leather merchant around these parts! Are you looking to sell some leather? */
  ++ @2551 /* Nice to meet you, Flava. I have some Arcanis leather to sell. */ + SellStuff
  + ~Global("IaCatFood","ARIA28",1)~ + @2552 /* Greetings. Do you have anything to sell? */ + BuyStuff
  ++ @2553 /* Maybe later. Goodbye. */ + Leave
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY @2554 /* You came back! Want to sell some leather? */
  + ~Global("IaFlavaBoughtLeather","GLOBAL",0)~ + @2555 /* Yes, Flava, let us trade. */ + SellStuff
  + ~Global("IaCatFood","ARIA28",1)~ + @2552 /* Greetings. Do you have anything to sell? */ + BuyStuff
  ++ @2553 /* Maybe later. Goodbye. */ + Leave
END

IF ~~ THEN BEGIN MainMenu
  SAY @2556 /* Most certainly! */
  + ~Global("IaFlavaBoughtLeather","GLOBAL",0)~ + @2557 /* I want to sell some leather. */ + SellStuff
  + ~Global("IaCatFood","ARIA28",1)~ + @2558 /* Do you have anything to sell? */ + BuyStuff
  ++ @2559 /* Farewell, Flava. */ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY @2560 /* See ya! */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BuyStuff
  SAY @2561 /* I mostly just buy leather. I do have some nice animal food, though. I will sell it to you for a single Arcanis coin. */

  IF ~NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY @2562 /* I will buy it! */
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!sfood",Player1,1,0,0) SetGlobal("IaCatFood","ARIA28",2)~
    GOTO SoldFood

  ++ @2563 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SellStuff
  SAY @2564 /* Excellent! But my caravan is packed to the brim. I may only buy one full stock from you. */
  + ~NumItemsPartyGT("S!slthr1",0)~ + @2565 /* Agreed. I want to sell mediocre Arcanis leather. */ + SellMediocre
  + ~NumItemsPartyGT("S!slthr2",0)~ + @2566 /* Agreed. I want to sell high quality Arcanis leather. */ + SellHQ
  ++ @2563 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SoldFood
  SAY @2567 /* I hope you like it! It's a family recipe. */
  IF ~~ THEN REPLY @2568 /* Thank you, Flava. */ EXIT
END

IF ~~ THEN BEGIN SoldLeather
  SAY @2569 /* Smart choice! Spend those coin well. */
  IF ~~ THEN REPLY @2570 /* I will, Flava, thank you. */ EXIT
END

IF ~~ THEN BEGIN SellMediocre
  SAY @2571 /* I will pay you two Arcanis coins per sheet. Deal? */

  IF  ~NumItemsPartyGT("S!slthr1",0) NumItemsPartyLT("S!slthr1",2)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,2,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",1) NumItemsPartyLT("S!slthr1",3)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",2) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,4,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",2) NumItemsPartyLT("S!slthr1",4)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",3) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",3) NumItemsPartyLT("S!slthr1",5)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",4) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,8,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",4) NumItemsPartyLT("S!slthr1",6)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",5) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,10,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",5) NumItemsPartyLT("S!slthr1",7)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",6) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",6) NumItemsPartyLT("S!slthr1",8)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",7) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,14,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",7) NumItemsPartyLT("S!slthr1",9)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",8) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,16,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",8) NumItemsPartyLT("S!slthr1",10)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",9) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,18,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",9) NumItemsPartyLT("S!slthr1",11)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",10) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,20,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",10) NumItemsPartyLT("S!slthr1",12)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",11) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,22,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",11) NumItemsPartyLT("S!slthr1",13)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",12) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,24,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",12) NumItemsPartyLT("S!slthr1",14)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",13) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,26,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",13) NumItemsPartyLT("S!slthr1",15)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",14) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,28,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  ++ @2563 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SellHQ
  SAY @2573 /* I will pay you three Arcanis coins per sheet. Deal? */

  IF  ~NumItemsPartyGT("S!slthr2",0) NumItemsPartyLT("S!slthr2",2)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,3,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",1) NumItemsPartyLT("S!slthr2",3)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",2) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",2) NumItemsPartyLT("S!slthr2",4)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",3) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,9,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",3) NumItemsPartyLT("S!slthr2",5)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",4) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",4) NumItemsPartyLT("S!slthr2",6)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",5) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,15,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",5) NumItemsPartyLT("S!slthr2",7)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",6) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,18,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",6) NumItemsPartyLT("S!slthr2",8)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",7) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,21,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",7) NumItemsPartyLT("S!slthr2",9)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",8) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,24,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",8) NumItemsPartyLT("S!slthr2",10)~ THEN
    REPLY @2572 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",9) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,27,0,0)
        SetGlobal("IaFlavaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  ++ @2563 /* Maybe later. Let's discuss something else. */ + MainMenu
END
