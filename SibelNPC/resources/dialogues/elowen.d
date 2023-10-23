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

  ++ ~Goodbye, lady Elowen.~ + Leave
END

IF ~~ THEN BEGIN Chunk
  SAY ~This one is simple. Give me two chunks of amber and I will merge them into a single chunk of reinforced amber. It will cost you only 5000 gold. Are you interested?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~NumItemsPartyGT("S!misc27",1) PartyGoldGT(4999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(5000) DestroyGold(5000)
        TakePartyItemNum("S!misc27",1) DestroyItem("S!misc27")
        TakePartyItemNum("S!misc27",1) DestroyItem("S!misc27")
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
