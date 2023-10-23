BEGIN ~S!SELOW~

IF ~NumTimesTalkedTo(0) AreaCheck("AR0334")~ THEN BEGIN FirstMeetingSoA
  SAY ~Greetings, adventurer! My name is Elowen. I am pleased to make your acquaintance, for I have just recently arrived to the City of Coins.~
  = ~Dear Master Cromwell was kind in his hospitality, allowing me to guest in his quarters and share the foundry equipment.~

  ++ ~Are you a blacksmith?~ + Artificer
  ++ ~Can you forge gear for us?~ + Specialty
END

IF ~~ THEN BEGIN Artificer
  SAY ~I am an artificer or an artisan. Whichever one you prefer, you may call me.~

  ++ ~Can you forge gear for us?~ + Specialty
END

IF ~~ THEN BEGIN Specialty
  SAY ~Indeed I may. The focus of my work is the material called amber. Come and talk to me if you have need of my services.~

  ++ ~Do we have any items you can upgrade?~ + ItemList
  ++ ~Goodbye, lady Elowen.~ + Leave
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN MainMenu
  SAY ~Greetings. Do you have need of my services?~

  ++ ~Do we have any items you can upgrade?~ + ItemList
  ++ ~Goodbye, lady Elowen.~ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY ~Goodbye.~

  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ItemList
  SAY ~I have neither the time nor the patience to sift through your gear. Tell me what you want and I will see what can be done.~

  // reinforced amber
  IF ~PartyHasItem("S!misc27")~ THEN
    REPLY ~Is there anything you can do with this chunk of amber?~
    GOTO Chunk

  // glimmering amber amulet
  IF ~PartyHasItem("S!samul") Class("S!Sibel",CLERIC_ALL)~ THEN
    REPLY ~Could you improve this amber amulet?~
    GOTO AmberAmulet

  // barbarian's dream
  IF ~PartyHasItem("S!chan01")~ THEN
    REPLY ~Could you improve this powerful chain mail further?~
    GOTO BarbDream

  // Reinforced Full Plate +5
  IF ~PartyHasItem("plat19")~ THEN
    REPLY ~Could you improve this Full Plate?~
    GOTO FullPlate

  ++ ~Goodbye, lady Elowen.~ + Leave
END

IF ~~ THEN BEGIN Chunk
  SAY ~This one is simple. Give me two chunks of amber and I will merge them into a single chunk of reinforced amber. It will cost you only 5000 gold. Are you interested?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~NumItemsPartyGT("S!misc27",1) PartyGoldGT(4999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(5000) DestroyGold(5000)
        TakePartyItemNum("S!misc27",2) DestroyItem("S!misc27")
                                       DestroyItem("S!misc27")
        GiveItemCreate("S!sramb",Player1,0,0,0)
        CreateVisualEffect("spcrtwpn",[655.220])~
    EXIT
END

IF ~~ THEN BEGIN AmberAmulet
  SAY ~I could if you bring me the Glimmering Essence of Amber, a Ring of Regeneration, a Scroll of Memory Boosting and a Manual of Elaboration. The job will cost 75000 gold. Agreed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!samul") PartyHasItem("S!sesse") PartyHasItem("RING31") PartyHasItem("S!misc01") PartyHasItem("S!misc06") PartyGoldGT(74999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(75000) DestroyGold(75000)
        TakePartyItemNum("S!samul",1) DestroyItem("S!samul")
        TakePartyItemNum("S!sesse",1) DestroyItem("S!sesse")
        TakePartyItemNum("RING31",1) DestroyItem("RING31")
        TakePartyItemNum("S!misc01",1) DestroyItem("S!misc01")
        TakePartyItemNum("S!misc06",1) DestroyItem("S!misc06")
        GiveItemCreate("S!sgamul",Player1,0,0,0)
        CreateVisualEffect("spcrtwpn",[655.220])~
    EXIT
END

IF ~~ THEN BEGIN BarbDream
  SAY ~I can improve your Supreme Chain Mail with amber. Bring me a single Reinforced Chunk, a bottle of Barbarian Essence and a Permanency scroll. The job will cost 60000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!chan01") PartyHasItem("S!sramb") PartyHasItem("POTN33") PartyHasItem("S!misc02") PartyGoldGT(59999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("S!chan01",1) DestroyItem("S!chan01")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        TakePartyItemNum("POTN33",1) DestroyItem("POTN33")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!schan1",Player1,0,0,0)
        CreateVisualEffect("spcrtwpn",[655.220])~
    EXIT
END

IF ~~ THEN BEGIN FullPlate
  SAY ~I can merge your Full Plate +2 with Improved Ankheg Plate Mail. Bring me the both plates, a single Reinforced Chunk of Amber, a single Oil of Resurgence and a Permanency scroll. The cost is 125000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("plat19") PartyHasItem("S!plat03") PartyHasItem("POTN37") PartyHasItem("S!misc02") PartyGoldGT(124999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(125000) DestroyGold(125000)
        TakePartyItemNum("plat19",1) DestroyItem("plat19")
        TakePartyItemNum("S!plat03",1) DestroyItem("S!plat03")
        TakePartyItemNum("POTN37",1) DestroyItem("POTN37")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!splat1",Player1,0,0,0)
        CreateVisualEffect("spcrtwpn",[655.220])~
    EXIT
END
