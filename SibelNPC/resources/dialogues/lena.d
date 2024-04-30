BEGIN ~S!SLENA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY @3050 /* Hello, stranger. I am Lena, a traveling merchant and purveyor of rare alchemical ingredients. Do you wish to look at the samples of my goods? */
  ++ @3051 /* Greetings. Yes, show me what you have. */ + BuyStuff
  ++ @3052 /* Hello, Lena. Are you interested in buying some Arcanis leather? */ + SellStuff
  ++ @3053 /* Maybe later, thank you. */ + Leave
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY @3054 /* Hello again. Do you wish to take a look at my stock? */
  ++ @3051 /* Greetings. Yes, show me what you have. */ + BuyStuff
  + ~Global("IaLenaBoughtLeather","GLOBAL",0)~ + @3052 /* Hello, Lena. Are you interested in buying some Arcanis leather? */ + SellStuff
  ++ @3053 /* Maybe later, thank you. */ + Leave
END

IF ~~ THEN BEGIN MainMenu
  SAY @3055 /* Very well. Do you wish do buy or sell something? */
  ++ @3056 /* Show me your goods. */ + BuyStuff
  + ~Global("IaLenaBoughtLeather","GLOBAL",0)~ + @3057 /* Are you interested in buying some Arcanis leather? */ + SellStuff
  ++ @3053 /* Maybe later, thank you. */ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY @3058 /* Come back soon. I do not linger in one place for long. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BuyStuff
  SAY @3059 /* Wonderful. I have three different samples right now: A, B and C. You can buy any ingredient for a single Arcanis coin. */

  IF ~NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY @3060 /* I will buy ingredient A. */
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!spowda",Player1,1,0,0)~
    GOTO SoldPowder

  IF ~NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY @3061 /* I will buy ingredient B. */
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!spowdb",Player1,1,0,0) SetGlobal("IaSoldB","LOCALS",1)~
    GOTO SoldPowder

  IF ~NumItemsPartyGT("S!scoin",0)~ THEN
    REPLY @3062 /* I will buy ingredient C. */
    DO ~TakePartyItemNum("S!scoin",1) DestroyItem("S!scoin") GiveItemCreate("S!spowdc",Player1,1,0,0) SetGlobal("IaSoldC","LOCALS",1)~
    GOTO SoldPowder

  ++ @3063 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SellStuff
  SAY @3064 /* I do. If you abide by the two rules: I buy all of your stock and I buy only once. Any kind of leather will do. If your goods turn out to be decent, we may talk more in the future. Agreed? */
  + ~NumItemsPartyGT("S!slthr1",0)~ + @3065 /* Agreed. I want to sell mediocre Arcanis leather. */ + SellMediocre
  + ~NumItemsPartyGT("S!slthr2",0)~ + @3066 /* Agreed. I want to sell high quality Arcanis leather. */ + SellHQ
  ++ @3063 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SoldPowder
  SAY @3067 /* Handle it with great care. */
  IF ~~ THEN REPLY @3068 /* Thank you, Lena, we will. */ EXIT
END

IF ~~ THEN BEGIN SoldLeather
  SAY @3069 /* Perfect. I will leave soon to prepare the shipment for departure. If you need anything else, be fast about it. */
  IF ~~ THEN REPLY @3070 /* Understood. */ EXIT
END

IF ~~ THEN BEGIN SellMediocre
  SAY @3071 /* Very well. I will pay two Arcanis coins for one sheet. Are you ready to sell all your stock of mediocre leather? */

  IF  ~NumItemsPartyGT("S!slthr1",0) NumItemsPartyLT("S!slthr1",2)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",1) DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,2,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",1) NumItemsPartyLT("S!slthr1",3)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",2) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,4,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",2) NumItemsPartyLT("S!slthr1",4)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",3) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",3) NumItemsPartyLT("S!slthr1",5)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",4) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,8,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",4) NumItemsPartyLT("S!slthr1",6)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",5) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,10,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",5) NumItemsPartyLT("S!slthr1",7)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",6) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",6) NumItemsPartyLT("S!slthr1",8)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",7) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,14,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",7) NumItemsPartyLT("S!slthr1",9)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr1",8) DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        DestroyItem("S!slthr1")
        GiveItemCreate("S!scoin",Player1,16,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",8) NumItemsPartyLT("S!slthr1",10)~ THEN
    REPLY @3072 /* I am, let's trade. */
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
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",9) NumItemsPartyLT("S!slthr1",11)~ THEN
    REPLY @3072 /* I am, let's trade. */
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
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",10) NumItemsPartyLT("S!slthr1",12)~ THEN
    REPLY @3072 /* I am, let's trade. */
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
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",11) NumItemsPartyLT("S!slthr1",13)~ THEN
    REPLY @3072 /* I am, let's trade. */
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
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",12) NumItemsPartyLT("S!slthr1",14)~ THEN
    REPLY @3072 /* I am, let's trade. */
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
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr1",13) NumItemsPartyLT("S!slthr1",15)~ THEN
    REPLY @3072 /* I am, let's trade. */
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
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  ++ @3063 /* Maybe later. Let's discuss something else. */ + MainMenu
END

IF ~~ THEN BEGIN SellHQ
  SAY @3073 /* Very well. I will pay three Arcanis coins for one sheet. Are you ready to sell all your stock of high quality leather? */

  IF  ~NumItemsPartyGT("S!slthr2",0) NumItemsPartyLT("S!slthr2",2)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",1) DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,3,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",1) NumItemsPartyLT("S!slthr2",3)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",2) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,6,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",2) NumItemsPartyLT("S!slthr2",4)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",3) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,9,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",3) NumItemsPartyLT("S!slthr2",5)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",4) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,12,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",4) NumItemsPartyLT("S!slthr2",6)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",5) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,15,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",5) NumItemsPartyLT("S!slthr2",7)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",6) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,18,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",6) NumItemsPartyLT("S!slthr2",8)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",7) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,21,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",7) NumItemsPartyLT("S!slthr2",9)~ THEN
    REPLY @3072 /* I am, let's trade. */
    DO ~TakePartyItemNum("S!slthr2",8) DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        DestroyItem("S!slthr2")
        GiveItemCreate("S!scoin",Player1,24,0,0)
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  IF  ~NumItemsPartyGT("S!slthr2",8) NumItemsPartyLT("S!slthr2",10)~ THEN
    REPLY @3072 /* I am, let's trade. */
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
        SetGlobal("IaLenaBoughtLeather","GLOBAL",1)~
    GOTO SoldLeather

  ++ @3063 /* Maybe later. Let's discuss something else. */ + MainMenu
END
