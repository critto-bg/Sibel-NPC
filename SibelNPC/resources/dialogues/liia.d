BEGIN ~S!SLIIA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Intro
  SAY @3100 /* Welcome, <CHARNAME>. I am Liia Jannath, and I seek your assistance on behalf of the city. Does the name Lawrence Amberville mean anything to you? */

  ++ @3101 /* Why? What trouble did the scoundrel stir up this time? */ + Threats
  ++ @3102 /* Yes, the villain's name is known to me. */ + Threats
END

IF ~~ THEN BEGIN Threats
  SAY @3103 /* The city council received a letter of intent bearing a seal of this... Lord. He threatens to raise Athkatla to the ground lest we apprehend and deliver you to him. */
  = @3104 /* The council deemed the menace to be unsubstantial and, frankly, too ludicrous to be true. Your deeds are well known to the city's rulers, and so is your past experience in Baldur's Gate. */

  ++ @3105 /* You should've called upon me sooner. Lawrence Amberville's power is not to be underestimated. */ + Attack
END

IF ~~ THEN BEGIN Attack
  SAY @3106 /* Alas, we did underestimate the criminal, and the city is now besieged by a veritable army of golems. The goverment district is flooded with the creatures. */
  = @3107 /* I beg of you, help us put a stop to this menace, and you shall know the gratitude of the city council. */

  ++ @3108 /* Very well, Liia. I will lend my aid to you. */ + Wait
END

IF ~~ THEN BEGIN Wait
  SAY @3109 /* I am relieved to hear that. We shall seek shelter in this building. Please, find me when the threat has passed. */

  IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("S!scut12")~ EXIT
END

IF ~Global("IaAmberPlot","GLOBAL",4)~ THEN BEGIN AfterAttack
  SAY @3110 /* You return victorious, <CHARNAME>! The city remains unharmed. Please, accept these gifts in gratitude for your timely intervention. */

  IF ~~ THEN
    DO ~SetGlobal("IaAmberPlot","GLOBAL",5)
        GiveGoldForce(50000)
        GiveItemCreate("S!misc02",Player1,0,0,0)
        AddXPObject(Player1,50000)
        AddXPObject(Player2,50000)
        AddXPObject(Player3,50000)
        AddXPObject(Player4,50000)
        AddXPObject(Player5,50000)
        AddXPObject(Player6,50000)
        EscapeArea()~ EXIT
END
