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
  SAY ~Greetings, friend. I am called Willard Arcanis, the resident librarian. You have done an admirable job on treating the dear old Elm tree. How may I be of service?~
  + ~Global("IaAmbervillePlot","GLOBAL",0)~ + ~You seem troubled, Willard. Tell me of it.~ GOTO WillardQuest
  + ~Global("IaSoldBook","LOCALS",0)~ + ~Do you sell any useful books here?~ + BuyBook
  ++ ~Goodbye, Willard.~ EXIT
END

IF ~NumTimesTalkedToGT(0) GlobalGT("IaTreePlot","GLOBAL",3)~ THEN BEGIN SubsequentMeetingTreeFixed
  SAY ~Hello again, my friend. We are grateful for your help. How may I be of service?~
  + ~Global("IaAmbervillePlot","GLOBAL",0)~ + ~You seem troubled, Willard. Tell me of it.~ GOTO WillardQuest
  + ~Global("IaAmbervillePlot","GLOBAL",2) PartyHasItem("S!sjour")~ + ~We have searched the Amberville Mansion, Willard.~ GOTO WillardQuestPt2
  + ~GlobalGT("IaAmbervillePlot","GLOBAL",5) PartyHasItem("S!schunk")~ + ~Good news, Willard! We have secured some amber for you.~ GOTO Amber
  + ~Global("IaSoldBook","LOCALS",0)~ + ~Do you sell any useful books here?~ + BuyBook
  ++ ~Goodbye, Willard.~ EXIT
END

IF ~~ THEN BEGIN MainMenu
  SAY ~Of course. How may I be of service?~
  + ~Global("IaAmbervillePlot","GLOBAL",0)~ + ~You seem troubled, Willard. Tell me of it.~ GOTO WillardQuest
  + ~Global("IaAmbervillePlot","GLOBAL",2) PartyHasItem("S!sjour")~ + ~We have searched the Amberville Mansion, Willard.~ GOTO WillardQuestPt2
  + ~GlobalGT("IaAmbervillePlot","GLOBAL",5) PartyHasItem("S!schunk")~ + ~Good news, Willard! We have secured some amber for you.~ GOTO Amber
  + ~Global("IaSoldBook","LOCALS",0)~ + ~Do you sell any useful books here?~ + BuyBook
  ++ ~Goodbye, Willard.~ EXIT
END

/* amberville plot */

IF ~~ THEN BEGIN WillardQuest
  SAY ~Ahh, it is such a silly little thing. Probably isn't worth your time. You see, my dear fellow, I am also a researcher. I have been performing studies that require a certain quantity of amber.~
  = ~Unfortunately, I have none. I believe there's a way to procure some, however. Just south of my library lies a house that belonged to the old Lord Amberville. He comes from an old clan of amber barons.~
  = ~Now, he was a spiteful, jealous little man, and I am happy to say his family has been gone from the village for some time now. But the amber they've had might lay there still. Would you help me recover it?~

  IF ~~ THEN
    REPLY ~I would be happy to oblige, Willard.~
    DO ~GiveItemCreate("S!sakey",Player1,0,0,0) SetGlobal("IaAmbervillePlot","GLOBAL",1)~
    GOTO QuestAccepted

  ++ ~I will think about it. Let's discuss something else.~ + MainMenu
END

IF ~~ THEN BEGIN QuestAccepted
  SAY ~Oh, wonderful! Here, take the key to the old family mansion. It's just a short walk south from here.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN WillardQuestPt2
  SAY ~Ahh, indeed. Please, do tell of your discovery. Did you manage to find the amber?~
  ++ ~Unfortunately, no. But we did find lord Amberville's journal hidden in one of the drawers.~ + JournalRead
END

IF ~~ THEN BEGIN JournalRead
  SAY ~Hmm, let me see... This is most curious, indeed.~
  = ~I say, this journal is quite enlightening. I always knew Lawrence was a vile creature. You should show this journal to old Tristan.~
  = ~I wish I'd be there with you to witness his glee. Lord Arcanis had always scolded folk of the village for spreading those silly rumours.~

  ++ ~Thank you, Willard. We will bring this journal to Lord Arcanis.~ + LeaveWithJournal
END

IF ~~ THEN BEGIN LeaveWithJournal
  SAY ~Send him my regards.~
  IF ~~ THEN DO ~SetGlobal("IaAmbervillePlot","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN Amber
  SAY ~Ahh, this is wonderful news indeed! This comes from that dreadful attack on our village, I presume? What a terrible commotion! Please, give the amber to me.~
  IF ~~ THEN REPLY ~Here you go, Willard.~ DO ~TakePartyItem("S!schunk") DestroyItem("S!schunk")~ GOTO GaveAmber
END

IF ~~ THEN BEGIN GaveAmber
  SAY ~Thank you, <CHARNAME>. Your help was timely and indispensable. Please, accept this book as a token of my gratitude. I believe it will be of great help to an individual with your occupation.~
  IF ~~ THEN
    REPLY ~Thank you, Willard.~
    DO ~GiveItemCreate("BOOK04",Player1,0,0,0)
        AddXPObject(Player1,15000)
        AddXPObject(Player2,15000)
        AddXPObject(Player3,15000)
        AddXPObject(Player4,15000)
        AddXPObject(Player5,15000)
        AddXPObject(Player6,15000)~
    EXIT
END

/* book purchase */

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
