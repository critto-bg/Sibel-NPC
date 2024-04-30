APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN SibelGreetsVirtus
    SAY @3900 /* So am I, dear Virtus! Please, welcome <CHARNAME> as well, a loyal friend and comrade-at-arms. */

    IF ~~ THEN EXTERN ~S!SVIRT1~ Honor
  END

  IF ~~ THEN BEGIN SibelListensVirtus
    SAY @3901 /* I am listening. */

    IF ~~ THEN EXTERN ~S!SVIRT1~ Letter
  END

  IF ~~ THEN BEGIN LawrenceLetter
    SAY @3902 /* I did. Lord Lawrence has sent me a letter wherein he boasts the treacherous deed, but offers no proof of substance. */

    IF ~~ THEN EXTERN ~S!SVIRT1~ DefeatHappened
  END

  IF ~~ THEN BEGIN LawrenceAlive
    SAY @3903 /* How come Lord Lawrence lives still? */

    IF ~~ THEN EXTERN ~S!SVIRT1~ TurnedLich
  END

  IF ~~ THEN BEGIN AsksPlayerHelp
    SAY @3904 /* I will not stand by and let you face this peril alone, Virtus. But what say you, <CHARNAME>? */

    IF ~Global("IaSibelFamilyPath","GLOBAL",1)~ THEN
       REPLY @3905 /* I stand by my word. We must fight together to avenge your fallen kin. */
       GOTO GAGFightThankYou

    IF ~Global("IaSibelFamilyPath","GLOBAL",2)~ THEN
      REPLY @3906 /* I will help you defeat Lawrence Amberville. */
      GOTO GAGFightThankYou

    IF ~Global("IaSibelFamilyPath","GLOBAL",2)~ THEN
      REPLY @3907 /* I am sorry, Sibel. This is not my fight. I have a vengeance of my own to exact. */
      GOTO LeavePartyWithVirtus
  END

  IF ~~ THEN BEGIN LeavePartyWithVirtus
    SAY @3908 /* I understand, <CHARNAME>. You have done so much for me already. Virtus and I shall face this vile creature together. Farewell! */

    IF ~~ THEN
      DO ~SetGlobal("IaSibelTalks","GLOBAL",21)
          ClearAllActions()
          StartCutSceneMode()
          StartCutScene("S!scut07")~
      EXIT
  END

  IF ~~ THEN BEGIN GAGFightThankYou
    SAY @3909 /* Thank you, <CHARNAME>! I grow confident in our victory, with you at my side! */
    = @3910 /* Come, master Virtus! Let us face this foe! */

    IF ~~ THEN EXTERN ~S!SVIRT1~ NotSoFast
  END

  IF ~~ THEN BEGIN WhatIsShades
    SAY @3911 /* Shades of Elm? What do you speak of? */

    IF ~~ THEN EXTERN ~S!SVIRT1~ WhatIsShadesIndeed
  END

  IF ~~ THEN BEGIN AsksPlayerVisitLawrenceHouse
    SAY @3912 /* Will you accompany me on this quest, <CHARNAME>? */

    ++ @3913 /* Of course. */ + TimeToPrepare
  END

  IF ~~ THEN BEGIN TimeToPrepare
    SAY @3914 /* It is settled then. <CHARNAME> and I will challenge the guardian. Will you grant us time to prepare? */

    IF ~~ THEN EXTERN ~S!SVIRT1~ NoNeed
  END

  IF ~~ THEN BEGIN ReadyToGoGAG
    SAY @3915 /* Very well. We are ready to depart. */

    IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",23) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut08")~ EXIT
  END

  IF ~~ THEN BEGIN SibelThanksVirtus
    SAY @3916 /* Thank you, master Virtus! */

    IF ~~ THEN EXTERN ~S!SVIRT1~ VirtusLeaves
  END
END

BEGIN ~S!SVIRT1~

/* initial dialogue */

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Greeting
  SAY @3917 /* Greetings, Sibel! I am pleased to meet you at last. */

  IF ~~ THEN EXTERN ~S!SibelJ~ SibelGreetsVirtus
END

IF ~~ THEN BEGIN Honor
  SAY @3918 /* It is an honor to meet you, <CHARNAME>. */

  ++ @3919 /* Honor is all mine. */ + NeedToTalk
  ++ @3920 /* Thank you, Virtus. */ + NeedToTalk
END

IF ~~ THEN BEGIN NeedToTalk
  SAY @3921 /* Well, enough with the pleasantries. I bear urgent news, Sibel. Some I consider to be good, but most aren't, so brace yourself. */

  IF ~~ THEN EXTERN ~S!SibelJ~ SibelListensVirtus
END

IF ~~ THEN BEGIN Letter
  SAY @3922 /* You may have heard that our family has suffered defeat and ruin at the hands of Ambervilles. */

  IF ~~ THEN EXTERN ~S!SibelJ~ LawrenceLetter
END

IF ~~ THEN BEGIN DefeatHappened
  SAY @3923 /* I am afraid his claim is truthful. The Arcanis family is no more. */

  IF ~~ THEN EXTERN ~S!SibelJ~ LawrenceAlive
END

IF ~~ THEN BEGIN TurnedLich
  SAY @3924 /* Lord Lawrence chose to abandon his humanity and transform into a Grave Lich, so strong was his lust for power. Dark magic keeps him alive and impervous to any harm caused by a member of Arcanis family. That is how he brought destruction upon us. */
  = @3925 /* Yet as I promised, there's still hope that we may defeat him. Neither you nor I are of a pure Arcanis lineage. Amberville blood courses through your veins, and that gives us a chance to bring the villain down. */
  = @3926 /* Which brings me to the most important question. Will you fight at my side? Let us join our strengths, and together we shall put an end to his miserable existence. For even I may not best him alone. */

  IF ~~ THEN EXTERN ~S!SibelJ~ AsksPlayerHelp
END

IF ~~ THEN BEGIN NotSoFast
  SAY @3927 /* Your enthusiasm is laudable yet hurry not, my dear. The villain's lair is known to me, and we will travel together once we've made sure you are permitted passage. */
  = @3928 /* One have to carry the paramount blessing of the Ancient Elm tree for fear lest the wards forbid them entrance. You need Shades of Elm. */

  IF ~~ THEN EXTERN ~S!SibelJ~ WhatIsShades
END

IF ~~ THEN BEGIN WhatIsShadesIndeed
  SAY @3929 /* Tis' a relic Lord Lawrence stole from Arcanis family centuries ago. He keeps it well under guard, hidden inside the family mansion in Arcanis village. */
  = @3930 /* The house is warded against my entrance, yet I know a way to breach the seals and let you and an ally of your chosing set foot inside. */

  IF ~~ THEN EXTERN ~S!SibelJ~ AsksPlayerVisitLawrenceHouse
END

IF ~~ THEN BEGIN NoNeed
  SAY @3931 /* You needn't bother. Any incantation you may choose to cast will be dispelled upon arrival. You've no choice but to come unprepared and weather whatever punishment the guardian shall bring upon your heads. */

  IF ~~ THEN EXTERN ~S!SibelJ~ ReadyToGoGAG
END

/* after the fight */

IF ~Global("IaSibelTalks","GLOBAL",24)~ THEN BEGIN WelcomeBack
  SAY @3932 /* Welcome back! That was a great performance! */

  IF ~~ THEN EXTERN ~S!SibelJ~ SibelThanksVirtus
END

IF ~~ THEN BEGIN VirtusLeaves
  SAY @3933 /* Now I will depart to make preparations for the final battle. We will reconvene when everything is ready. */
  = @3934 /* Resume your travels with <CHARNAME> and grow stronger. Our fight will not be an easy one. Until we meet again, Sibel! */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelTalks","GLOBAL",25)
        AddXPObject(Player1,90000)
        AddXPObject("S!Sibel",90000)
        SetGlobalTimer("IaAmberAssaultTimer","GLOBAL",THREE_DAYS)~
    UNSOLVED_JOURNAL @1117
    EXIT
END
