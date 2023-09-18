BEGIN ~S!SibelP~

IF ~Global("IaSibelJoined","LOCALS",1)~ THEN BEGIN KickOut
  SAY ~Do you want me to leave the group, <CHARNAME>?~
  IF ~~ THEN REPLY ~No, Sibel, you should remain with us.~ DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY ~Yes, we should go our separate ways for now.~ DO ~SetGlobal("IaSibelJoined","LOCALS",0)~ GOTO WhereToGo
END

IF ~Global("IaSibelJoined","LOCALS",0)~ THEN BEGIN ReJoin
  SAY ~It is good to see you, <CHARNAME>! Do you want to me to travel with you again?~
  IF ~~ THEN
    REPLY ~Yes, Sibel, let us join forces together.~
    DO ~SetGlobal("IaSibelJoined","LOCALS",1) JoinParty()~
    GOTO SayWelcome
  IF ~~ THEN REPLY ~No, we should go our separate ways for now.~ GOTO SayGoodbye
END

IF ~~ THEN BEGIN WhereToGo
  SAY "Very well. Do you want me to wait for you here?"
  // TODO: area checks for this option?
  IF ~~ THEN REPLY ~Yes, we'll come back for you later.~ GOTO SibelStaysPut
  IF ~!AreaCheck("AR0702")~ THEN
    REPLY ~No, you should go back to Adventurer's Mart. I will look for you there if I need your help again.~
    GOTO SibelGoesBack
END

IF ~~ THEN BEGIN SibelStaysPut
  SAY "As you wish, <CHARNAME>, I will stay here for awhile. Goodbye."
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SibelGoesBack
  SAY "As you wish, <CHARNAME>. Goodbye."
  IF ~~ THEN DO ~EscapeAreaMove("AR0702",755,335,3)~ EXIT
END

IF ~~ THEN BEGIN SayWelcome
  SAY ~I am glad you have changed your mind, <CHARNAME>. Let us be off.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SayGoodbye
  SAY ~Very well, <CHARNAME>. If you happen to change your mind, I'll be staying here for awhile.~
  IF ~~ THEN EXIT
END