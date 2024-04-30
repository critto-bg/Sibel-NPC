BEGIN ~S!SibelJ~

/* react to player's hostility in the village */

IF ~Global("IaSVillageHostile","GLOBAL",2)~ THEN BEGIN VillageHostile
  SAY @3700 /* I will not tolerate any harm done to the innocent folk of my village, <CHARNAME>! */

  IF ~~ THEN
    DO ~SetGlobal("IaSVillageHostile","GLOBAL",3) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut05")~
    EXIT
END

/* post-dream talk */

IF ~Global("IaSibelDream","GLOBAL",2)~ THEN BEGIN DoYouRemember
  SAY @3701 /* Do you remember what I told you about my family history? */
  ++ @3702 /* Yes, I do. */ + SibelDream
END

IF ~~ THEN BEGIN SibelDream
  SAY @3703 /* I didn't sleep well last night. I saw my father in a dream. He said that I should seek a monument near an ancient prison. */
  = @3704 /* The monument is actually a time travel portal which can take us to Arcanis village when the problems had just begun. */
  + ~Global("IaSibelInWK","GLOBAL",0)~ + @3705 /* Do you have any clue where this monument may be? */ + SeekMonument
  + ~Global("IaSibelInWK","GLOBAL",1)~ + @3706 /* The ancient prison your father spoke of might refer to Watcher's Keep. */ + BeenInWK
END

IF ~~ THEN BEGIN SeekMonument
  SAY @3707 /* No, I am afraid I have never seen it before. But I will recognize its features if we chance upon it. */
  ++ @3708 /* Very well, let us begin our search then. */ DO ~SetGlobal("IaSibelDream","GLOBAL",3)~ UNSOLVED_JOURNAL @1100 EXIT
END

IF ~~ THEN BEGIN BeenInWK
  SAY @3709 /* Yes, you may be right, <CHARNAME>. I will recognize its features if I see it once more. */
  ++ @3710 /* Let us depart for Watcher's Keep then. */ DO ~SetGlobal("IaSibelDream","GLOBAL",3)~ UNSOLVED_JOURNAL @1101 EXIT
END

IF ~Global("IaSibelDream","GLOBAL",4)~ THEN BEGIN FoundMonument
  SAY @3711 /* Here we are! Look, that is the monument father told me about. Will you come with me through the portal to travel in time and space to my family's village? */
  ++ @3712 /* Yes, I am ready to embark on this journey. It is time to discover what troubles have befallen your people. */ + TravelTogether
  ++ @3713 /* Regretfully, I must decline. What if we fail to return to Athkatla? That is a risk I am not willing to take, Sibel. */ + SibelLeavesAlone
END

IF ~~ THEN BEGIN TravelTogether
  SAY @3714 /* Wonderful! Come, we need to approach the portal stone for the teleportation spell to work. */
  IF ~~ THEN
    DO ~SetGlobal("IaSibelDream","GLOBAL",5) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut01")~
    EXIT
END

IF ~~ THEN BEGIN SibelLeavesAlone
  SAY @3715 /* I understand your hesitation. I will depart on my own, then, for I must discover a way to undo the curse. I hope we may meet again, <CHARNAME>. */
  IF ~~ THEN
    DO ~SetGlobal("IaSibelDream","GLOBAL",5) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut02")~
    EXIT
END

/* alchemy tower talk */

IF ~Global("IaTreePlot","GLOBAL",2)~ THEN BEGIN PoisonedTree
  SAY @3716 /* Look, <CHARNAME>! This machinery has divined what ails the great Elm tree. It claims there are traces of poison hidden inside. */
  = @3717 /* We need to find out what sort of poison is to blame. */
  ++ @3718 /* Indeed. Perhaps, the strange machine possesses further clues on the matter. */ + Clues
END

IF ~~ THEN BEGIN Clues
  SAY @3719 /* You are correct. I can see a small reservoir attached at the bottom. A dim glow from the aperture projects small shapes just above it. */
  ++ @3720 /* Do they look like anything specific? */ + Letters
END

IF ~~ THEN BEGIN Letters
  SAY @3721 /* The shapes appear to be letters, B and C. Whatever could they mean? */
  ++ @3722 /* Perhaps, the machine could produce an antidote, if the ingredients are put inside? */ + Onwards
END

IF ~~ THEN BEGIN Onwards
  SAY @3723 /* An excellent suggestion. This is an alchemical apparatus, after all. Let us see if the merchants at the square sell anything useful. */
  IF ~~ THEN DO ~SetGlobal("IaTreePlot","GLOBAL",3)~ UNSOLVED_JOURNAL @1104 EXIT
END
