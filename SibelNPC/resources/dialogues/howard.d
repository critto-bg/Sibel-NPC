APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelGreetsHoward
    SAY ~Hello, Howard. I am Sibel Arcanis. I came here from another time and place, hoping to give aid to my own family. What is happening?~
    IF ~GlobalLT("IaTreePlot","GLOBAL",4)~ THEN EXTERN ~S!SHOWA~ GreetsSibel
    IF ~GlobalGT("IaTreePlot","GLOBAL",3)~ THEN EXTERN ~S!SHOWA~ GreetsSibelTreeFixed
  END

  IF ~~ THEN BEGIN GiftNoTime
    SAY ~Years! Howard, we may not have this kind of time. <CHARNAME> needs my help to return and continue <HISHER> journey. I afraid we may not even have the chance to meet again.~
    IF ~~ THEN EXTERN ~S!SHOWA~ HideGift
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
  SAY ~Well met, Sibel. We are at loss. The great Elm tree is in the worst shape it has ever been, and the quality of our leather suffers for it. Villagefolk insist on a rumor of a curse bestowed by the gods.~
  ++ ~According to Lord Arcanis, your leathermaking process does not involve slaughter of innocent animals. How is this possible?~ + NoSlaughter
END

IF ~~ THEN BEGIN NoSlaughter
  SAY ~I am sorry, stranger, but this is a closely held family secret of druidic prowess. I may only say that it comes from our relationship to the Elm tree.~
  = ~We used to craft high quality leather. But now, until the great tree regains its power, mediocre leather is all I can offer.~
  IF ~~ THEN GOTO MainMenu
END

IF ~~ THEN BEGIN GreetsSibelTreeFixed
  SAY ~Well met, Sibel. The great Elm tree was in the worst shape it has ever been. But now, thanks to your help, the tree is cured and we are intent on restoring the family's fortune.~
  ++ ~According to Lord Arcanis, your leathermaking process does not involve slaughter of innocent animals. How is this possible?~ + NoSlaughterTreeFixed
END

IF ~~ THEN BEGIN NoSlaughterTreeFixed
  SAY ~I am sorry, stranger, but this is a closely held family secret of druidic prowess. I may only say that it comes from our relationship to the Elm tree.~
  = ~The great tree is growing stronger with every moment, and we may now be able to craft high quality leather.~
  IF ~~ THEN GOTO MainMenu
END

IF ~~ THEN BEGIN MainMenu
  SAY ~Would you like me to craft some leather? For Sibel, I will sell it to you with a family discount.~

  IF ~GlobalGT("IaTreePlot","GLOBAL",3)
      Global("IaCraftedArmor","LOCALS",0)
      PartyHasItem("S!slea01")~
    REPLY ~Could you make an upgrade for Sibel's armor?~
    GOTO CraftArmor

  IF ~GlobalGT("IaTreePlot","GLOBAL",3)
      Global("IaZoeSoldBoots","GLOBAL",1)
      PartyHasItem("boot01")~
    REPLY ~Could you improve these Boots of Speed for Sibel?~
    GOTO CraftBoots

  IF ~GlobalGT("IaTreePlot","GLOBAL",3)
      Global("IaChosenGift","ARIA33",0)
      PartyHasItem("S!sleaj")~
    REPLY ~I have purchased this tome, perhaps you may find it useful?~
    GOTO BookExcitement

  IF ~GlobalGT("IaTreePlot","GLOBAL",3)
      Global("IaChosenGift","ARIA33",1)
      PartyHasItem("S!sleaj")~
    REPLY ~I am ready to discuss the preparation of the craft piece.~
    GOTO ChooseGiftPrice

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

/* dialog termination states */

IF ~~ THEN BEGIN Leave
  SAY ~Goodbye.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BoughtLeather
  SAY ~Here you go.~
  IF ~~ THEN REPLY ~Take care, Howard.~ EXIT
END

IF ~~ THEN BEGIN CraftedArmor
  SAY ~Here you go. Take good care of it.~
  IF ~~ THEN REPLY ~Thank you, Howard.~ DO ~SetGlobal("IaCraftedArmor","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN CraftedBoots
  SAY ~Here you go.~
  IF ~~ THEN REPLY ~Thank you, Howard.~ DO ~SetGlobal("IaZoeSoldBoots","GLOBAL",2)~ EXIT
END

/* howard's gift */

IF ~~ THEN BEGIN BookExcitement
  SAY ~Oh, my. This a rare treasure that you possess, my friend. I could only imagine the depth of knowledge it may uncover.~
  ++ ~Could this book guide you to craft something unique for Sibel?~ + Timeline
END

IF ~~ THEN BEGIN Timeline
  SAY ~I believe it may be possible. But the project would take months or even years to accomplish.~
  IF ~~ THEN EXTERN ~S!SibelJ~ GiftNoTime
END

IF ~~ THEN BEGIN HideGift
  SAY ~Tis' true, dear Sibel. I am not a young man, and your travels pull you away in a direction I cannot follow. So I fear you may be right.~
  = ~A solution comes to mind, but it carries great risk. When the craft piece is finished, I will find a way to hide it close to whence you came from.~
  = ~I cannot give you precise location, only hope that you may find it safely stored upon your return.~

  IF ~~ THEN
    REPLY ~We have no choice but to try it. Let us proceed.~
    DO ~SetGlobal("IaChosenGift","ARIA33",1)~
    GOTO ChooseGiftPrice

  IF ~~ THEN
    REPLY ~I have to think carefully and consider my options. I will return later.~
    DO ~SetGlobal("IaChosenGift","ARIA33",1)~
    GOTO Leave
END

IF ~~ THEN BEGIN ChooseGiftPrice
  SAY ~Very well. First, I would ask you to choose an amount of coin you are willing to spend on the project. It will cover any unforeseen expenses I might encounter in the future.~

  IF ~NumItemsPartyGT("S!scoin",9)~ THEN
    REPLY ~We are willing to spend ten coins on the project.~
    DO ~TakePartyItemNum("S!scoin",10)
        DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin")
        SetGlobal("IaSGiftStrength","GLOBAL",1)~
    GOTO ChooseGiftLocation

  IF ~NumItemsPartyGT("S!scoin",19)~ THEN
    REPLY ~We are willing to spend twenty coins on the project.~
    DO ~TakePartyItemNum("S!scoin",20)
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        SetGlobal("IaSGiftStrength","GLOBAL",2)~
    GOTO ChooseGiftLocation

  IF ~NumItemsPartyGT("S!scoin",39)~ THEN
    REPLY ~We are willing to spend fourty coins on the project.~
    DO ~TakePartyItemNum("S!scoin",40)
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin") DestroyItem("S!scoin")
        SetGlobal("IaSGiftStrength","GLOBAL",3)~
    GOTO ChooseGiftLocation

  IF ~~ THEN
    REPLY ~We will think and return later, Howard!~
    GOTO Leave
END

IF ~~ THEN BEGIN ChooseGiftLocation
  SAY ~Excellent. Now, I need to know a general location for your gift. Do you have something in mind?~

  IF ~~ THEN
    REPLY ~Hide it somewhere in a dungeon.~
    DO ~SetGlobal("IaChoseDungeon","ARIA33",1)~
    GOTO FinaliseGift

  IF ~~ THEN
    REPLY ~Hide it somewhere in a city.~
    DO ~SetGlobal("IaChoseCity","ARIA33",1)~
    GOTO FinaliseGift
END

IF ~~ THEN BEGIN FinaliseGift
  SAY ~Very well. I will take the tome now and begin my studies immediately.~

  IF ~~ THEN
    REPLY ~Thank you, Howard.~
    DO ~TakePartyItem("S!sleaj") DestroyItem("S!sleaj") TriggerActivation("To2100",FALSE) SetGlobal("IaChosenGift","ARIA33",2)~
    EXIT
END

/* main menu options */

IF ~~ THEN BEGIN CraftArmor
  SAY ~Of course. I will make it free of charge, as a token of gratitude for your help with the tree. Shall I proceed?~
  IF ~Class("S!Sibel",CLERIC_ALL)~ THEN
    REPLY ~Yes, please, make the armor.~
    DO ~TakePartyItem("S!slea01")
        DestroyItem("S!slea01")
        GiveItemCreate("S!slea02","S!Sibel",0,0,0)~
    GOTO CraftedArmor

  IF ~!Class("S!Sibel",CLERIC_ALL)~ THEN
    REPLY ~Yes, please, make the armor.~
    DO ~TakePartyItem("S!slea01")
        DestroyItem("S!slea01")
        GiveItemCreate("S!slea03","S!Sibel",0,0,0)~
    GOTO CraftedArmor

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END

IF ~~ THEN BEGIN CraftBoots
  SAY ~I believe I know a way. But I will need to spend some of my hiqh quality leather, so I will charge you a single Arcanis coin. Shall I proceed?~
  IF ~NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY ~Yes, please, make the boots.~
    DO ~TakePartyItemNum("S!scoin",1)
        DestroyItem("S!scoin")
        TakePartyItem("boot01")
        DestroyItem("boot01")
        GiveItemCreate("S!sboo01","S!Sibel",0,0,0)~
    GOTO CraftedBoots

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
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
