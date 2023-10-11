BEGIN ~S!SibelB~

/* first banter */

IF ~Global("IaSibelTalks","GLOBAL",2)~ THEN BEGIN B1SibelQuestion
  SAY ~Tell me <CHARNAME>, what is the difference between intelligence and wisdom?~
  ++ ~Good question! I am all ears to listen to your own answer.~ + B1SibelAnswer
  ++ ~I have an answer to give, but I'd like to hear yours first.~ + B1SibelAnswer
END

IF ~~ THEN BEGIN B1SibelAnswer
  SAY ~If we compare our mind to a machine, intelligence is the apparatus, while wisdom is the skill to run it for the right purpose.~
  ++ ~In other words, intelligence is wit, whereas wisdom is utilizing the wit.~ + B1Clarification
END

IF ~~ THEN BEGIN B1Clarification
  SAY ~Exactly! That is why you sometimes see intelligent people who believe in absurd superstitions. They can solve complex math puzzles, but are unable to see that their fundamental beliefs about the world are misguided.~
  ++ ~I couldn't agree more.~ + B1ThankYou
  ++ ~Maybe we can say that wisdom relates more to philosophy, while intelligence is more about the capacity of calculation and utilizing the memory.~ + B1Glad
END

IF ~~ THEN BEGIN B1ThankYou
  SAY ~Thank you very much, <CHARNAME>!~
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN B1Glad
  SAY ~I am glad to see that we two think so much alike.~
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",3)~ EXIT
END

/* second banter */

IF ~Global("IaSibelTalks","GLOBAL",5)~ THEN BEGIN B2SibelQuestion
  SAY ~Have I told you about Virtus Arcanis, <CHARNAME>?~
  ++ ~No you have not, but I'm curious to hear.~ + B2WhoIsVirtus
END

IF ~~ THEN BEGIN B2WhoIsVirtus
  SAY ~He was a son of a grandson of Lord Tristan's, whom we've met in the ancient Arcanis village.~
  ++ ~He was three generations younger than Lord Arcanis?~ + B2Still
  ++ ~Was he also one of your ancestors?~ + B2Lineage
END

IF ~~ THEN BEGIN B2Still
  SAY ~Yes. Still quite a good number of generations older than my father.~
  ++ ~Was he also one of your ancestors?~ + B2Lineage
END

IF ~~ THEN BEGIN B2Lineage
  SAY ~No, my family lineage goes back to one of his father's cousins, another grandson of Lord Tristan.~
  ++ ~Go on.~ + B2MoreLineage
END

IF ~~ THEN BEGIN B2MoreLineage
  SAY ~Some say that the father of Virtus was a very attractive man. In his younger years, he succeded to win Mnemosyne's affection and married her... well... in a way. Virtus is their son.~
  ++ ~Who is Mnemosyne?~ + B2Mnemosyne
  ++ ~I recall reading the old books of lore about Mnemosyne.~ + B2Mnemosyne
END

IF ~~ THEN BEGIN B2Mnemosyne
  SAY ~Mnemosyne is the titaness and goddess of memory, a daughter of Uranus and Gaea.~
  ++ ~Go on.~ + B2More
  ++ ~Virtus was a demigod then?~ + B2More
END

IF ~~ THEN BEGIN B2More
  SAY ~My father had a theory that Virtus inherited a limited type of immortality from his mother. The onset of age and passage of time hold no power over him, yet he can be slain in battle, still.~
  ++ ~How could your father possibly know this?~ + B2How
END

IF ~~ THEN BEGIN B2How
  SAY ~I am uncertain. Maybe it was just a theory? Perhaps, he had found a scroll about Virtus in our family's old library.~
  = ~Father claimed that Virtus had left the family village when he was a child to pursue education under the tutelage of his mother.~
  ++ ~Who was the goddess of memory.~ + B2End
END

IF ~~ THEN BEGIN B2End
  SAY ~Yes, father believed Virtus to be a mage of immense power, his capacity to recite and weave magic surpassing that of mere mortal mages.~
  = ~According to father, a day will come when our enemies will strike with all their might, seeking retribution for perceived wrongs. On that day, Virtus Arcanis will return and aid us.~
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",6)~ EXIT
END

/* third banter */

IF ~Global("IaSibelClericTalk","GLOBAL",2)~ THEN BEGIN B3OnYourMind
  SAY ~You seem preoccupied, <CHARNAME>? Is there something on your mind?~
  ++ ~Yes, actually. I've had a question to ask of you for a time now.~ + B3Question
END

IF ~~ THEN BEGIN B3Question
  SAY ~Go ahead.~
  ++ ~As a priest, which god do you worship?~ + B3WhichGod
END

IF ~~ THEN BEGIN B3WhichGod
  SAY ~None! I don't worship any god.~
  IF ~~ THEN REPLY ~What is the source of your magic, then?~ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
  IF ~~ THEN REPLY ~What do you think of the gods, Sibel?~ DO ~SetGlobal("IaB3Kids","LOCALS",1)~ GOTO B3Kids
END

IF ~~ THEN BEGIN B3Wisdom
  SAY ~My magic flows from my wisdom, not from any god.~
  ++ ~Is it the same for other clerics?~ + B3Clerics
END

IF ~~ THEN BEGIN B3Clerics
  SAY ~Perhaps, for the most of them, even if they are not aware of it. They pray to their gods to fuel their magic, and the gods are pleased with the notion.~
  IF ~Global("IaB3Kids","LOCALS",0)~ THEN REPLY ~What do you think of the gods, Sibel?~ DO ~SetGlobal("IaB3Kids","LOCALS",1)~ GOTO B3Kids
  ++ ~Lord Tristan was right to call you wise.~ + B3Wise
END

IF ~~ THEN BEGIN B3Kids
  SAY ~Gods are just big kids who never grew up. They love to play and they want to be pleased.~
  ++ ~If you mean "powerful" when you say "big", then I couldn't agree more.~ + B3Power
END

IF ~~ THEN BEGIN B3Power
  SAY ~They are powerful, but have we ever knelt down in front of power?~
  ++ ~No, we haven't. Mere power is not a reason enough to be respected, let alone worshipped.~ + B3Exactly
  IF ~Global("IaB3Wisdom","LOCALS",0)~ THEN REPLY ~Where does you magic come from, then?~ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
END

IF ~~ THEN BEGIN B3Exactly
  SAY ~'Tis true!~
  IF ~Global("IaB3Wisdom","LOCALS",0)~ THEN REPLY ~What is the source of your magic, then?~ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
  ++ ~Lord Tristan was right to call you wise.~ + B3Wise
END

IF ~~ THEN BEGIN B3Wise
  SAY ~Thank you, <CHARNAME>! I am glad we are of the same mind.~

  IF ~~ THEN DO ~SetGlobal("IaSibelClericTalk","GLOBAL",3)~ EXIT
END
