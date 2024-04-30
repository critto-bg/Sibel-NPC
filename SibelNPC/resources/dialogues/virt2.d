BEGIN ~S!SVIRT2~

IF ~NumTimesTalkedTo(1)~ THEN BEGIN MoreEnemies
  SAY @3950 /* It is of no consequence, lich. This place will become your grave. */
  = @3951 /* Before I destroy you, know this, Andrias! You are nothing but a pawn to Lawrence Amberville. */
  = @3952 /* He will look upon your death from the shadows, in vain hope that it would teach him to escape the same destiny. */
  = @3953 /* Yet it is all for naught. Nothing will save your master. <CHARNAME>, let us show them the meaning of true strength. */

  IF ~~ THEN
    DO ~SetGlobal("IasLawrenceSaw","GLOBAL",1)
        SetGlobal("IaFightBegins","AR0404",1)
        ActionOverride(Player1,ReallyForceSpellRES("SPINI84",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPINI86",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWISH16",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWISH12",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player2,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player3,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player4,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player5,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player6,ReallyForceSpellRES("SPWI611",Myself))~
    EXIT
END

IF ~NumTimesTalkedTo(2)~ THEN BEGIN FightDone
  SAY @3954 /* Well done, <CHARNAME>! I congratulate you. */

  ++ @3955 /* We appreciate your timely intervention, Virtus. Yet I wonder. */ + Wonder
END

IF ~~ THEN BEGIN Wonder
  SAY @3956 /* Tell me. */

  ++ @3957 /* You say Lord Lawrence staged the fight to observe our tactics. Should we fear the consequences? */ + Fear
END

IF ~~ THEN BEGIN Fear
  SAY @3958 /* He will seek a way to shield himself from my magic. Worry not, my friends, we may still beat him together. */
  = @3959 /* I bid you farewell for now, <CHARNAME> and Sibel. We will meet each other again. */

  IF ~~ THEN DO ~SetGlobal("Farewell","LOCALS",2)~ EXIT
END

CHAIN
  IF ~NumTimesTalkedTo(0)~ THEN ~S!SVIRT2~ Arrival
    @3960 /* I can smell your fear, creature, and that of your master's. Or else old Lawrence wouldn't dare show his hand in so crude a manner. */

    == ~S!SANDRI~
    @3961 /* What?! You were not supposed to be here! */

    == ~S!SVIRT2~
    @3962 /* You think I would abandon one of own blood in peril, monster? */

    == ~S!SANDRI~
    @3963 /* B-but... Lord Lawrence placed the seals upon this place his own self! They bear the mark of Amberville magic! What trickery doest allow thee entrance? */

    == ~S!SVIRT2~
    @3964 /* Andrias, you pathetic fool! These petty tricks you call magic are mere illusions, they wouldn't fool a peasant at a carnival. */
    =
    @3965 /* Cast your spells if you dare. They won't silence me, nor will they keep me away. */

    == ~S!SANDRI~
      @3966 /* Do not underestimate me, wizard! There's more power at my disposal than you may think. */
      DO ~ClearAllActions() StartCutSceneMode() StartCutScene("S!scut16")~
EXIT
