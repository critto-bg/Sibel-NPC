BEGIN ~S!SZOE~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY @4150 /* Greetings. I'm Zoe. An acquaintance of mine says you want to sell some leather. Do you? */
  ++ @4151 /* Hello, Zoe. Yes, I have some Arcanis leather to sell. */ + SellStuff
  + ~Global("IaZoeSoldBoots","GLOBAL",0)~ + @4152 /* Greetings. Do you have any items to sell? */ + BuyStuff
  ++ @4153 /* Maybe later. Goodbye. */ + Leave
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY @4154 /* Changed your mind? */
  + ~Global("IaZoeBoughtLeather","GLOBAL",1)~ + @4155 /* Yes, let us trade. */ + SellStuff
  + ~Global("IaZoeSoldBoots","GLOBAL",0)~ + @4152 /* Greetings. Do you have any items to sell? */ + BuyStuff
  ++ @4153 /* Maybe later. Goodbye. */ + Leave
END

IF ~~ THEN BEGIN MainMenu
  SAY @4156 /* What do you want? */
  + ~Global("IaZoeBoughtLeather","GLOBAL",1)~ + @4157 /* I want to sell some leather. */ + SellStuff
  + ~Global("IaZoeSoldBoots","GLOBAL",0)~ + @4158 /* Show me your goods. */ + BuyStuff
  ++ @4159 /* I have to go. Farewell. */ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY @4160 /* Come back when you're ready to do business. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BuyStuff
  SAY @4161 /* I can sell you a pair of Boots of Speed. Five Arcanis coins, no haggling. */

  IF ~NumItemsPartyGT("S!scoin",4)~ THEN
    REPLY @4162 /* I will take them. */
    DO ~TakePartyItemNum("S!scoin",5) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("boot01",Player1,1,0,0) SetGlobal("IaZoeSoldBoots","GLOBAL",1)~
    GOTO SoldBoots

  ++ @4163 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SellStuff
  SAY @4164 /* Very well. I do business the same way as the other merchants. I'll buy one whole stock from you. */
  + ~NumItemsPartyGT("S!slthr1",0)~ + @4165 /* Agreed. I want to sell mediocre Arcanis leather. */ + SellMediocre
  + ~NumItemsPartyGT("S!slthr2",0)~ + @4166 /* Agreed. I want to sell high quality Arcanis leather. */ + SellHQ
  ++ @4163 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SoldBoots
  SAY @4167 /* Happy running. */
  IF ~~ THEN REPLY @4168 /* Thank you. */ EXIT
END

IF ~~ THEN BEGIN SoldLeather
  SAY @4169 /* Done. Now leave me. */
  IF ~~ THEN REPLY @4170 /* Goodbye, Zoe. */ EXIT
END

IF ~~ THEN BEGIN SellMediocre
  SAY @4171 /* I will pay you two Arcanis coins per sheet. Deal? */

  IF  ~NumItemsPartyGT("S!slthr1",0) NumItemsPartyLT("S!slthr1",2)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,2,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",1) NumItemsPartyLT("S!slthr1",3)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",2) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,4,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",2) NumItemsPartyLT("S!slthr1",4)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",3) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",3) NumItemsPartyLT("S!slthr1",5)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",4) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,8,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",4) NumItemsPartyLT("S!slthr1",6)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",5) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,10,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",5) NumItemsPartyLT("S!slthr1",7)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",6) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",6) NumItemsPartyLT("S!slthr1",8)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",7) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,14,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",7) NumItemsPartyLT("S!slthr1",9)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",8) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,16,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",8) NumItemsPartyLT("S!slthr1",10)~ THEN
    REPLY @4172 /* I do, let's trade. */
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
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",9) NumItemsPartyLT("S!slthr1",11)~ THEN
    REPLY @4172 /* I do, let's trade. */
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
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",10) NumItemsPartyLT("S!slthr1",12)~ THEN
    REPLY @4172 /* I do, let's trade. */
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
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",11) NumItemsPartyLT("S!slthr1",13)~ THEN
    REPLY @4172 /* I do, let's trade. */
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
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",12) NumItemsPartyLT("S!slthr1",14)~ THEN
    REPLY @4172 /* I do, let's trade. */
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
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",13) NumItemsPartyLT("S!slthr1",15)~ THEN
    REPLY @4172 /* I do, let's trade. */
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
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",14) NumItemsPartyLT("S!slthr1",16)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",15) DestroyItem("S!slthr1")
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
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,30,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",15) NumItemsPartyLT("S!slthr1",17)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",16) DestroyItem("S!slthr1")
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
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,32,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",16) NumItemsPartyLT("S!slthr1",18)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",17) DestroyItem("S!slthr1")
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
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,34,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",17) NumItemsPartyLT("S!slthr1",19)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",18) DestroyItem("S!slthr1")
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
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,36,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  ++ @4163 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SellHQ
  SAY @4173 /* I will pay you three Arcanis coins per sheet. Deal? */

  IF  ~NumItemsPartyGT("S!slthr2",0) NumItemsPartyLT("S!slthr2",2)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,3,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",1) NumItemsPartyLT("S!slthr2",3)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",2) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",2) NumItemsPartyLT("S!slthr2",4)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",3) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,9,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",3) NumItemsPartyLT("S!slthr2",5)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",4) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",4) NumItemsPartyLT("S!slthr2",6)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",5) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,15,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",5) NumItemsPartyLT("S!slthr2",7)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",6) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,18,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",6) NumItemsPartyLT("S!slthr2",8)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",7) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,21,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",7) NumItemsPartyLT("S!slthr2",9)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",8) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,24,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",8) NumItemsPartyLT("S!slthr2",10)~ THEN
    REPLY @4172 /* I do, let's trade. */
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
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",9) NumItemsPartyLT("S!slthr2",11)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",10) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,30,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",10) NumItemsPartyLT("S!slthr2",12)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",11) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,33,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",11) NumItemsPartyLT("S!slthr2",13)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",12) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,36,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",12) NumItemsPartyLT("S!slthr2",14)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",13) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,39,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",13) NumItemsPartyLT("S!slthr2",15)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",14) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,42,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",14) NumItemsPartyLT("S!slthr2",16)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",15) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,45,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",15) NumItemsPartyLT("S!slthr2",17)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",16) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,48,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",16) NumItemsPartyLT("S!slthr2",18)~ THEN
    REPLY @4172 /* I do, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",17) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,51,0,0)
        SetGlobal("IaZoeBoughtLeather","GLOBAL",2)~
    GOTO SoldLeather

  ++ @4163 /* Maybe later. Let's discuss something else. */ + MainMenu
END
