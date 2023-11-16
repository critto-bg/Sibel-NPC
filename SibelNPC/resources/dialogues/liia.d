BEGIN ~S!SLIIA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Intro
  SAY ~Welcome, <CHARNAME>. I am Liia Jannath, and I seek your assistance on behalf of the city. Does the name Lawrence Amberville mean anything to you?~

  ++ ~Why? What trouble did the scoundrel stir up this time?~ + Threats
  ++ ~Yes, the villain's name is known to me.~ + Threats
END

IF ~~ THEN BEGIN Threats
  SAY ~The city council received a letter of intent bearing a seal of this... Lord. He threatens to raise Athkatla to the ground lest we apprehend and deliver you to him.~
  = ~The council deemed the menace to be unsubstantial and, frankly, too ludicrous to be true. Your deeds are well known to the city's rulers, and so is your past experience in Baldur's Gate.~

  ++ ~You should've called upon me sooner. Lawrence Amberville's power is not to be underestimated.~ + Attack
END

IF ~~ THEN BEGIN Attack
  SAY ~Alas, we did underestimate the criminal, and the city is now besieged by a veritable army of golems. The goverment district is flooded with the creatures.~
  = ~I beg of you, help us put a stop to this menace, and you shall know the gratitude of the city council.~

  ++ ~Very well, Liia. I will lend my aid to you this time.~ + Wait
END

IF ~~ THEN BEGIN Wait
  SAY ~I am relieved to hear that. We shall seek shelter in this building. Please, find me when the threat has passed.~

  IF ~~ THEN DO ~SetGlobal("IaAmberPlot","GLOBAL",3) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut12")~ EXIT
END

IF ~Global("IaAmberPlot","GLOBAL",4)~ THEN BEGIN AfterAttack
  SAY ~You return victorious, <CHARNAME>! The city remains unharmed. Please, accept these gifts in gratitude for your timely intervention.~

  IF ~~ THEN DO ~SetGlobal("IaAmberPlot","GLOBAL",5) GiveGoldForce(50000) GiveItemCreate("S!misc02",Player1,0,0,0) EscapeArea()~ EXIT
END
