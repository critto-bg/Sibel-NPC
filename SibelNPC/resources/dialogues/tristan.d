APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelGreetsFather
    SAY ~Hello, Father. I am so happy to see you again.~
    IF ~~ THEN EXTERN ~S!STRIST~ GreetsSibel
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

IF ~GlobalGT("IaTreePlot","GLOBAL",0)~ THEN BEGIN QuestInProgress
  SAY ~Hello, <CHARNAME>. Do you bring any news?~
  ++ ~Not yet, Lord Arcanis. We will return later.~ EXIT
END
