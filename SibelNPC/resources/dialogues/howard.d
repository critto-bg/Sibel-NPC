APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelGreetsHoward
    SAY ~Hello, cousin. I am Sibel Arcanis. I came here from another time and place, hoping to give aid to my own family. What is happening?~
    IF ~GlobalLT("IaTreePlot","GLOBAL",4)~ THEN EXTERN ~S!SHOWA~ GreetsSibel
    IF ~GlobalGT("IaTreePlot","GLOBAL",3)~ THEN EXTERN ~S!SHOWA~ GreetsSibelTreeFixed
  END
END

BEGIN ~S!SHOWA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY ~Greetings. I am Howard Arcanis, master leatherworker of the family. Who might you be?~
  IF ~~ THEN EXTERN ~S!SibelJ~ SibelGreetsHoward
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY ~Hello again. A friend of Sibel is always welcome in my shop.~
  IF ~~ THEN GOTO MainMenu
END

IF ~~ THEN BEGIN GreetsSibel
  SAY ~Well met, cousin Sibel. We are at loss. The great Elm tree is in the worst shape it has ever been, and the quality of our leather suffers for it. Villagefolk insist on a rumor of a curse bestowed by the gods.~
  ++ ~According to Lord Arcanis, your leathermaking process does not involve slaughter of innocent animals. How is this possible?~ + NoSlaughter
END

IF ~~ THEN BEGIN NoSlaughter
  SAY ~I am sorry, stranger, but this is a closely held family secret of druidic prowess. I may only say that it comes from our relationship to the Elm tree.~
  = ~We used to craft high quality leather. But now, until the great tree regains its power, mediocre leather is all I can offer.~
  IF ~~ THEN GOTO MainMenu
END

IF ~~ THEN BEGIN GreetsSibelTreeFixed
  SAY ~Well met, cousin Sibel. The great Elm tree was in the worst shape it has ever been. But now, thanks to your help, the tree is cured and we are intent on restoring the family's fortune.~
  ++ ~According to Lord Arcanis, your leathermaking process does not involve slaughter of innocent animals. How is this possible?~ + NoSlaughterTreeFixed
END

IF ~~ THEN BEGIN NoSlaughterTreeFixed
  SAY ~I am sorry, stranger, but this is a closely held family secret of druidic prowess. I may only say that it comes from our relationship to the Elm tree.~
  = ~The great tree is growing stronger with every moment, and we may now be able to craft high quality leather.~
  IF ~~ THEN GOTO MainMenu
END

IF ~~ THEN BEGIN MainMenu
  SAY ~Would you like me to craft some leather? For Sibel, I will sell it to you with a family discount.~

  IF ~NumItemsPartyGT("S!scoin",0)
      GlobalLT("IaTreePlot","GLOBAL",4)
      OR(3)
        Global("IaLenaBoughtLeather","GLOBAL",0)
        Global("IaFlavaBoughtLeather","GLOBAL",0)
        Global("IaZoeBoughtLeather","GLOBAL",1)~ THEN
    REPLY ~I will buy a batch of mediocre Arcanis leather.~
    GOTO BuyMediocre

  IF ~NumItemsPartyGT("S!scoin",0)
      GlobalGT("IaTreePlot","GLOBAL",3)
      OR(3)
        Global("IaLenaBoughtLeather","GLOBAL",0)
        Global("IaFlavaBoughtLeather","GLOBAL",0)
        Global("IaZoeBoughtLeather","GLOBAL",1)~ THEN
    REPLY ~Can I buy a batch of high quality Arcanis leather, now that the tree is restored?~
    GOTO BuyHQ

  ++ ~Not at the moment. I will come back later.~ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY ~Goodbye.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BoughtLeather
  SAY ~Here you go.~
  IF ~~ THEN REPLY ~Take care, Howard.~ EXIT
END

IF ~~ THEN BEGIN BuyMediocre
  SAY ~It will cost you one Arcanis coin per sheet. Agreed?~

  IF  ~NumItemsPartyGT("S!scoin",0) NumItemsPartyLT("S!scoin",2)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,1,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",1) NumItemsPartyLT("S!scoin",3)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",2) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,2,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",2) NumItemsPartyLT("S!scoin",4)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",3) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,3,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",3) NumItemsPartyLT("S!scoin",5)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",4) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,4,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",4) NumItemsPartyLT("S!scoin",6)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",5) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,5,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",5) NumItemsPartyLT("S!scoin",7)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",6) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,6,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",6) NumItemsPartyLT("S!scoin",8)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",7) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,7,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",7) NumItemsPartyLT("S!scoin",9)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",8) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,8,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",8) NumItemsPartyLT("S!scoin",10)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",9) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,9,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",9) NumItemsPartyLT("S!scoin",11)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",10) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,10,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",10) NumItemsPartyLT("S!scoin",12)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",11) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,11,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",11) NumItemsPartyLT("S!scoin",13)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",12) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,12,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",12) NumItemsPartyLT("S!scoin",14)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",13) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,13,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",13) NumItemsPartyLT("S!scoin",15)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",14) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,14,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",14) NumItemsPartyLT("S!scoin",16)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",15) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,15,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",15) NumItemsPartyLT("S!scoin",17)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",16) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,16,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",16) NumItemsPartyLT("S!scoin",18)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",17) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,17,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",17) NumItemsPartyLT("S!scoin",19)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",18) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr1",Player1,18,0,0)~
    GOTO BoughtLeather

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END

IF ~~ THEN BEGIN BuyHQ
  SAY ~Of course. It will cost you one Arcanis coin per sheet. Agreed?~

  IF  ~NumItemsPartyGT("S!scoin",0) NumItemsPartyLT("S!scoin",2)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,1,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",1) NumItemsPartyLT("S!scoin",3)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",2) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,2,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",2) NumItemsPartyLT("S!scoin",4)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",3) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,3,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",3) NumItemsPartyLT("S!scoin",5)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",4) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,4,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",4) NumItemsPartyLT("S!scoin",6)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",5) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,5,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",5) NumItemsPartyLT("S!scoin",7)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",6) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,6,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",6) NumItemsPartyLT("S!scoin",8)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",7) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,7,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",7) NumItemsPartyLT("S!scoin",9)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",8) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,8,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",8) NumItemsPartyLT("S!scoin",10)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",9) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,9,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",9) NumItemsPartyLT("S!scoin",11)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",10) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,10,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",10) NumItemsPartyLT("S!scoin",12)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",11) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,11,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",11) NumItemsPartyLT("S!scoin",13)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",12) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,12,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",12) NumItemsPartyLT("S!scoin",14)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",13) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,13,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",13) NumItemsPartyLT("S!scoin",15)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",14) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,14,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",14) NumItemsPartyLT("S!scoin",16)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",15) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,15,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",15) NumItemsPartyLT("S!scoin",17)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",16) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,16,0,0)~
    GOTO BoughtLeather

  IF  ~NumItemsPartyGT("S!scoin",16) NumItemsPartyLT("S!scoin",18)~ THEN
    REPLY ~I do, let's trade.~
    DO ~TakePartyItemNum("S!scoin",17) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!slthr2",Player1,17,0,0)~
    GOTO BoughtLeather

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END
