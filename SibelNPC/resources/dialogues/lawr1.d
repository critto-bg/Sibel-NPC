BEGIN ~S!SLAWR1~

CHAIN
  IF ~NumTimesTalkedTo(0)~ THEN ~S!SLAWR1~ Arrival
    ~Ah, the remnants of the Arcanis family have decided to pay a visit. How sensational!~

    == ~S!SIBELJ~
    ~At least you do not claim me to be a part of yours, creature.~

    == ~S!SLAWR1~
    ~You were the one who refused my offer! Now you find out what an unwise decision that was.~

    == ~S!SVIRT3~
    ~Drop your pretence, Lawrence! The bonds of family are meaningless to you. Do your cousins think you care about them?~
    =
    ~Do they even know of your plan to sacrifice their so-called lives? Do these wretches realise that their demise will complete your transformation?~
    =
    ~Go on then. Scuttle away, a coward that you are.~

    == ~S!SLAWR1~
    ~Cease your lies. You will not tear us apart with those deceptive words. Prepare to meet your demise, wizard.~
    =
    ~I shall fetch the undertakers to prepare the funeral for you and your dearest sibling.~

    == ~S!SVIRT3~
    ~We shall see.~
    DO ~ActionOverride("S!slawr1",DestroySelf())
        JumpToPoint([1182.884])
        ActionOverride(Player1,ReallyForceSpellRES("SPINI86",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWISH12",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player2,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player3,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player4,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player5,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player6,ReallyForceSpellRES("SPWI611",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWI408",Myself))
        ActionOverride(Player2,ReallyForceSpellRES("SPWI408",Myself))
        ActionOverride(Player3,ReallyForceSpellRES("SPWI408",Myself))
        ActionOverride(Player4,ReallyForceSpellRES("SPWI408",Myself))
        ActionOverride(Player5,ReallyForceSpellRES("SPWI408",Myself))
        ActionOverride(Player6,ReallyForceSpellRES("SPWI408",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWI590",Myself))
        ActionOverride(Player2,ReallyForceSpellRES("SPWI590",Myself))
        ActionOverride(Player3,ReallyForceSpellRES("SPWI590",Myself))
        ActionOverride(Player4,ReallyForceSpellRES("SPWI590",Myself))
        ActionOverride(Player5,ReallyForceSpellRES("SPWI590",Myself))
        ActionOverride(Player6,ReallyForceSpellRES("SPWI590",Myself))~
EXIT