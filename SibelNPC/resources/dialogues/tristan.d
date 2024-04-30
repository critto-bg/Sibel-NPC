APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelGreetsTristan
    SAY @3850 /* Hello, dear ancestor. I am so happy to see you. */
    IF ~~ THEN EXTERN ~S!STRIST~ GreetsSibel
  END

  IF ~~ THEN BEGIN SibelTalksOfPoison
    SAY @3851 /* There's an old alchemy tower that lies to the north-west of your house. We used the equipment stored inside to study a small piece of the Elm tree root. */
    = @3852 /* The alchemical apparatus discovered traces of poison within the root. Then it guided our efforts in preparation and application of the antidote. */
    IF ~~ THEN EXTERN ~S!STRIST~ TristanPleased
  END

  IF ~~ THEN BEGIN SibelTalksOfLawrence
    SAY @3853 /* We found a journal written by lord Lawrence Amberville. In these pages, he boasts about his plan to poison the tree and blame it on the gods. */
    IF ~~ THEN EXTERN ~S!STRIST~ TristanReactsToAmberville
  END

  IF ~~ THEN BEGIN SibelThanksTristan
    SAY @3854 /* Thank you, Lord Tristan. It warms my heart to hear the words of praise from you. */
    IF ~~ THEN EXTERN ~S!STRIST~ LeaveAfterJournal
  END

  IF ~~ THEN BEGIN SibelSaysFarewell
    SAY @3855 /* I most certainly will. Farewell! */
    IF ~~ THEN EXTERN ~S!STRIST~ PartyLeaves
  END
END

BEGIN ~S!STRIST~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY @3856 /* Hello, stranger. My name is Lord Tristan Arcanis. Who are you? */
  ++ @3857 /* My name is <CHARNAME>. Sibel Arcanis is with me. We have traveled from a different time and place, hoping to discover what had transpired in this era. */ EXTERN ~S!SibelJ~ SibelGreetsTristan
END

IF ~~ THEN BEGIN GreetsSibel
  SAY @3858 /* Yes. My eyesight is gone, but I can feel the presence of a family member. Welcome, my child. */
  ++ @3859 /* What is going on in the village? */ + VillageTrouble
END

IF ~~ THEN BEGIN VillageTrouble
  SAY @3860 /* We are druids. We respect nature and we are able to produce leather without slaying animals for their hides. Not so long ago, the village had a prosperous economy, before the unpleasant events have begun to transpire. The great Elm tree grew sick, I lost my eyesight and the quality of our leather diminished. */
  ++ @3861 /* What was the cause? */ + TheCause
END

IF ~~ THEN BEGIN TheCause
  SAY @3862 /* It remains a mystery. Some folk speculate that the gods grew unhappy because the village has no temple for them and so they have bestowed a curse upon us. I place small trust in these rumors for we have been druids for centuries. The great Elm tree is our natural temple. */
  ++ @3863 /* Go on. */ + TheCausePt2
END

IF ~~ THEN BEGIN TheCausePt2
  SAY @3864 /* We are still able to produce our leathers, though the quality is not as high as it used to be. Talk to my nephew, Howard. He runs the leather workshop in the northern part of the village. Tis' my hope we have yet a chance to discover the cause of our troubles. */
  ++ @3865 /* We will do what we can to help. */ + Help
END

IF ~~ THEN BEGIN Help
  SAY @3866 /* Thank you, stranger. Here, take 6 gold coins of Arcanis family. These are the last ones we have. Spend them wisely and return to me with good news. */
  IF ~~ THEN DO ~GiveItemCreate("S!scoin",Player1,6,0,0) SetGlobal("IaTreePlot","GLOBAL",1)~ UNSOLVED_JOURNAL @1103 EXIT
END

IF ~GlobalGT("IaTreePlot","GLOBAL",0) GlobalLT("IaTreePlot","GLOBAL",4)~ THEN BEGIN QuestInProgress
  SAY @3867 /* Hello, <CHARNAME>. Do you bring any news? */
  ++ @3868 /* Not yet, Lord Arcanis. We will return later. */ EXIT
END

IF ~Global("IaTreePlot","GLOBAL",4)~ THEN BEGIN TreeCured
  SAY @3867 /* Hello, <CHARNAME>. Do you bring any news? */
  ++ @3869 /* We do, Lord Arcanis. We have managed to set the tree on the path to restoration. */ + WhatHappened
END

IF ~~ THEN BEGIN WhatHappened
  SAY @3870 /* Ah, these news warm my heart. How did it happen? */
  IF ~~ THEN EXTERN ~S!SibelJ~ SibelTalksOfPoison
END

IF ~~ THEN BEGIN TristanPleased
  SAY @3871 /* Poison, you say? I am glad we may now try and dispel those silly rumours of gods' wrath the village folk insist on. */
  = @3872 /* But who was the culprit behind the evil plan? The mystery troubles me. We shall remain vigilant in the future. */
  IF ~~ THEN DO ~SetGlobal("IaTreePlot","GLOBAL",5)~ GOTO MainMenu
END

/* after the tree is cured */

IF ~Global("IaTreePlot","GLOBAL",5) OR(2) GlobalLT("IaAmbervillePlot","GLOBAL",5) GlobalGT("IaAmbervillePlot","GLOBAL",6)~ THEN MainMenu
  SAY @3873 /* Thank you again for you help, <CHARNAME>. I will be happy to assist you in going back to whence your journey began. */

  + ~OR(2) GlobalLT("IaAmbervillePlot","GLOBAL",4) GlobalGT("IaAmbervillePlot","GLOBAL",6)~ + @3874 /* We are ready to go back, Lord Arcanis. */ + GoBack
  + ~Global("IaAmbervillePlot","GLOBAL",4)~ + @3874 /* We are ready to go back, Lord Arcanis. */ + TheFight

  IF ~PartyHasItem("S!sjour") Global("IaAmbervillePlot","GLOBAL",3)~ THEN
    REPLY @3875 /* I believe we may have discovered the identity of the poisoner, Lord Arcanis. */
    DO ~TakePartyItem("S!sjour") DestroyItem("S!sjour")~
    GOTO ShowJournal

  ++ @3876 /* We would like to stay awhile, Lord Tristan. */ + Leave
END

IF ~Global("IaAmbervillePlot","GLOBAL",6)~ THEN PartyReturns
  SAY @3877 /* You came back! What news do you bear? */
  ++ @3878 /* The fighting is over, Lord Tristan. The enemy has been defeated. */ + FightOver
END

IF ~~ THEN ShowJournal
  SAY @3879 /* Truly? Please, tell me more. */
  IF ~~ THEN EXTERN ~S!SibelJ~ SibelTalksOfLawrence
END

IF ~~ THEN TristanReactsToAmberville
  SAY @3880 /* Lord Amberville, you say? Fascinating... This turn of events brings both happiness and sadness to my heart. */
  = @3881 /* I have always remained sure of banality of the evil hidden behind this crime, and I am glad to be proven right. */
  = @3882 /* But I fear we have yet to discover what further schemes are brewing inside the twisted mind of lord Amberville. Nonetheless, we may finally lay this issue to rest and move forward. */
  = @3883 /* I commend you, child. Your decision to enlist <CHARNAME>'s help in your investigation was a wise move. You have made old Tristan proud. */

  IF ~~ THEN EXTERN "S!SibelJ" SibelThanksTristan
END

IF ~~ THEN LeaveAfterJournal
  SAY @3884 /* It is my pleasure, Sibel. */
  IF ~~ THEN DO ~SetGlobal("IaAmbervillePlot","GLOBAL",4) ReallyForceSpellRES("S!SWIZ","S!Sibel")~ EXIT
END

IF ~~ THEN TheFight
  SAY @3885 /* Very well, so shall... Wait! Can you hear the commotion? What is this disturbance? I fear lord Lawrence has decided to make good on his threat much earlier than I had expected. */
  = @3886 /* Quick, <CHARNAME>, I beg of your help for one last time. Go to the main square. I will call upon the forces of nature to bring a powerful prehistoric ally to your side. Make haste! */

  IF ~XPLT(Player1,1275000)~ THEN
    DO ~SetGlobal("IaAmbervillePlot","GLOBAL",5)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("S!scutf1")~
    EXIT

  IF ~XPGT(Player1,1274999) XPLT(Player1,1700000)~ THEN
    DO ~SetGlobal("IaAmbervillePlot","GLOBAL",5)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("S!scutf2")~
    EXIT

  IF ~XPGT(Player1,1699999) XPLT(Player1,2125000)~ THEN
    DO ~SetGlobal("IaAmbervillePlot","GLOBAL",5)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("S!scutf3")~
    EXIT

  IF ~XPGT(Player1,2124999) XPLT(Player1,2550000)~ THEN
    DO ~SetGlobal("IaAmbervillePlot","GLOBAL",5)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("S!scutf4")~
    EXIT

  IF ~XPGT(Player1,2549999)~ THEN
    DO ~SetGlobal("IaAmbervillePlot","GLOBAL",5)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("S!scutf5")~
    EXIT
END

IF ~~ THEN FightOver
  SAY @3887 /* This is wonderful news! You have saved us once again, <CHARNAME>. Lord Amberville proved to be more cunning and daring opponent than I'd given him credit for. */
  = @3888 /* I beg your forgiveness, but I must take the time to ponder on the events that have transpired in the village. Come back when you decide to leave and resume your travels. */
  IF ~~ THEN DO ~SetGlobal("IaAmbervillePlot","GLOBAL",7)~ EXIT
END

IF ~~ THEN GoBack
  SAY @3889 /* Very well, so shall it be. We are in your debt, my friend. Sibel, dear child, I am glad you took the words of the old man to heart. Come and visit me again if you've the chance. */
  IF ~~ THEN EXTERN ~S!SibelJ~ SibelSaysFarewell
END

IF ~~ THEN PartyLeaves
  SAY @3890 /* Goodbye, my dear fellows. */
  IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("S!scut03")~ EXIT
END

IF ~~ THEN Leave
  SAY @3891 /* You are welcome to stay with us, my friend. */
  IF ~~ THEN EXIT
END
