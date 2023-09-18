BEGIN ~S!SIBEL~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY ~Hello. My name is Sibel, Sibel Arcanis. May I ask your name?~
  ++ ~Greetings. You certainly may. I am called <CHARNAME>. What brings you here?~ + SibelExpoBegin
END

IF ~~ THEN BEGIN SibelExpoBegin
  SAY ~I was bargaining for some supplies with the good merchant over there. I am about to embark on an adventure, and this seemed like a reasonable first step.~
  ++ ~Adventure, you say? Would you mind telling me more about it?~ + SibelFamily
END

IF ~~ THEN BEGIN SibelFamily
  SAY ~Well, I see no reason why I shouldn't. My family has lived in the Forgotten Realms several centuries ago. There was a village built near and around a huge elm tree. They had been a community of librarians, druids and excellent leather craftstmen, before the curse happened.~
  ++ ~The curse?~ + TheCurse
END

IF ~~ THEN BEGIN TheCurse
  SAY ~My father believed that a curse was cast on the family by the gods themselves. They were druids, mages, warriors and scholars aplenty. None took the path of priesthood. No temple was ever built in the village.~
  = ~And so the elm tree grew dry and lifeless, the quality of the famous family leather dropped and the family's fortune has withered.~
  ++ ~Go on.~ + TheCurse2
END

IF ~~ THEN BEGIN TheCurse2
  SAY ~Before his death, Father urged me to find a way to undo the family curse. He had tried himself but failed.~
  ++ ~Fascinating. Do you feel any effects of the curse upon you?~ + OfferJoin
END

IF ~~ THEN BEGIN OfferJoin
  SAY ~Not really, no. But Father had told me that when the curse is lifted I would feel the difference. You seem like a capable <MANWOMAN>. Perhaps, we may join together and find a way to break the curse?~
  ++ ~You are welcome to join me, Sibel. Together we shall see what could be done about this curse of yours.~ + SibelJoins
  ++ ~I am afraid I have to decline your plea, Sibel. I wish you best of luck with your endeavour.~ + SayGoodbye
END

// TODO: add the usual BG2 reactivity here, protagonist asks Sibel about joining forces against Irenicus and so on
IF ~~ THEN BEGIN SibelJoins
  SAY ~Thank you! I am ready to go whenever you are. I will be glad to lend my strengths to you in your own quest, whatever it may be.~
  IF ~~ THEN REPLY ~Let us be off then.~ DO ~SetGlobal("IaSibelJoined","LOCALS",1) JoinParty()~ EXIT
END

IF ~~ THEN BEGIN SayGoodbye
  SAY ~Very well, <CHARNAME>. If you happen to change your mind, I'll be staying here for a while.~
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY ~Hello, <CHARNAME>. You're back! Have you reconsidered my proposal to join you?~
  ++ ~Yes, you are welcome to join me, Sibel. Together we shall see what could be done about this curse of yours.~ + SibelJoins
  ++ ~I am afraid I haven't, Sibel. I hope you will manage to break the curse.~ + SayGoodbye
END
