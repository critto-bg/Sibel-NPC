BEGIN ~S!SLAWR2~

CHAIN
  IF ~NumTimesTalkedTo(0)~ THEN ~S!SLAWR2~ Arrival
    ~Do you think you've won, Virtus Arcanis? Behold, wizard, for I will show you what real power looks like.~
    =
    ~This will teach you once and for all what a fool you are to stand in my way.~

    == ~S!SVIRT3~
    ~Poor Lawrence! You sacrifice everything to become an undead reptile? Such a pathetic mess you have made of your family's legacy.~
    =
    ~How many lackeys did you send after us, observing from the shadows as we fight?~
    =
    ~Do you think all that knowledge protects you from our strengths? What a typical power-hungry fool you are.~
    =
    ~All that precious amber you've consumed has only made you vulnerable both to magic and sword. Your power comes at a price, and it is high time you've paid it.~
    DO ~ActionOverride(Player1,ReallyForceSpellRES("SPINI84",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPINI86",Myself))
        ActionOverride(Player1,ReallyForceSpellRES("SPWISH16",Myself))~
EXIT