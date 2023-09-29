BEGIN ~S!SibelJ~

IF ~Global("IaSibelDream","GLOBAL",2)~ THEN BEGIN SibelDream
  SAY "I saw my father in a dream. He said I should seek a monument near an ancient prison. The monument is actually a time travel portal which can take us to Arcanis village when the problems had just begun."
  + ~Global("IaSibelInWK","GLOBAL",0)~ + ~Do you have any clue where this monument may be?~ + SeekMonument
  + ~Global("IaSibelInWK","GLOBAL",1)~ + ~The ancient prison your father spoke of might refer to Watcher's Keep.~ + BeenInWK
END

IF ~~ THEN BEGIN SeekMonument
  SAY "No, I am afraid I have never seen it before. But I will recognize its features if we chance upon it."
  ++ "Very well, let us begin our search then." DO ~SetGlobal("IaSibelDream","GLOBAL",3)~ UNSOLVED_JOURNAL @1100 EXIT
END

IF ~~ THEN BEGIN BeenInWK
  SAY "Yes, you may be right, <CHARNAME>. I will recognize its features if I see it once more."
  ++ "Let us depart for Watcher's Keep then." DO ~SetGlobal("IaSibelDream","GLOBAL",3)~ UNSOLVED_JOURNAL @1101 EXIT
END

IF ~Global("IaSibelDream","GLOBAL",4)~ THEN BEGIN FoundMonument
  SAY "Here we are! Look, that is the monument Father told me about. Will you come with me through the portal to travel in time and space to my family's village?"
  ++ ~Yes, I am ready to embark on this journey. It is time to discover what troubles have befallen your people.~ + TravelTogether
  ++ ~Regretfully, I must decline. What if we fail to return to Athkatla? That is a risk I am not willing to take, Sibel.~ + SibelLeavesAlone
END

IF ~~ THEN BEGIN TravelTogether
  SAY "Wonderful! Come, we need to approach the portal stone for the teleportation spell to work."
  IF ~~ THEN
    DO ~SetGlobal("IaSibelDream","GLOBAL",5) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut01")~
    EXIT
END

IF ~~ THEN BEGIN SibelLeavesAlone
  SAY "I understand your hesitation. I will depart on my own, then, for I must discover a way to undo the curse. I hope we may meet again, <CHARNAME>."
  IF ~~ THEN
    DO ~SetGlobal("IaSibelDream","GLOBAL",5) ClearAllActions() StartCutSceneMode() StartCutScene("S!scut02")~
    EXIT
END

IF ~Global("IaTreePlot","GLOBAL",2)~ THEN BEGIN PoisonedTree
  SAY "Look, <CHARNAME>! This machinery has divined what ails the great Elm tree. It claims there are traces of poison hidden inside."
  = ~We need to find out what sort of poison is to blame.~
  ++ ~Indeed. Perhaps, the strange machine possesses further clues on the matter.~ + Clues
END

IF ~~ THEN BEGIN Clues
  SAY ~You are correct. I can see a small reservoir attached at the bottom. A dim glow from the aperture projects small shapes just above it.~
  ++ ~Do they look like anything specific?~ + Letters
END

IF ~~ THEN BEGIN Letters
  SAY ~The shapes appear to be letters, B and C. Whatever could they mean?~
  ++ ~Perhaps, the machine could produce an antidote, if the ingredients are put inside?~ + Onwards
END

IF ~~ THEN BEGIN Onwards
  SAY ~An excellent suggestion. This is an alchemical apparatus, after all. Let us see if the merchants at the square sell anything useful.~
  IF ~~ THEN DO ~SetGlobal("IaTreePlot","GLOBAL",3)~ UNSOLVED_JOURNAL @1104 EXIT
END
