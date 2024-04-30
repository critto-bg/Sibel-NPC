BEGIN ~S!SIBEL~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY @3410 /* Hello. My name is Sibel, Sibel Arcanis. May I ask your name? */
  ++ @3411 /* Greetings. You certainly may. I am called <CHARNAME>. What brings you here? */ + SibelExpoBegin
END

IF ~~ THEN BEGIN SibelExpoBegin
  SAY @3412 /* I was bargaining for some supplies with the good merchant over there. I am about to embark on an adventure, and this seemed like a reasonable first step. */
  ++ @3413 /* Adventure, you say? Would you mind telling me more about it? */ + SibelFamily
END

IF ~~ THEN BEGIN SibelFamily
  SAY @3414 /* Well, I see no reason why I shouldn't. My family has lived in the Forgotten Realms several centuries ago. There was a village built near and around a huge elm tree. They had been a community of librarians, druids and excellent leather craftstmen, before the curse happened. */
  ++ @3415 /* The curse? */ + TheCurse
END

IF ~~ THEN BEGIN TheCurse
  SAY @3416 /* My father believed that a curse was cast on the family by the gods themselves. They were druids, mages, warriors and scholars aplenty. None took the path of priesthood. No temple was ever built in the village. */
  = @3417 /* And so the elm tree grew dry and lifeless, the quality of the famous family leather dropped and the family's fortune has withered. */
  ++ @3418 /* Go on. */ + TheCurse2
END

IF ~~ THEN BEGIN TheCurse2
  SAY @3419 /* Before his death, father urged me to find a way to undo the family curse. He had tried himself but failed. */
  ++ @3420 /* Fascinating. Do you feel any effects of the curse upon you? */ + OfferJoin
END

IF ~~ THEN BEGIN OfferJoin
  SAY @3421 /* Not really, no. But father had told me that when the curse is lifted I would feel the difference. You seem like a capable <MANWOMAN>. Perhaps, we may join together and find a way to break the curse? */
  ++ @3422 /* You are welcome to join me, Sibel. Together we shall see what could be done about this curse of yours. */ + SibelJoins
  ++ @3423 /* I am afraid I have to decline your plea, Sibel. I wish you best of luck with your endeavour. */ + SayGoodbye
END

// TODO: add the usual BG2 reactivity here, protagonist asks Sibel about joining forces against Irenicus and so on
IF ~~ THEN BEGIN SibelJoins
  SAY @3424 /* Thank you! I am ready to go whenever you are. I will be glad to lend my strengths to you in your own quest, whatever it may be. */
  IF ~~ THEN REPLY @3425 /* Let us be off then. */ DO ~SetGlobal("IaSibelJoined","LOCALS",1) JoinParty()~ EXIT
END

IF ~~ THEN BEGIN SayGoodbye
  SAY @3426 /* Very well, <CHARNAME>. If you happen to change your mind, I'll be staying here for a while. */
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN SubsequentMeeting
  SAY @3427 /* Hello, <CHARNAME>. You're back! Have you reconsidered my proposal to join you? */
  ++ @3428 /* Yes, you are welcome to join me, Sibel. Together we shall see what could be done about this curse of yours. */ + SibelJoins
  ++ @3429 /* I am afraid I haven't, Sibel. I hope you will manage to break the curse. */ + SayGoodbye
END
