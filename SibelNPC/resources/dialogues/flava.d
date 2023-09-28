BEGIN ~S!SFLAVA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY ~Well met, traveler. Call me Flava, the most reliable leather merchant around these parts! Are you looking to sell some leather?~
  ++ ~Nice to meet you, Flava. I have some Arcanis leather to sell.~ + SellStuff
  + ~Global("IaSoldFood","LOCALS",0)~ + ~Greetings. Do you have any items to sell?~ + BuyStuff
  ++ ~Maybe later. Goodbye.~ + Leave
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY ~You came back! Want to sell some leather?~
  + ~Global("IaBoughtLeather","LOCALS",0)~ + ~Yes, Flava, let us trade.~ + SellStuff
  + ~Global("IaSoldFood","LOCALS",0)~ + ~Greetings. Do you have any items to sell?~ + BuyStuff
  ++ ~Maybe later. Goodbye.~ + Leave
END

IF ~~ THEN BEGIN MainMenu
  SAY ~Most certainly!~
  + ~Global("IaBoughtLeather","LOCALS",0)~ + ~I want to sell some leather.~ + SellStuff
  + ~Global("IaSoldFood","LOCALS",0)~ + ~Show me your goods.~ + BuyStuff
  ++ ~Farewell, Flava.~ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY ~See ya!~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BuyStuff
  SAY ~I mostly just buy leather. I do have some nice animal food, though. I will sell it to you for a single Arcanis coin.~

  IF ~NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY ~I will buy it!~
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!sfood",Player1,1,0,0) SetGlobal("IaSoldFood","LOCALS",1)~
    GOTO SoldFood

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END

IF ~~ THEN BEGIN SellStuff
  SAY ~Excellent! But my caravan is packed to the brim. I may only buy one full stock from you.~
  + ~NumItemsPartyGT("S!slthr1",0)~ + ~Agreed. I want to sell mediocre Arcanis leather.~ + SellMediocre
  + ~NumItemsPartyGT("S!slthr2",0)~ + ~Agreed. I want to sell high quality Arcanis leather.~ + SellHQ
  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END

IF ~~ THEN BEGIN SoldFood
  SAY ~I hope you like it! It's a family recipe.~
  IF ~~ THEN REPLY ~Thank you, Flava.~ EXIT
END

IF ~~ THEN BEGIN SoldLeather
  SAY ~Smart choice! Spend those coin well.~
  IF ~~ THEN REPLY ~I will, Flava, thank you.~ EXIT
END

IF ~~ THEN BEGIN SellMediocre
  SAY ~I will pay you two Arcanis coins per sheet. Deal?~

  IF  ~NumItemsPartyGT("S!slthr1",0) NumItemsPartyLT("S!slthr1",2)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,2,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",1) NumItemsPartyLT("S!slthr1",3)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,4,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",2) NumItemsPartyLT("S!slthr1",4)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",3) NumItemsPartyLT("S!slthr1",5)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,8,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",4) NumItemsPartyLT("S!slthr1",6)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,10,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",5) NumItemsPartyLT("S!slthr1",7)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",6) NumItemsPartyLT("S!slthr1",8)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,14,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",7) NumItemsPartyLT("S!slthr1",9)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,16,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",8) NumItemsPartyLT("S!slthr1",10)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,18,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",9) NumItemsPartyLT("S!slthr1",11)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,20,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",10) NumItemsPartyLT("S!slthr1",12)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,22,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",11) NumItemsPartyLT("S!slthr1",13)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,24,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",12) NumItemsPartyLT("S!slthr1",14)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,26,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",13) NumItemsPartyLT("S!slthr1",15)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,28,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END

IF ~~ THEN BEGIN SellHQ
  SAY ~I will pay you three Arcanis coins per sheet. Deal?~

  IF  ~NumItemsPartyGT("S!slthr2",0) NumItemsPartyLT("S!slthr2",2)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,3,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",1) NumItemsPartyLT("S!slthr2",3)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",2) NumItemsPartyLT("S!slthr2",4)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,9,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",3) NumItemsPartyLT("S!slthr2",5)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",4) NumItemsPartyLT("S!slthr2",6)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,15,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",5) NumItemsPartyLT("S!slthr2",7)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,18,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",6) NumItemsPartyLT("S!slthr2",8)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,21,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",7) NumItemsPartyLT("S!slthr2",9)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,24,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",8) NumItemsPartyLT("S!slthr2",10)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,27,0,0)
        SetGlobal("IaBoughtLeather","LOCALS",1)~
    GOTO SoldLeather

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END
