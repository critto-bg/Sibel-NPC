BEGIN ~S!SWISH1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Intro
  SAY @4100 /* A mere mortal <MANWOMAN> summons me? Yet <HESHE> dares to possess a relic that only the gods may carry. I will reward your audacity. */

  IF ~~ THEN GOTO Menu
END

IF ~~ THEN BEGIN Menu
  SAY @4101 /* You may ask three wishes of me. State your desire. */

  IF ~GLobalLT("IaSFlaskPerm","GLOBAL",2)~ THEN REPLY @4102 /* I want a lasting wish. */ GOTO Permanent
  IF ~GLobalLT("IaSFlaskTemp","GLOBAL",1)~ THEN REPLY @4103 /* I want a temporary wish. */ GOTO Temporary
END

IF ~~ THEN BEGIN Permanent
  SAY @4104 /* Pronounce your wish. You may gain only two that are lasting. */

  IF ~Global("IaSFlaskHP","GLOBAL",0)~ THEN
    REPLY @4105 /* All party members gain 30HP permanently. */
    DO ~IncrementGlobal("IaSFlaskPerm","GLOBAL",1)
        SetGlobal("IaSFlaskHP","GLOBAL",1)
        ActionOverride(Player1,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player2,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player3,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player4,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player5,ForceSpellRES("S!sfla01",Myself))
        ActionOverride(Player6,ForceSpellRES("S!sfla01",Myself))
        ApplySpell(Myself,POOF_GONE)~
    EXIT

  IF ~Global("IaSFlaskMDR","GLOBAL",0)~ THEN
    REPLY @4106 /* All party members gain +20% resistance to magic damage permanently. */
    DO ~IncrementGlobal("IaSFlaskPerm","GLOBAL",1)
        SetGlobal("IaSFlaskMDR","GLOBAL",1)
        ActionOverride(Player1,ForceSpellRES("S!sfla02",Myself))
        ActionOverride(Player2,ForceSpellRES("S!sfla02",Myself))
        ActionOverride(Player3,ForceSpellRES("S!sfla02",Myself))
        ActionOverride(Player4,ForceSpellRES("S!sfla02",Myself))
        ActionOverride(Player5,ForceSpellRES("S!sfla02",Myself))
        ActionOverride(Player6,ForceSpellRES("S!sfla02",Myself))
        ApplySpell(Myself,POOF_GONE)~
    EXIT

  IF ~Global("IaSFlaskDex","GLOBAL",0)~ THEN
    REPLY @4107 /* All party members gain +3 Dexterity permanently. */
    DO ~IncrementGlobal("IaSFlaskPerm","GLOBAL",1)
        SetGlobal("IaSFlaskDex","GLOBAL",1)
        ActionOverride(Player1,ForceSpellRES("S!sfla03",Myself))
        ActionOverride(Player2,ForceSpellRES("S!sfla03",Myself))
        ActionOverride(Player3,ForceSpellRES("S!sfla03",Myself))
        ActionOverride(Player4,ForceSpellRES("S!sfla03",Myself))
        ActionOverride(Player5,ForceSpellRES("S!sfla03",Myself))
        ActionOverride(Player6,ForceSpellRES("S!sfla03",Myself))
        ApplySpell(Myself,POOF_GONE)~
    EXIT

  IF ~GLobalLT("IaSFlaskTemp","GLOBAL",1)~ THEN REPLY @4108 /* I want a temporary wish instead. */ GOTO Temporary
END

IF ~~ THEN BEGIN Temporary
  SAY @4109 /* Pronounce your wish. You may gain only one that is transitory. */

  IF ~~ THEN
    REPLY @4110 /* All party members become immune to electrical discharge for the next one hour. */
    DO ~IncrementGlobal("IaSFlaskTemp","GLOBAL",1)
        ActionOverride(Player1,ForceSpellRES("S!sfla04",Myself))
        ActionOverride(Player2,ForceSpellRES("S!sfla04",Myself))
        ActionOverride(Player3,ForceSpellRES("S!sfla04",Myself))
        ActionOverride(Player4,ForceSpellRES("S!sfla04",Myself))
        ActionOverride(Player5,ForceSpellRES("S!sfla04",Myself))
        ActionOverride(Player6,ForceSpellRES("S!sfla04",Myself))
        ApplySpell(Myself,POOF_GONE)~
    EXIT

  IF ~~ THEN
    REPLY @4111 /* All party members score a critical hit with every hit for the next one hour. */
    DO ~IncrementGlobal("IaSFlaskTemp","GLOBAL",1)
        ActionOverride(Player1,ForceSpellRES("S!sfla05",Myself))
        ActionOverride(Player2,ForceSpellRES("S!sfla05",Myself))
        ActionOverride(Player3,ForceSpellRES("S!sfla05",Myself))
        ActionOverride(Player4,ForceSpellRES("S!sfla05",Myself))
        ActionOverride(Player5,ForceSpellRES("S!sfla05",Myself))
        ActionOverride(Player6,ForceSpellRES("S!sfla05",Myself))
        ApplySpell(Myself,POOF_GONE)~
    EXIT

  IF ~~ THEN
    REPLY @4112 /* All party members regenerate 9HP per second for the next one hour. */
    DO ~IncrementGlobal("IaSFlaskTemp","GLOBAL",1)
        ActionOverride(Player1,ForceSpellRES("S!sfla06",Myself))
        ActionOverride(Player2,ForceSpellRES("S!sfla06",Myself))
        ActionOverride(Player3,ForceSpellRES("S!sfla06",Myself))
        ActionOverride(Player4,ForceSpellRES("S!sfla06",Myself))
        ActionOverride(Player5,ForceSpellRES("S!sfla06",Myself))
        ActionOverride(Player6,ForceSpellRES("S!sfla06",Myself))
        ApplySpell(Myself,POOF_GONE)~
    EXIT

  IF ~GLobalLT("IaSFlaskPerm","GLOBAL",2)~ THEN REPLY @4113 /* I want a lasting wish instead. */ GOTO Permanent
END
