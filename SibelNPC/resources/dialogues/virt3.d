BEGIN ~S!SVIRT3~

IF ~Global("IaSLawrencePlot","GLOBAL",2)~ THEN BEGIN Greeting
  SAY @4000 /* <CHARNAME>, Sibel, well met! The time of the final confrontation with Lawrence Amberville is upon us. */
  = @4001 /* I have divined the location of the villain's hideout. Even now I can feel his dreadful presence. We must strike soon lest we lose our advantage. */

  ++ @4002 /* So we shall. Will we be met with strong opposition? */ + Opposition
END

IF ~~ THEN BEGIN Opposition
  SAY @4003 /* I may not be certain, but I expect a formidable force. Lawrence never leaves sight of his closest family, all of whom has since turned into grave liches. */
  = @4004 /* Where a lich is present, so are its powerful undead guardians. And amber golems, the Amberville's favourite creation. */
  = @4005 /* Even if we catch Lawrence alone, he is our fiercest enemy. The madman has become a greater dracolich. Do not underestimate his powers. */

  ++ @4006 /* It sounds extremely dangerous. Are we to leave immediately? */ + Preparations
END

IF ~~ THEN BEGIN Preparations
  SAY @4007 /* We have time, but not much. Rest well, prepare your spells. Do not waste them before battle, the wards will nulify any magic upon entrance. */
  = @4008 /* Fear not, though, for I have a counterplan of my own. I will meet you again in eight hours. */

  IF ~~ THEN
    DO ~SetGlobal("IaSLawrencePlot","GLOBAL",3)
        SetGlobalTimer("IaSDepartTimer","GLOBAL",2400)
        EscapeArea()~
    UNSOLVED_JOURNAL @1118
    EXIT
END

IF ~Global("IaSLawrencePlot","GLOBAL",4)~ THEN BEGIN BackAgain
  SAY @4009 /* Greetings, my friends. Are you sufficiently prepared? */

  ++ @4010 /* Yes, we are ready, Virtus. */ + Depart
END

IF ~~ THEN BEGIN Depart
  SAY @4011 /* Splendid. Let us depart. */

  IF ~~ THEN
    DO ~SetGlobal("IaSLawrencePlot","GLOBAL",5)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("S!scut19")~
    EXIT
END

IF ~Global("IaSLawrencePlot","GLOBAL",6)~ THEN BEGIN Victory
  SAY @4012 /* You battled well, my friends! That was a well-deserved victory. */

  ++ @4013 /* It was an honor to fight at your side, Virtus! */ + Conclusion
END

IF ~~ THEN BEGIN Conclusion
  SAY @4014 /* I thank you, the honor is mine. Dear Sibel, our quest concludes here. Resume your travels with <CHARNAME>. */
  = @4015 /* There will be more challenges that you two will face, and I will watch your progress with great interest. */
  = @4016 /* Allow me to bestow a final gift upon you, a courtesy of my divine blood. I bid you farewell and good luck. */

  IF ~~ THEN
    DO ~ActionOverride(Player1,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player2,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player3,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player4,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player5,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player6,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player1,CreateVisualEffectObject("SPCONTIN",Myself))
        ActionOverride(Player2,CreateVisualEffectObject("SPCONTIN",Myself))
        ActionOverride(Player3,CreateVisualEffectObject("SPCONTIN",Myself))
        ActionOverride(Player4,CreateVisualEffectObject("SPCONTIN",Myself))
        ActionOverride(Player5,CreateVisualEffectObject("SPCONTIN",Myself))
        ActionOverride(Player6,CreateVisualEffectObject("SPCONTIN",Myself))
        GiveGoldForce(250000)
        EraseJournalEntry(@1109)
        EraseJournalEntry(@1110)
        EraseJournalEntry(@1111)
        EraseJournalEntry(@1114)
        EraseJournalEntry(@1117)
        EraseJournalEntry(@1118)
        TriggerActivation("TRANIA38",TRUE)
        SetGlobal("Farewell","LOCALS",2)~
    SOLVED_JOURNAL @1119
    EXIT
END