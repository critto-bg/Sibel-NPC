BEGIN ~S!SELOW~

IF ~NumTimesTalkedTo(0) AreaCheck("AR0334")~ THEN BEGIN FirstMeetingSoA
  SAY ~Greetings, adventurer! My name is Elowen. I am pleased to make your acquaintance, for I have just recently arrived to the City of Coins.~
  = ~Dear Master Cromwell was kind in his hospitality, allowing me to guest in his quarters and share the foundry equipment.~

  ++ ~Are you a blacksmith?~ + Artificer
  ++ ~Can you forge gear for us?~ + Specialty
END

IF ~NumTimesTalkedTo(0) AreaCheck("AR5003") Global("IaElowenCromwell","GLOBAL",0)~ THEN BEGIN FirstMeetingSaradush
  SAY ~Greetings, adventurer! My name is Elowen. I am pleased to make your acquaintance, for I have just recently arrived to Saradush.~
  = ~The tavern owner was kind in his hospitality, allowing me to guest in his quarters.~

  ++ ~Are you a blacksmith?~ + Artificer
  ++ ~Can you forge gear for us?~ + Specialty
END

IF ~NumTimesTalkedTo(0)
    AreaCheck("AR5501")
    Global("IaElowenCromwell","GLOBAL",0)
    Global("IaElowenSaradush","GLOBAL",0)~
THEN BEGIN FirstMeetingAmkethran
  SAY ~Greetings, adventurer! My name is Elowen. I am pleased to make your acquaintance, for I have just recently arrived to Amkethran.~
  = ~The tavern owner was kind in his hospitality, allowing me to guest in his quarters.~

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

IF ~NumTimesTalkedTo(0) AreaCheck("AR5003") Global("IaElowenCromwell","GLOBAL",1)~ THEN BEGIN MeetAgainSaradush
  SAY ~Greetings, <CHARNAME>! You seem to go where the trouble is. Or is it the other way around, I wonder?~
  = ~No matter. I am on commission with the city goverment, but I am happy to lend you my services, yet again.~

  ++ ~It is a pleasure seeing you again. Do we have any items you can upgrade?~ + ItemList
  ++ ~I am glad to meet you, lady Elowen. We'll come back when we've a need of your skill.~ + Leave
END

IF ~NumTimesTalkedTo(0)
    AreaCheck("AR5501")
    OR(2)
      Global("IaElowenCromwell","GLOBAL",1)
      Global("IaElowenSaradush","GLOBAL",1)~
THEN BEGIN MeetAgainAmkethran
  SAY ~Greetings once again, <CHARNAME>! Our paths are destined to intertwine, it may seem. Do you still have need of my services?~

  ++ ~Do we have any items you can upgrade, lady Elowen?~ + ItemList
  ++ ~I am glad to meet you, lady Elowen. We'll come back when we've a need of your skill.~ + Leave
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

  // ultimate plate armor
  IF ~PartyHasItem("S!splat1")~ THEN
    REPLY ~Could you strengthen Reinforced Full Plate even further?~
    GOTO Ultimate

  // amber horn
  IF ~PartyHasItem("S!misc10")~ THEN
    REPLY ~Could you improve Adamantite Horn of Valhalla?~
    GOTO Horn

  // balduran
  IF ~PartyHasItem("helm07")~ THEN
    REPLY ~What can you do with Balduran Helm?~
    GOTO Balduran

  // damascus
  IF ~OR(6) PartyHasItem("s!sw07") PartyHasItem("s!sw08") PartyHasItem("s!sw09") PartyHasItem("s!sw10") PartyHasItem("s!sw11") PartyHasItem("s!sw12")~ THEN
    REPLY ~What can you do with Warlord's Blade?~
    GOTO Damascus

  // reinforced staff
  IF ~Global("Iastaf07forged","GLOBAL",1) PartyHasItem("S!staf07")~ THEN
    REPLY ~Could you improve Adamantite Staff of Strength further?~
    GOTO StrStaff

  // rimed club
  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("S!blun02")~ THEN
    REPLY ~Could Rimed Club be made more powerful?~
    GOTO Rimed

  // reinforced amber stone
  IF ~PartyHasItem("S!sioun1")~ THEN
    REPLY ~Surely, you could do something to this ioun stone made of amber?~
    GOTO Ioun

  // blade of roses
  IF ~PartyHasItem("sw1h40")~ THEN
    REPLY ~Is there a way to improve Blade of Roses?~
    GOTO Roses

  // girdle of majestic might
  IF ~PartyHasItem("S!belt01")~ THEN
    REPLY ~Can you add more enchantments to Girdle of Lordly Might?~
    GOTO Majestic

  // phosphorus
  IF ~PartyHasItem("S!blun03")~ THEN
    REPLY ~Is it possible to improve Phosphorus flail further?~
    GOTO Phosphorus

  // fruitful attempt
  IF ~PartyHasItem("S!ssama2")~ THEN
    REPLY ~Is there a way to extract powers from this strange fruit?~
    GOTO Fruitful

  // reinforced horn
  IF ~PartyHasItem("S!shorn")~ THEN
    REPLY ~Could you improve Amber Horn of Valhalla even further?~
    GOTO Horn2

  // limak brain
  IF ~PartyHasItem("S!misc20")~ THEN
    REPLY ~Could you do something with Limak's brain?~
    GOTO Limak

  // gauntlets of the gracelord
  IF ~PartyHasItem("brac06")~ THEN
    REPLY ~What could be done with these potent gauntlets of Ogre Power?~
    GOTO Grandlord

  // flask of greater wish
  IF ~PartyHasItem("S!smisc4")~ THEN
    REPLY ~What do you make of this mysterious flask?~
    GOTO Flask

  // ultimate horn
  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("S!shorn2")~ THEN
    REPLY ~Could you improve Reinforced Horn of Valhalla even further?~
    GOTO Horn3

  // reinforced indigo stone
  IF ~PartyHasItem("S!helm01")~ THEN
    REPLY ~Is there a way to improve this indigo ioun stone?~
    GOTO Ioun2

  // spear of withering
  IF ~PartyHasItem("sper10")~ THEN
    REPLY ~What can be done about this dangerous spear?~
    GOTO Shrivel

  // greater dracolich body
  IF ~PartyHasItem("S!smisc6")~ THEN
    REPLY ~Do you have interest in these remains of a Greater Dracolich?~
    GOTO Draco

  // missionnaire
  IF ~PartyHasItem("SHLD31")~ THEN
    REPLY ~Can you make Darksteel Shield better?~
    GOTO Darksteel

  // axe of gleaming lava
  IF ~PartyHasItem("S!axe01")~ THEN
    REPLY ~Can you improve the Volcano axe further?~
    GOTO Gleaming

  // riskbreaker lord boots
  IF ~PartyHasItem("S!sboo02")~ THEN
    REPLY ~What can you do for these potent Riskbreaker boots?~
    GOTO Bootlord

  // riskbreaker hammer axe
  IF ~PartyHasItem("AX1H12")~ THEN
    REPLY ~Is there a way to improve Stonefire axe?~
    GOTO Axelord

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
        CreateVisualEffectObject("spcrtwpn","S!selow")~
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
        CreateVisualEffectObject("spcrtwpn","S!selow")~
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
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN FullPlate
  SAY ~I can merge your Full Plate +2 with Improved Ankheg Plate Mail. Bring me the both plates, a single Reinforced Chunk of Amber, a single Oil of Resurgence and a Permanency scroll. The cost is 125000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("plat19") PartyHasItem("S!plat03") PartyHasItem("S!sramb") PartyHasItem("POTN37") PartyHasItem("S!misc02") PartyGoldGT(124999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(125000) DestroyGold(125000)
        TakePartyItemNum("plat19",1) DestroyItem("plat19")
        TakePartyItemNum("S!plat03",1) DestroyItem("S!plat03")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        TakePartyItemNum("POTN37",1) DestroyItem("POTN37")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!splat1",Player1,0,0,0)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Ultimate
  SAY ~Aye, I can merge it with Great Wyrm Armor. Give me the both plates and a single Reinforced Chunk of Amber. The price will be 50000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~Global("Iaplat06forged","GLOBAL",1) PartyHasItem("S!splat1") PartyHasItem("S!plat06") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!splat1",1) DestroyItem("S!splat1")
        TakePartyItemNum("S!plat06",1) DestroyItem("S!plat06")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!splat2",Player1,0,0,0)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Horn
  SAY ~Yes, the horn's magic may be improved upon with a single Reinforced Chunk of Amber. The process will cost 50000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!misc10") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!misc10",1) DestroyItem("S!misc10")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shorn",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Balduran
  SAY ~I can combine it with Helmet of Defense. I will need a single Reinforced Chunk of Amber as well. The price for the job is 40000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!helm02")~ THEN REPLY ~Would you accept Improved Dragon Helm instead?~ GOTO Balduran2

  IF ~PartyHasItem("helm07") PartyHasItem("helm04") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("helm07",1) DestroyItem("helm07")
        TakePartyItemNum("helm04",1) DestroyItem("helm04")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shelm1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Balduran2
  SAY ~Yes, it would work as well. Shall I begin?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("helm07") PartyHasItem("S!helm02") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("helm07",1) DestroyItem("helm07")
        TakePartyItemNum("S!helm02",1) DestroyItem("S!helm02")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shelm1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Damascus
  SAY ~I can improve it, but the charm and confusion immunities on the sword would need to be sacrificed. The essence of Lilarcor won't let me work on it. Do you want to proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList
  ++ ~Very well.~ + Damascus2
END

IF ~~ THEN BEGIN Damascus2
  SAY ~Bring me a scimitar called Belm, a chunk of Reinforced Amber and a copy of Manual of Elaboration. And 75000 gold. Then I will begin.~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~OR(6) PartyHasItem("s!sw07") PartyHasItem("s!sw08") PartyHasItem("s!sw09") PartyHasItem("s!sw10") PartyHasItem("s!sw11") PartyHasItem("s!sw12")
      PartyHasItem("SW1H30") PartyHasItem("S!misc06") PartyHasItem("S!sramb") PartyGoldGT(74999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(75000) DestroyGold(75000)
        TakePartyItemNum("S!sw07",1) DestroyItem("S!sw07")
        TakePartyItemNum("S!sw08",1) DestroyItem("S!sw08")
        TakePartyItemNum("S!sw09",1) DestroyItem("S!sw09")
        TakePartyItemNum("S!sw10",1) DestroyItem("S!sw10")
        TakePartyItemNum("S!sw11",1) DestroyItem("S!sw11")
        TakePartyItemNum("S!sw12",1) DestroyItem("S!sw12")
        TakePartyItemNum("SW1H30",1) DestroyItem("SW1H30")
        TakePartyItemNum("S!misc06",1) DestroyItem("S!misc06")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!ssw01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN StrStaff
  SAY ~Improving a staff made by Hephaestus is no easy task. I need to melt Sentinel +4 Shield and use its special metal to reforge the staff. I need a chunk of Reinforced Amber as well. It will cost you no less than 90000 gp. What do you say?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~Global("Iastaf07forged","GLOBAL",1) PartyHasItem("S!staf07") PartyHasItem("SHLD22") PartyHasItem("S!sramb") PartyGoldGT(89999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(90000) DestroyGold(90000)
        TakePartyItemNum("S!staf07",1) DestroyItem("S!staf07")
        TakePartyItemNum("SHLD22",1) DestroyItem("SHLD22")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sstaf1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Rimed
  SAY ~Yes, I can meld its powers with those of Ice Star +4. I will need a chunk of Reinforced Amber to do the job. The price is 50000 gp. Shall I begin?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("S!blun02") PartyHasItem("BLUN35") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!blun02",1) DestroyItem("S!blun02")
        TakePartyItemNum("BLUN35",1) DestroyItem("BLUN35")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sblu03",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Ioun
  SAY ~Yes, the ioun stone has the potential to become stronger. I will need a chunk of Reinforced Amber and an Amber Shell to do the job. It will cost you 30000 gp. Shall I begin?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!sioun1") PartyHasItem("S!smisc2") PartyHasItem("S!sramb") PartyGoldGT(29999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(30000) DestroyGold(30000)
        TakePartyItemNum("S!sioun1",1) DestroyItem("S!sioun1")
        TakePartyItemNum("S!smisc2",1) DestroyItem("S!smisc2")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sioun2",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Roses
  SAY ~I can imbue the blade with additional enchantments. I will need Kundane sword, a chunk of Reinforced Amber, a Ring of Protection +2 and a Forty Eight sided Garnet to do the job. It will cost you 50000 gp. Shall I begin?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("sw1h40") PartyHasItem("sw1h25") PartyHasItem("ring07") PartyHasItem("S!misc21") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("sw1h40",1) DestroyItem("sw1h40")
        TakePartyItemNum("sw1h25",1) DestroyItem("sw1h25")
        TakePartyItemNum("ring07",1) DestroyItem("ring07")
        TakePartyItemNum("S!misc21",1) DestroyItem("S!misc21")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!ssw02",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Majestic
  SAY ~Aye, there's enough capacity left for more. Bring me Belt of Inertial Barrier, a chunk of Reinforced Amber and a Ring of Protection +2. The price is 50000 gold. Shall I begin?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("s!belt01") PartyHasItem("belt10") PartyHasItem("ring07") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!belt01",1) DestroyItem("S!belt01")
        TakePartyItemNum("belt10",1) DestroyItem("belt10")
        TakePartyItemNum("ring07",1) DestroyItem("ring07")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sbel01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Phosphorus
  SAY ~There's a recipe I could try. I will need Defender of Easthaven, a chunk of Reinforced Amber and a Ring of Protection +3. I will also require a unique Amber Star Gem. The price of my work is 40000 gold. Shall I begin?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("s!blun03") PartyHasItem("waflail") PartyHasItem("ring41") PartyHasItem("S!smisc3") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("S!blun03",1) DestroyItem("S!blun03")
        TakePartyItemNum("waflail",1) DestroyItem("waflail")
        TakePartyItemNum("ring41",1) DestroyItem("ring41")
        TakePartyItemNum("S!smisc3",1) DestroyItem("S!smisc3")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sblu04",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Fruitful
  SAY ~Is it the Samara fruit? A rare sight. I can use it to imbue a simple Ring of Protection +2 with additional powers. Bring me Shield of Harmony +2 and a chunk of Reinforced Amber. This will cost you 30000 gold. Shall I begin?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("s!ssama2") PartyHasItem("SHLD25") PartyHasItem("RING07") PartyHasItem("S!sramb") PartyGoldGT(29999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(30000) DestroyGold(30000)
        TakePartyItemNum("S!ssama2",1) DestroyItem("S!ssama2")
        TakePartyItemNum("SHLD25",1) DestroyItem("SHLD25")
        TakePartyItemNum("RING07",1) DestroyItem("RING07")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!srin01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Horn2
  SAY ~The horn may still grow stronger if I continue apply Reinforced Chunk of Amber to the process. Bring me a single Chunk, Moon Dog Figurine and Golden Lion Figurine. The process will cost 50000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!shorn") PartyHasItem("MISC7T") PartyHasItem("MISC3D") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!shorn",1) DestroyItem("S!shorn")
        TakePartyItemNum("MISC7T",1) DestroyItem("MISC7T")
        TakePartyItemNum("MISC3D",1) DestroyItem("MISC3D")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shorn2",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Limak
  SAY ~I have heard tales about this man. He lives no more, then? I can't produce anything for you, for I lack the necessary experience. I would offer gold to purchase the artefact from you. Say, 75000. Would it suffice?~

  ++ ~I will think on it. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!misc20")~
  THEN
    REPLY ~Yes, I will be glad to get rid of it.~
    DO ~TakePartyItemNum("S!misc20",1) DestroyItem("S!misc20")
        GiveGoldForce(75000)~
    EXIT
END

IF ~~ THEN BEGIN Grandlord
  SAY ~These are a powerful vessel, capable of storing multiple enchantments. Bring me Gauntlets of Weapon Expertise, Gauntlets of Dexterity, Gloves of Healing and a chunk of Reinforced Amber. The price is 30000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("brac10") PartyHasItem("brac06") PartyHasItem("brac07") PartyHasItem("brac20") PartyHasItem("S!sramb") PartyGoldGT(29999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(30000) DestroyGold(30000)
        TakePartyItemNum("brac10",1) DestroyItem("brac10")
        TakePartyItemNum("brac06",1) DestroyItem("brac06")
        TakePartyItemNum("brac07",1) DestroyItem("brac07")
        TakePartyItemNum("brac20",1) DestroyItem("brac20")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sbrac1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Flask
  SAY ~I may know a way to bind a powerful magic spell to this artefact. But the final result may be upredictable. Bring me a scroll of Wish, a chunk of Reinforced Amber and a Manual of Elaboration. The price is 50000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!smisc4") PartyHasItem("SCRLB4") PartyHasItem("S!misc06") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!smisc4",1) DestroyItem("S!smisc4")
        TakePartyItemNum("SCRLB4",1) DestroyItem("SCRLB4")
        TakePartyItemNum("S!misc06",1) DestroyItem("S!misc06")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!smisc5",Player1,3,0,0)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Horn3
  SAY ~There is still more that we can accomplish with the horn. Bring me a single Chunk of Reinforced Amber and Shakti Figurine. The process will cost 50000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!shorn2") PartyHasItem("FIGURE01") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!shorn2",1) DestroyItem("S!shorn2")
        TakePartyItemNum("FIGURE01",1) DestroyItem("FIGURE01")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shorn3",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Ioun2
  SAY ~I can imbue it with the power of two more lesser stones. Bring me Obsidian Ioun Stone, Lavender Ioun Stone and a single Chunk of Reinforced Amber. The price is 40000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!helm01") PartyHasItem("helm24") PartyHasItem("helm26") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("S!helm01",1) DestroyItem("S!helm01")
        TakePartyItemNum("helm24",1) DestroyItem("helm24")
        TakePartyItemNum("helm26",1) DestroyItem("helm26")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sioun3",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Shrivel
  SAY ~That is a vile thing indeed. It has potential for stronger enchantment, but I would need something incredibly powerful to match. Is there an artefact you may offer?~

  ++ ~I will think on it. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!smisc6")~
  THEN
    REPLY ~Yes, I have this powdered body of a Greater Dracolich.~
    GOTO Shrivel2
END

IF ~~ THEN BEGIN Shrivel2
  SAY ~You carry the remains of a dracolich? You tease me not? In that case, I can improve your spear.~
  = ~Bring me the artefact called Sekolah's Tooth to complete the recipe. The job will cost sixty thousand gold. Are you willing to proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("SPER10") PartyHasItem("KEY26") PartyHasItem("S!smisc6") PartyGoldGT(59999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("SPER10",1) DestroyItem("SPER10")
        TakePartyItemNum("KEY26",1) DestroyItem("KEY26")
        TakePartyItemNum("S!smisc6",1) DestroyItem("S!smisc6")
        GiveItemCreate("S!sspe01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Draco
  SAY ~Men have claimed the creature to be but a myth. If someone else were to offer me this treasure, I'd call him a charlatan.~
  = ~Yet you tend to find the most exotic artefacts. I am willing to buy such a rare specimen for 150 thousand gold. Does it suit you?~

  ++ ~I will think on it. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!smisc6")~
  THEN
    REPLY ~Yes, I have no purpose for it.~
    DO ~TakePartyItemNum("S!smisc6",1) DestroyItem("S!smisc6")
        GiveGoldForce(150000)~
    EXIT
END

IF ~~ THEN BEGIN Darksteel
  SAY ~Ah, this shield reminds me of an amusing story. I may improve it if you bring me another shield, Saving Grace +3, a potion of Magic Shielding, a potion of Barbarian Essence and a Permanency scroll. The price is 40000 gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("shld31") PartyHasItem("shld27") PartyHasItem("potn35") PartyHasItem("potn33") PartyHasItem("S!misc02") PartyGoldGT(39999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("shld31",1) DestroyItem("shld31")
        TakePartyItemNum("shld27",1) DestroyItem("shld27")
        TakePartyItemNum("potn35",1) DestroyItem("potn35")
        TakePartyItemNum("potn33",1) DestroyItem("potn33")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!sshld1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Gleaming
  SAY ~Yes, I have a simple, but efficient improvement to offer. Bring me a Ring of Protection +2 and a chunk of Reinforced Amber. I will ask 60 thousand gold for the job. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!axe01") PartyHasItem("ring07") PartyHasItem("S!sramb") PartyGoldGT(59999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("S!axe01",1) DestroyItem("S!axe01")
        TakePartyItemNum("ring07",1) DestroyItem("ring07")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!saxe01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Bootlord
  SAY ~A legend follows this pair of footwear. I may just help you fulfill it. Bring me a Cloak of Protection +2, an Oil of Speed, Oil of Resurgence, a potion of Magic Shielding and a Permanency scroll. The job's price is 30 thousand gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("S!sboo02") PartyHasItem("CLCK02") PartyHasItem("POTN14") PartyHasItem("POTN37") PartyHasItem("POTN35") PartyHasItem("S!misc02") PartyGoldGT(29999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(30000) DestroyGold(30000)
        TakePartyItemNum("S!sboo02",1) DestroyItem("S!sboo02")
        TakePartyItemNum("CLCK02",1) DestroyItem("CLCK02")
        TakePartyItemNum("POTN14",1) DestroyItem("POTN14")
        TakePartyItemNum("POTN37",1) DestroyItem("POTN37")
        TakePartyItemNum("POTN35",1) DestroyItem("POTN35")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!sboo03",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Axelord
  SAY ~There's an old dwarven recipe that may fuse this axe with a war hammer. Bring me an unenchanted War Hammer +3, a dwarven Rune of Clangeddin and a chunk of Reinforced Amber. The price is 50 thousand gold. Shall I proceed?~

  ++ ~Maybe later. Could you work on something else?~ + ItemList

  IF ~PartyHasItem("AX1H12") PartyHasItem("HAMM12") PartyHasItem("COMPON09") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY ~Yes please, go ahead.~
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("AX1H12",1) DestroyItem("AX1H12")
        TakePartyItemNum("HAMM12",1) DestroyItem("HAMM12")
        TakePartyItemNum("COMPON09",1) DestroyItem("COMPON09")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!saxe02",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END