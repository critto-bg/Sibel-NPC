BEGIN ~S!SibelP~

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
      !AmIInWatchersKeepPleaseIgnoreTheLackOfApostophe()~
    THEN REPLY ~Yes, we'll come back for you later.~ GOTO SibelStaysPut

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