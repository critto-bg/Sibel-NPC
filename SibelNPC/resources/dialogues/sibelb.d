BEGIN ~S!SibelB~

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
