APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN GreetsReginald
    SAY @3300 /* Reginald? You were looking for the Samara fruit back in the village. How did you become a ghost? */

    IF ~~ THEN EXTERN ~S!SREGI2~ Punished
  END

  IF ~~ THEN BEGIN RegiHowToHelp
    SAY @3301 /* Such horrid tale. The evil nature of that man has no bounds. How may we help you, Reginald? */

    IF ~~ THEN EXTERN ~S!SREGI2~ HowToHelp
  END

  IF ~~ THEN BEGIN RegiShallWeHelp
    SAY @3302 /* Shall we destroy the creatures that stalk and torment poor Reginald, <CHARNAME>? */

    IF ~~ THEN
      REPLY @3303 /* We will. No decent man deserves such punishment. */
      EXTERN ~S!SREGI2~ HereTheyCome

    IF ~~ THEN
      REPLY @3304 /* I am afraid we don't have the time for it. I am sorry, Reginald. */
      EXTERN ~S!SREGI2~ Condemned
  END
END

BEGIN ~S!SREGI2~

/* before the fight */

IF ~Global("IaSRegiPlot","GLOBAL",5) !InParty("S!Sibel")~ THEN BEGIN StartNoSibel
  SAY @3305 /* <CHARNAME>! Please, bring Sibel to converse with me, I beg of you! */

  IF ~~ THEN EXIT
END

IF ~Global("IaSRegiPlot","GLOBAL",5) InParty("S!Sibel")~ THEN BEGIN Start
  SAY @3306 /* Ah, Sibel! You've come. How marvellous! Do you happen to remember your old pal Reginald? */

  IF ~~ THEN EXTERN ~S!SibelJ~ GreetsReginald
END

IF ~~ THEN BEGIN Punished
  SAY @3307 /* Indeed, I am that Reginald. I am afraid Lord Amberville did not appreciate my plundering of the Elm tree for its wonderful fruit. So he brought a most unsettling punishment upon my person. */
  = @3308 /* I have been thrust into a state between life and death. I know not the proper term for it. I am stuck in this... limbo, tormented by my jailers every single day. Oh, how I wish to cease this dreadful existence and find peace. */

  IF ~~ THEN EXTERN ~S!SibelJ~ RegiHowToHelp
END

IF ~~ THEN BEGIN HowToHelp
  SAY @3309 /* You are too kind to ask, my dear. I dared to escape the attention of my guard for the briefest moment. Yet I fear they have already caught my scent and follow the trail, eager to resume their torture. Slay them, and then my soul will find eternal rest. */

  IF ~~ THEN EXTERN ~S!SibelJ~ RegiShallWeHelp
END

IF ~~ THEN BEGIN Condemned
  SAY @3310 /* Alas, my soul is now condemned to eternal punishment. Mayhaps I'll gain another chance at freedom. */

  IF ~~ THEN DO ~SetGlobal("IaSRegiPlot","GLOBAL",9) ReputationInc(-2) DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN HereTheyCome
  SAY @3311 /* Ah, how splendid! Your kindness is unparalleled, my dear. Wait... Oh no, no! They come! */

  IF ~~ THEN DO ~SetGlobal("IaSRegiPlot","GLOBAL",6) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut10")~ EXIT
END

/* after the fight */

IF ~Global("IaSRegiPlot","GLOBAL",7)~ THEN BEGIN End
  SAY @3312 /* The creatures are no more! How extraordinary! Thank you, thank you. I may now rest in peace. Please, accept these meager gifts as a token of my gratitude. */

  IF ~~ THEN
    DO ~SetGlobal("IaSRegiPlot","GLOBAL",8)
        GiveItemCreate("S!ssama2",Player1,0,0,0)
        GiveItemCreate("S!misc01",Player1,0,0,0)
        GiveItemCreate("S!misc02",Player1,0,0,0)
        GiveItemCreate("S!misc06",Player1,0,0,0)
        GiveItemCreate("S!smisc",Player1,0,0,0)
        AddXPObject(Player1,45000)
        AddXPObject(Player2,45000)
        AddXPObject(Player3,45000)
        AddXPObject(Player4,45000)
        AddXPObject(Player5,45000)
        AddXPObject(Player6,45000)
        DestroySelf()~
    EXIT
END
