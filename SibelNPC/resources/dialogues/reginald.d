BEGIN ~S!SREGI~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY ~Greetings! Say, you're the person who solved our tree problem, aren't you?~
  ++ ~Correct, I am <HESHE>. Who might you be?~ + AskQuest
END

IF ~NumTimesTalkedToGT(0) Global("IaSamaraPlot","GLOBAL",0)~ THEN BEGIN 2ndMeeting
  SAY ~Greetings, my dear <MANWOMAN>. Did you happen to change your mind about my proposal?~
  ++ ~I did. I'll see what I can do, Reginald.~ + QuestTaken
  ++ ~I will think about it, Reginald.~ + Leave
END

IF ~~ THEN BEGIN AskQuest
  SAY ~Splendid, my good <MANWOMAN>! My name is Reginald. I am looking to harvest some of the wonderful Samara fruit that grows on the Elm tree.~
  = ~Alas, I am bit underequipped to handle such acrobatics. Might you consider helping a fellow out?~
  ++ ~I'll see what I can do, Reginald.~ + QuestTaken
  ++ ~I will think about it, Reginald.~ + Leave
END

IF ~~ THEN BEGIN QuestTaken
  SAY ~Marvellous! Come back soon, my friend. I'll make sure your efforts are well compensated.~
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",1)~ EXIT
END

IF ~GlobalGT("IaSamaraPlot","GLOBAL",0) GlobalLT("IaSamaraPlot","GLOBAL",10)~ THEN BEGIN WaitingForFruit
  SAY ~Greetings, my dear <MANWOMAN>. How goes your tree climbing?~

  IF ~Global("IaSamaraPlot","GLOBAL",9) PartyHasItem("S!ssama")~ THEN
    REPLY ~I've brought you the Samara fruit, Reginald.~
    DO ~TakePartyItem("S!ssama") DestroyItem("S!ssama")~
    GOTO GivenFruit

  ++ ~Still working on it, Reginald.~ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY ~Very well. I'll remain here for the time being.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN GivenFruit
  SAY ~Extraordinary! Thank you! To compensate your efforts, I will use some of the fruit to brew potions for you. Tell me which ones you prefer?~

  IF ~~ THEN
    REPLY ~I need potions that grant strength.~
    DO ~SetGlobal("IaPotionType","LOCALS",1)~
    GOTO GoWait

  IF ~~ THEN
    REPLY ~I need potions of healing.~
    DO ~SetGlobal("IaPotionType","LOCALS",2)~
    GOTO GoWait

  IF ~~ THEN
    REPLY ~I need potions of regeneration.~
    DO ~SetGlobal("IaPotionType","LOCALS",3)~
    GOTO GoWait
END

IF ~~ THEN BEGIN GoWait
  SAY ~Clever choice! Now, allow me five hours to prepare the potions.~
  IF ~~ THEN DO ~SetGlobal("IaSamaraPlot","GLOBAL",10) SetGlobalTimer("IaRegiTimer","GLOBAL",1500)~ EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",10)~ THEN BEGIN StillBrewing
  SAY ~Still working, my dear <MANWOMAN>! Be patient for awhile longer.~
  IF ~~ THEN EXIT
END

IF ~Global("IaSamaraPlot","GLOBAL",11)~ THEN BEGIN FinishedBrewing
  SAY ~It is done! Here you go.~

  IF ~Global("IaPotionType","LOCALS",1)~ THEN
    REPLY ~Thank you, Reginald.~
    DO ~GiveItemCreate("POTN06",Player1,8,0,0) GiveItemCreate("POTN07",Player1,4,0,0)~
    GOTO Farewell

  IF ~Global("IaPotionType","LOCALS",2)~ THEN
    REPLY ~Thank you, Reginald.~
    DO ~GiveItemCreate("POTN55",Player1,9,0,0)~
    GOTO Farewell

  IF ~Global("IaPotionType","LOCALS",3)~ THEN
    REPLY ~Thank you, Reginald.~
    DO ~GiveItemCreate("POTN37",Player1,15,0,0)~
    GOTO Farewell
END

IF ~~ THEN BEGIN Farewell
  SAY ~My pleasure! Now, I must take my leave. Farewell!~
  IF ~~ THEN
    DO ~AddXPObject(Player1,15000)
        AddXPObject(Player2,15000)
        AddXPObject(Player3,15000)
        AddXPObject(Player4,15000)
        AddXPObject(Player5,15000)
        AddXPObject(Player6,15000)
        EscapeArea()~
    EXIT
END
