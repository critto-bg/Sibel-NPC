APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelGreetsFather
    SAY ~Hello, Father. I am so happy to see you again.~
    IF ~~ THEN EXTERN ~S!STRIST~ GreetsSibel
  END

  IF ~~ THEN BEGIN SibelTalksOfPoison
    SAY ~There's an old alchemy tower that lies to the north-west of your house, Father. We used the equipment stored inside to study a small piece of the Elm tree root.~
    = ~The alchemical apparatus discovered traces of poison within the root. Then it guided our efforts in preparation and application of the antidote.~
    IF ~~ THEN EXTERN ~S!STRIST~ TristanPleased
  END

  IF ~~ THEN BEGIN SibelThanksFather
    SAY ~Thank you, Father. It warms my heart to hear the words of praise from you.~
    IF ~~ THEN EXTERN ~S!STRIST~ LeaveAfterJournal
  END

  IF ~~ THEN BEGIN SibelSaysFarewell
    SAY ~I most certainly will. Farewell, Father!~
    IF ~~ THEN EXTERN ~S!STRIST~ PartyLeaves
  END
END

BEGIN ~S!STRIST~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY ~Hello, stranger. My name is Lord Tristan Arcanis. Who are you?~
  ++ ~My name is <CHARNAME>. Sibel Arcanis is with me. We have traveled from a different time and place, hoping to discover what had transpired in this era.~ EXTERN ~S!SibelJ~ SibelGreetsFather
END

IF ~~ THEN BEGIN GreetsSibel
  SAY ~Yes. My eyesight is gone, but I can feel the presence of a family member. Welcome, my child.~
  ++ ~What is going on in the village?~ + VillageTrouble
END

IF ~~ THEN BEGIN VillageTrouble
  SAY ~We are druids. We respect nature and we are able to produce leather without slaying animals for their hides. Not so long ago, the village had a prosperous economy, before the unpleasant events have begun to transpire. The great Elm tree grew sick, I lost my eyesight and the quality of our leather diminished.~
  ++ ~What was the cause?~ + TheCause
END

IF ~~ THEN BEGIN TheCause
  SAY ~It remains a mystery. Some folk speculate that the gods grew unhappy because the village has no temple for them and so they have bestowed a curse upon us. I place small trust in these rumors for we have been druids for centuries. The great Elm tree is our natural temple.~
  ++ ~Go on.~ + TheCausePt2
END

IF ~~ THEN BEGIN TheCausePt2
  SAY ~We are still able to produce our leathers, though the quality is not as high as it used to be. Talk to my nephew, Howard. He runs the leather workshop in the northern part of the village. Tis' my hope we have yet a chance to discover the cause of our troubles.~
  ++ ~We will do what we can to help.~ + Help
END

IF ~~ THEN BEGIN Help
  SAY ~Thank you, stranger. Here, take 6 gold coins of Arcanis family. These are the last ones we have. Spend them wisely and return to me with good news.~
  IF ~~ THEN DO ~GiveItemCreate("S!scoin",Player1,6,0,0) SetGlobal("IaTreePlot","GLOBAL",1)~ UNSOLVED_JOURNAL @1103 EXIT
END

IF ~GlobalGT("IaTreePlot","GLOBAL",0) GlobalLT("IaTreePlot","GLOBAL",4)~ THEN BEGIN QuestInProgress
  SAY ~Hello, <CHARNAME>. Do you bring any news?~
  ++ ~Not yet, Lord Arcanis. We will return later.~ EXIT
END

IF ~Global("IaTreePlot","GLOBAL",4)~ THEN BEGIN TreeCured
  SAY ~Hello, <CHARNAME>. Do you bring any news?~
  ++ ~We do, Lord Arcanis. We have managed to set the tree on the path to restoration.~ + WhatHappened
END

IF ~~ THEN BEGIN WhatHappened
  SAY ~Ah, these news warm my heart. How did it happen?~
  IF ~~ THEN EXTERN ~S!SibelJ~ SibelTalksOfPoison
END

IF ~~ THEN BEGIN TristanPleased
  SAY ~Poison, you say? I am glad we may now try and dispel those silly rumours of gods' wrath the village folk insist on.~
  = ~But who was the culprit behind the evil plan? The mystery troubles me. We shall remain vigilant in the future.~
  IF ~~ THEN DO ~SetGlobal("IaTreePlot","GLOBAL",5)~ GOTO MainMenu
END

IF ~Global("IaTreePlot","GLOBAL",5)~ THEN MainMenu
  SAY ~Thank you again for you help, <CHARNAME>. I will be happy to assist you in going back to whence your journey began.~

  + ~GlobalLT("IaAmbervillePlot","GLOBAL",4)~ + ~We are ready to go back, Lord Arcanis.~ + GoBack

  IF ~PartyHasItem("S!sjour") Global("IaAmbervillePlot","GLOBAL",3)~ THEN
    REPLY ~I believe we may have discovered the identity of the poisoner, Lord Arcanis.~
    DO ~TakePartyItem("S!sjour") DestroyItem("S!sjour")~
    GOTO ShowJournal

  ++ ~We would like to stay awhile, Lord Tristan.~ + Leave
END

IF ~~ THEN ShowJournal
  SAY ~Truly. Please, allow me to see. Fascinating...~
  = ~This turn of events brings both happiness and sadness to my heart. I have always remained sure of banality of the evil hidden behind this crime, and I am glad to be proven right.~
  = ~But I fear we have yet to discover what further schemes are brewing inside the twisted mind of lord Amberville. Nonetheless, we may finally lay this issue to rest and move forward.~
  = ~I commend you, my daughter. Your decision to enlist <CHARNAME>'s help in your investigation was a wise move. You have made your old father proud.~

  IF ~~ THEN EXTERN "S!SibelJ" SibelThanksFather
END

IF ~~ THEN LeaveAfterJournal
  SAY ~It is my pleasure, Sibel.~
  IF ~~ THEN DO ~SetGlobal("IaAmbervillePlot","GLOBAL",4) ReallyForceSpellRES("S!SWIZ","S!Sibel")~ EXIT
END

IF ~~ THEN GoBack
  SAY ~Very well, so shall it be. We are in your debt, my friend. Sibel, my dear daughter, I am glad you took the words of the old father to heart. Come and visit me again if you've the chance.~
  IF ~~ THEN EXTERN ~S!SibelJ~ SibelSaysFarewell
END

IF ~~ THEN PartyLeaves
  SAY ~Goodbye, my dear fellows.~
  IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("S!scut03")~ EXIT
END

IF ~~ THEN Leave
  SAY ~You are welcome to stay with us, my friend.~
  IF ~~ THEN EXIT
END
