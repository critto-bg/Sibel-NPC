BEGIN ~S!SWILL~

/* before the tree is fixed */

IF ~NumTimesTalkedTo(0) GlobalLT("IaTreePlot","GLOBAL",4)~ THEN BEGIN FirstMeeting
  SAY ~Greetings, friend. I am called Willard Arcanis, the resident librarian. Excuse my rudeness, but I am very busy trying to discover the treatment for our poor Elm tree.~
  = ~Please, come back when the situation is resolved. We will have more to discuss when the crysis is over.~
  ++ ~Very well. Goodbye, Willard.~ EXIT
END

IF ~NumTimesTalkedToGT(0) GlobalLT("IaTreePlot","GLOBAL",4)~ THEN BEGIN SubsequentMeeting
  SAY ~Hello again, my friend. Please, come back when the tree is restored. We will have more to discuss when the crysis is over.~
  ++ ~Very well. Goodbye, Willard.~ EXIT
END

/* the tree has been fixed */

IF ~NumTimesTalkedTo(0) GlobalGT("IaTreePlot","GLOBAL",3)~ THEN BEGIN FirstMeetingTreeFixed
  SAY ~Greetings, friend. I am called Willard Arcanis, the resident librarian. You have done an admirable job on treating the dear old Elm tree. I have a mind to call upon your services again if you're interested.~
  //++ ~Of course, Willard. Tell me of your troubles.~ GOTO WillardQuest
  + ~Global("IaSoldBook","LOCALS",0)~ + ~Do you sell any useful books here?~ + BuyBook
  ++ ~I will consider it. Goodbye, Willard.~ EXIT
END

IF ~NumTimesTalkedToGT(0) GlobalGT("IaTreePlot","GLOBAL",3)~ THEN BEGIN SubsequentMeetingTreeFixed
  SAY ~Hello again, my friend. We are grateful for your help. I would dare to ask for your aid once more, if you have the time to spare.~
  //++ ~Of course, Willard. Tell me of your troubles.~ GOTO WillardQuest
  + ~Global("IaSoldBook","LOCALS",0)~ + ~Do you sell any useful books here?~ + BuyBook
  ++ ~Very well. Goodbye, Willard.~ EXIT
END

IF ~~ THEN BEGIN MainMenu
  SAY ~Of course. Would you spare time to listen to my request?~
  //++ ~Of course, Willard. Tell me of your troubles.~ GOTO WillardQuest
  + ~Global("IaSoldBook","LOCALS",0)~ + ~Do you sell any useful books here?~ + BuyBook
  ++ ~Very well. Goodbye, Willard.~ EXIT
END

IF ~~ THEN BEGIN BuyBook
  SAY ~Ahh, well, this is not truly a book shop, dear <CHARNAME>. But I did find a curious tome a short while ago. I believe it to be an ancient treatise on the subject of leather making.~
  = ~You've proven to be an ally to the family, so I am willing to part with it for a modest compensation of five Arcanis coins. Would you be interested?~

  IF ~NumItemsPartyGT("S!scoin",4)~ THEN
    REPLY ~Sounds intriguing. I will buy the book, Willard.~
    DO ~TakePartyItemNum("S!scoin",5)
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        DestroyItem("S!scoin")
        GiveItemCreate("S!sleaj",Player1,0,0,0)~
    GOTO BoughtBook

  ++ ~Maybe later. Let's discuss something else.~ + MainMenu
END

IF ~~ THEN BEGIN BoughtBook
  SAY ~Please, be very gentle, it is a fragile volume.~
  IF ~~ THEN REPLY ~I will. Thank you, Willard.~ DO ~SetGlobal("IaSoldBook","LOCALS",1)~ EXIT
END
