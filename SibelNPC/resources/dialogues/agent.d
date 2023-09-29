BEGIN ~S!SAGENT~

IF ~Global("IaZoeBoughtLeather","GLOBAL",0)~ THEN BEGIN Meeting
  SAY ~Hey, friend. Are you looking to sell some leather?~
  ++ ~Hello. Why do you ask? Are you willing to buy?~ + WantToBye
  ++ ~Not at the moment, no. I'll be going.~ + Leave
END

IF ~~ THEN BEGIN WantToBye
  SAY ~Me? No, friend, I'm just an intermediary. I may introduce you to someone who does, though, for a modest commission of ten Arcanis coins.~
  IF ~NumItemsPartyGT("S!scoin",9)~ THEN
    REPLY ~This is a steep price you're asking. I'm willing to take the risk. Put me in touch with her.~
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

  ++ ~It's a great deal of coin. I will have to think about it.~ + Leave
END

IF ~~ THEN BEGIN GotPaid
  SAY ~You've made a good choice. I will tell her to meet you in the main square. Don't be late. Nice doing business with you, friend.~
  IF ~~ THEN DO ~SetGlobal("IaZoeBoughtLeather","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Leave
  SAY ~Suit yourself.~
  IF ~~ THEN EXIT
END
