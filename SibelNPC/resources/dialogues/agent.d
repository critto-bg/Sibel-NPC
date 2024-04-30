BEGIN ~S!SAGENT~

IF ~Global("IaZoeBoughtLeather","GLOBAL",0)~ THEN BEGIN Meeting
  SAY @2000 /* Hey, friend. Are you looking to sell some leather? */
  ++ @2001 /* Hello. Why do you ask? Are you willing to buy? */ + WantToBye
  ++ @2002 /* Not at the moment, no. I'll be going. */ + Leave
END

IF ~~ THEN BEGIN WantToBye
  SAY @2003 /* Me? No, friend, I'm just an intermediary. I may introduce you to someone who does, though, for a modest commission of ten Arcanis coins. */
  IF ~NumItemsPartyGT("S!scoin",9)~ THEN
    REPLY @2004 /* This is a steep price you're asking. I'm willing to take the risk. Put me in touch with her. */
    DO ~TakePartyItemNum("S!scoin",10) DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")~
    GOTO GotPaid

  ++ @2005 /* It's a great deal of coin. I will have to think about it. */ + Leave
END

IF ~~ THEN BEGIN GotPaid
  SAY @2006 /* You've made a good choice. I will tell her to meet you in the main square. Don't be late. Nice doing business with you, friend. */
  IF ~~ THEN DO ~SetGlobal("IaZoeBoughtLeather","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Leave
  SAY @2007 /* Suit yourself. */
  IF ~~ THEN EXIT
END
