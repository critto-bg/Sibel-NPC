BEGIN ~S!SibelP~

/* leaves due to unhappiness */

IF ~HappinessLT(Myself,-290)~ THEN BEGIN Unhappy
  SAY ~Never before have I met a <MANWOMAN> as corrupted by evil as you are, <CHARNAME>. I shall not remain in your company any longer.~

  IF ~~ THEN
    DO ~TakeItemListParty("S!sitems")
        EraseJournalEntry(@1100)
        EraseJournalEntry(@1101)
        EraseJournalEntry(@1103)
        EraseJournalEntry(@1104)
        EraseJournalEntry(@1107)
        EraseJournalEntry(@1109)
        EraseJournalEntry(@1110)
        EraseJournalEntry(@1111)
        EraseJournalEntry(@1114)
        EraseJournalEntry(@1117)
        SetGlobal("IaSibelTalks","GLOBAL",99)~
    EXIT
END

/* entry states */

IF ~Global("IaSibelJoined","LOCALS",1)
    !AreaCheck("ARIA28")
    !AreaCheck("ARIA29")
    !AreaCheck("ARIA30")
    !AreaCheck("ARIA31")
    !AreaCheck("ARIA32")
    !AreaCheck("ARIA33")
    !AreaCheck("ARIA34")
    !AreaCheck("ARIA35")
    !AreaCheck("ARIA36")~
THEN BEGIN KickOut
  SAY ~Do you want me to leave the group, <CHARNAME>?~
  IF ~~ THEN REPLY ~No, Sibel, you should remain with us.~ DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY ~Yes, we should go our separate ways for now.~ DO ~SetGlobal("IaSibelJoined","LOCALS",0)~ GOTO WhereToGo
END

IF ~Global("IaSibelJoined","LOCALS",1)
    OR(9)
      AreaCheck("ARIA28")
      AreaCheck("ARIA29")
      AreaCheck("ARIA30")
      AreaCheck("ARIA31")
      AreaCheck("ARIA32")
      AreaCheck("ARIA33")
      AreaCheck("ARIA34")
      AreaCheck("ARIA35")
      AreaCheck("ARIA36")~
THEN BEGIN KickOutArcanisVillage
  SAY ~Are you sure, <CHARNAME>? If you abandon me now, we will lose each other in time and space.~

  IF ~~ THEN
    REPLY ~No, Sibel, we should continue our travels together.~
    DO ~JoinParty()~
    EXIT

  ++ ~Yes, we should go our separate ways.~ + LeaveArcanisVillage

END

IF ~Global("IaSibelJoined","LOCALS",0)~ THEN BEGIN ReJoin
  SAY ~It is good to see you, <CHARNAME>! Do you want to me to travel with you again?~

  IF ~~ THEN
    REPLY ~Yes, Sibel, let us join forces together.~
    DO ~SetGlobal("IaSibelJoined","LOCALS",1) JoinParty()~
    GOTO SayWelcome

  IF ~~ THEN REPLY ~No, we should go our separate ways for now.~ GOTO SayGoodbye
END

/* kicked out inside the village */

IF ~~ THEN LeaveArcanisVillage
  SAY ~So be it. I wish you luck in your quest, <CHARNAME>.~

  IF ~~ THEN
  DO ~SetGlobal("IaSibelJoined","LOCALS",0)
      ClearAllActions()
      StartCutSceneMode()
      StartCutScene("S!scut04")~
  EXIT
END

/* kicked out outside the village */

IF ~~ THEN BEGIN WhereToGo
  SAY "Very well. Do you want me to wait for you here?"

  IF ~!AreaCheck("AR0301")  // Mae'Var's Hide Out
      !AreaCheck("AR0302")  // Mae'Var's Inn 1st Floor -- Entrance
      !AreaCheck("AR0303")  // Mae'Var's Inn 2nd Floor -- Training Area
      !AreaCheck("AR0304")  // Mae'Var's Inn 3rd Floor -- Edwin
      !AreaCheck("AR0305")  // Shadow Thieves Guild Entrance
      !AreaCheck("AR0306")  // Renal Bloodscalp's Hideout
      !AreaCheck("AR0307")  // Aran Linvail's Hideout
      !AreaCheck("AR0410")  // Sphere: Navigator's room -- Lavok's Hideout
      !AreaCheck("AR0411")  // Sphere: Entrance floor
      !AreaCheck("AR0412")  // Sphere: Ice and Fire Room
      !AreaCheck("AR0413")  // Sphere: Enginge Room
      !AreaCheck("AR0414")  // Sphere: Demon Plane
      !AreaCheck("AR0509")  // Five Flagons Inn 1st Floor
      !AreaCheck("AR0510")  // Five Flagons Inn Theater
      !AreaCheck("AR0511")  // Five Flagons Inn 2nd Floor
      !AreaCheck("AR0604")  // Circus Tent 1st Floor
      !AreaCheck("AR0605")  // Circus Tent 2nd Floor
      !AreaCheck("AR0606")  // Circus Tent 3rd Floor
      !AreaCheck("AR0801")  // Bodhi's Hideout (sided with Aran)
      !AreaCheck("AR0803")  // Bodhi's Lair (sided with Aran)
      !AreaCheck("AR1102")  // Merella's Cabin
      !AreaCheck("AR1107")  // Ranger-Protector's Cabin (Stronghold)
      !AreaCheck("AR1300")  // De'Arnise Keep Destroyed
      !AreaCheck("AR1301")  // De'Arnise Cellar
      !AreaCheck("AR1302")  // De'Arnise Keep 1st Floor
      !AreaCheck("AR1303")  // De'Arnise Keep 2nd Floor (Destroyed)

      !AreaCheck("AR4000")  // Forest of Tethir
      !AreaCheck("AR4500")  // Pocket Plane
      !AreaCheck("AR6200")  // Throne of Bhaal

      !AmIInWatchersKeepPleaseIgnoreTheLackOfApostophe()~
    THEN REPLY ~Yes, we'll come back for you later.~ GOTO SibelStaysPut

  IF ~GlobalLT("Chapter","GLOBAL",8) !AreaCheck("AR0702")~ THEN
    REPLY ~No, you should go back to Adventurer's Mart. I will look for you there if I need your help again.~
    GOTO SibelGoesBack

  IF ~GlobalGT("Chapter","GLOBAL",7) AreaCheck("AR4500")~ THEN
    REPLY ~Yes, we'll come back for you later.~
    DO ~MoveToPointNoInterrupt([1510.1370]) Face(0)~
    GOTO SibelStaysPut

  IF ~GlobalGT("Chapter","GLOBAL",7) !AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ THEN
    REPLY ~I'll send you back to the pocket plane... wait there.~
    DO ~CreateVisualEffectObject("SPDIMNDR",Myself) Wait(2) MoveBetweenAreas("AR4500",[1510.1370],0)~
    GOTO SibelGoesToPocketPlane
END

IF ~~ THEN BEGIN SibelStaysPut
  SAY "As you wish, <CHARNAME>, I will stay here for awhile. Goodbye."
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SibelGoesBack
  SAY "As you wish, <CHARNAME>. Goodbye."
  IF ~~ THEN DO ~EscapeAreaMove("AR0702",755,335,3)~ EXIT
END

IF ~~ THEN BEGIN SibelGoesToPocketPlane
  SAY "As you wish, <CHARNAME>."
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SayWelcome
  SAY ~I am glad you have changed your mind, <CHARNAME>. Let us be off.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SayGoodbye
  SAY ~Very well, <CHARNAME>. If you happen to change your mind, I'll be staying here for awhile.~
  IF ~~ THEN EXIT
END