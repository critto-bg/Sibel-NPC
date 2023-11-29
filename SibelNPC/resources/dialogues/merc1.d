BEGIN ~S!SMERC1~

IF ~True()~ THEN BEGIN Start
  SAY ~Would you be <CHARNAME> by any chance?~

  ++ ~I am <HIMHER>. And what is the reason for your curiosity?~ + Amber
END

IF ~~ THEN BEGIN Amber
  SAY ~I hear you're on the lookout for some amber, no?~

  ++ ~How did you come upon such information?~ + Resources
  ++ ~Are you willing to sell some?~ + NotExactly
END

IF ~~ THEN BEGIN Resources
  SAY ~Tis' the city of coins, my <LADYLORD>. All sorts of information are available to an enterprising man. Folk have seen you carry amber to the blacksmith's shop.~

  ++ ~Did they, now? And what is your interest? Are you a purveyor of amber?~ + NotExactly
END

IF ~~ THEN BEGIN NotExactly
  SAY ~Well, not exactly. I happen to know a good source of it, though. This knowledge could be yours for a fair price of 5000 gold pieces.~

  ++ ~Fair enough. Lead the way. If your tale rings true, you will get the coin.~ + Rats
END

IF ~~ THEN BEGIN Rats
  SAY ~Alas, I shall not keep you company. You see, I am allergic to rats.~

  ++ ~Rats?~ + YesRats
END

IF ~~ THEN BEGIN YesRats
  SAY ~Yes, the place is swarming with the nasty rodents. I can't stand them. Just give me the gold, and I will tell you all about it.~

  ++ ~Very well, name the place and take your gold. And think twice before you try to swindle me.~ + Sewers
END

IF ~~ THEN BEGIN Sewers
  SAY ~Thank you, my <LADYLORD>. I am no cheat. Just head to the sewers beneath Copper Coronet. That place has seen some changes as of late.~

  IF ~~ THEN
    DO ~SetGlobal("IaAndriasPlot","GLOBAL",1)
        SetGlobalTimer("IaSMerchTimer","GLOBAL",3)
        TakePartyGold(5000)
        DestroyGold(5000)
        EscapeArea()~
    EXIT
END