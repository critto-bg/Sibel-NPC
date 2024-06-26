BEGIN ~S!SELOW~

IF ~NumTimesTalkedTo(0) AreaCheck("AR0334")~ THEN BEGIN FirstMeetingSoA
  SAY @2300 /* Greetings, adventurer! My name is Elowen. I am pleased to make your acquaintance, for I have just recently arrived to the City of Coins. */
  = @2301 /* Dear Master Cromwell was kind in his hospitality, allowing me to guest in his quarters and share the foundry equipment. */

  ++ @2302 /* Are you a blacksmith? */ + Artificer
  ++ @2303 /* Can you forge gear for us? */ + Specialty
END

IF ~NumTimesTalkedTo(0) AreaCheck("AR5003") Global("IaElowenCromwell","GLOBAL",0)~ THEN BEGIN FirstMeetingSaradush
  SAY @2304 /* Greetings, adventurer! My name is Elowen. I am pleased to make your acquaintance, for I have just recently arrived to Saradush. */
  = @2305 /* The tavern owner was kind in his hospitality, allowing me to guest in his quarters. */

  ++ @2302 /* Are you a blacksmith? */ + Artificer
  ++ @2303 /* Can you forge gear for us? */ + Specialty
END

IF ~NumTimesTalkedTo(0)
    AreaCheck("AR5501")
    Global("IaElowenCromwell","GLOBAL",0)
    Global("IaElowenSaradush","GLOBAL",0)~
THEN BEGIN FirstMeetingAmkethran
  SAY @2306 /* Greetings, adventurer! My name is Elowen. I am pleased to make your acquaintance, for I have just recently arrived to Amkethran. */
  = @2305 /* The tavern owner was kind in his hospitality, allowing me to guest in his quarters. */

  ++ @2302 /* Are you a blacksmith? */ + Artificer
  ++ @2303 /* Can you forge gear for us? */ + Specialty
END

IF ~~ THEN BEGIN Artificer
  SAY @2307 /* I am an artificer or an artisan. Whichever one you prefer, you may call me. */

  ++ @2303 /* Can you forge gear for us? */ + Specialty
END

IF ~~ THEN BEGIN Specialty
  SAY @2308 /* Indeed I may. The focus of my work is the material called amber. Come and talk to me if you have need of my services. */

  ++ @2309 /* Do we have any items you can upgrade? */ + ItemList
  ++ @2310 /* Goodbye, lady Elowen. */ + Leave
END

IF ~NumTimesTalkedTo(0) AreaCheck("AR5003") Global("IaElowenCromwell","GLOBAL",1)~ THEN BEGIN MeetAgainSaradush
  SAY @2311 /* Greetings, <CHARNAME>! You seem to go where the trouble is. Or is it the other way around, I wonder? */
  = @2312 /* No matter. I am happy to lend you my services, yet again. */

  ++ @2313 /* It is a pleasure seeing you again. Do we have any items you can upgrade? */ + ItemList
  ++ @2314 /* I am glad to meet you, lady Elowen. We'll come back when we've a need of your skill. */ + Leave
END

IF ~NumTimesTalkedTo(0)
    AreaCheck("AR5501")
    OR(2)
      Global("IaElowenCromwell","GLOBAL",1)
      Global("IaElowenSaradush","GLOBAL",1)~
THEN BEGIN MeetAgainAmkethran
  SAY @2315 /* Greetings once again, <CHARNAME>! Our paths are destined to intertwine, it may seem. Do you still have need of my services? */

  ++ @2316 /* Do we have any items you can upgrade, lady Elowen? */ + ItemList
  ++ @2314 /* I am glad to meet you, lady Elowen. We'll come back when we've a need of your skill. */ + Leave
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN MainMenu
  SAY @2317 /* Greetings. Do you have need of my services? */

  ++ @2309 /* Do we have any items you can upgrade? */ + ItemList
  ++ @2310 /* Goodbye, lady Elowen. */ + Leave
END

IF ~~ THEN BEGIN Leave
  SAY @2318 /* Goodbye. */

  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ItemList
  SAY @2319 /* I have neither the time nor the patience to sift through your gear. Tell me what you want and I will see what can be done. */

  // reinforced amber
  IF ~PartyHasItem("S!misc27")~ THEN
    REPLY @2320 /* Is there anything you can do with this chunk of amber? */
    GOTO Chunk

  // glimmering amber amulet
  IF ~PartyHasItem("S!samul") Class("S!Sibel",CLERIC_ALL)~ THEN
    REPLY @2321 /* Could you improve this amber amulet? */
    GOTO AmberAmulet

  // barbarian's dream
  IF ~PartyHasItem("S!chan01")~ THEN
    REPLY @2322 /* Could you improve this powerful chain mail further? */
    GOTO BarbDream

  // Reinforced Full Plate +5
  IF ~PartyHasItem("plat19")~ THEN
    REPLY @2323 /* Could you improve this Full Plate? */
    GOTO FullPlate

  // ultimate plate armor
  IF ~PartyHasItem("S!splat1")~ THEN
    REPLY @2324 /* Could you strengthen Reinforced Full Plate even further? */
    GOTO Ultimate

  // amber horn
  IF ~PartyHasItem("S!misc10")~ THEN
    REPLY @2325 /* Could you improve Adamantite Horn of Valhalla? */
    GOTO Horn

  // balduran
  IF ~PartyHasItem("helm07")~ THEN
    REPLY @2326 /* What can you do with Balduran Helm? */
    GOTO Balduran

  // damascus
  IF ~OR(6) PartyHasItem("s!sw07") PartyHasItem("s!sw08") PartyHasItem("s!sw09") PartyHasItem("s!sw10") PartyHasItem("s!sw11") PartyHasItem("s!sw12")~ THEN
    REPLY @2327 /* What can you do with Warlord's Blade? */
    GOTO Damascus

  // reinforced staff
  IF ~Global("Iastaf07forged","GLOBAL",1) PartyHasItem("S!staf07")~ THEN
    REPLY @2328 /* Could you improve Adamantite Staff of Strength further? */
    GOTO StrStaff

  // rimed club
  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("S!blun02")~ THEN
    REPLY @2329 /* Could Rimed Club be made more powerful? */
    GOTO Rimed

  // reinforced amber stone
  IF ~PartyHasItem("S!sioun1")~ THEN
    REPLY @2330 /* Surely, you could do something to this ioun stone made of amber? */
    GOTO Ioun

  // blade of roses
  IF ~PartyHasItem("sw1h40")~ THEN
    REPLY @2331 /* Is there a way to improve Blade of Roses? */
    GOTO Roses

  // girdle of majestic might
  IF ~PartyHasItem("S!belt01")~ THEN
    REPLY @2332 /* Can you add more enchantments to Girdle of Lordly Might? */
    GOTO Majestic

  // phosphorus
  IF ~PartyHasItem("S!blun03")~ THEN
    REPLY @2333 /* Is it possible to improve Phosphorus flail further? */
    GOTO Phosphorus

  // fruitful attempt
  IF ~PartyHasItem("S!ssama2")~ THEN
    REPLY @2334 /* Is there a way to extract powers from this strange fruit? */
    GOTO Fruitful

  // reinforced horn
  IF ~PartyHasItem("S!shorn")~ THEN
    REPLY @2335 /* Could you improve Amber Horn of Valhalla even further? */
    GOTO Horn2

  // limak brain
  IF ~PartyHasItem("S!misc20")~ THEN
    REPLY @2336 /* Could you do something with Limak's brain? */
    GOTO Limak

  // gauntlets of the gracelord
  IF ~PartyHasItem("brac06")~ THEN
    REPLY @2337 /* What could be done with these potent gauntlets of Ogre Power? */
    GOTO Grandlord

  // flask of greater wish
  IF ~PartyHasItem("S!smisc4")~ THEN
    REPLY @2338 /* What do you make of this mysterious flask? */
    GOTO Flask

  // ultimate horn
  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("S!shorn2")~ THEN
    REPLY @2339 /* Could you improve Reinforced Horn of Valhalla even further? */
    GOTO Horn3

  // reinforced indigo stone
  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("S!helm01")~ THEN
    REPLY @2340 /* Is there a way to improve this indigo ioun stone? */
    GOTO Ioun2

  // spear of withering
  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("sper10")~ THEN
    REPLY @2341 /* What can be done about this dangerous spear? */
    GOTO Shrivel

  // greater dracolich body
  IF ~PartyHasItem("S!smisc6")~ THEN
    REPLY @2342 /* Do you have interest in these remains of a Greater Dracolich? */
    GOTO Draco

  // missionnaire +5
  IF ~PartyHasItem("SHLD31")~ THEN
    REPLY @2343 /* Can you make Darksteel Shield better? */
    GOTO Darksteel

  // axe of gleaming lava
  IF ~PartyHasItem("S!axe01")~ THEN
    REPLY @2344 /* Can you improve the Volcano axe further? */
    GOTO Gleaming

  // riskbreaker lord boots
  IF ~PartyHasItem("S!sboo02")~ THEN
    REPLY @2345 /* What can you do for these potent Riskbreaker boots? */
    GOTO Bootlord

  // riskbreaker hammer axe
  IF ~PartyHasItem("AX1H12")~ THEN
    REPLY @2346 /* Is there a way to improve Stonefire axe? */
    GOTO Axelord

  // talisman of greater shielding
  IF ~PartyHasItem("S!amul02")~ THEN
    REPLY @2347 /* Could Talisman of Greater Protection be improved futher? */
    GOTO Shielding

  // undoer
  IF ~PartyHasItem("S!staf05")~ THEN
    REPLY @2348 /* Could you possibly improve Golem Slayer? */
    GOTO Undoer

  // wild mage's dream
  IF ~PartyHasItem("S!robe04")~ THEN
    REPLY @2349 /* Would this wild mage's robe be able to hold more enchantments? */
    GOTO WildMage

  // amulet of styx
  IF ~!CheckStat(Player1,6,SCRIPTINGSTATE1) PartyHasItem("S!amul04")~ THEN
    REPLY @2350 /* Is there a way to make this necromantic amulet wearable by any mage? */
    GOTO Styx

  // neera's wish
  IF ~PartyHasItem("S!robe03") PartyHasItem("S!srobe1")~ THEN
    REPLY @2351 /* Could you possibly fashion an even stronger garment for a wild mage? */
    GOTO NeeraWish

  // lakesider's dream
  IF ~GlobalGT("Chapter","GLOBAL",7) OR(2) PartyHasItem("S!axe02") PartyHasItem("S!axe03")~ THEN
    REPLY @2352 /* What would it take to perfect this vagrant's axe? */
    GOTO Lakesider

  // red coral armor
  IF ~PartyHasItem("S!leat05")~ THEN
    REPLY @2353 /* How can we make this vagrant's armor even stronger? */
    GOTO RedCoral

  // missionnaire +6
  IF ~PartyHasItem("S!sshld1")~ THEN
    REPLY @2354 /* Can you improve Shield of the Missionnaire even further? */
    GOTO Mission

  // boots of focused combat
  IF ~PartyHasItem("S!boot05")~ THEN
    REPLY @2355 /* Anything you could do about these Wizard Slayer's boots? */
    GOTO Focused

  // turn of events
  IF ~PartyHasItem("amul14")~ THEN
    REPLY @2356 /* Can you craft a protective amulet for a wild mage? */
    GOTO TurnOfEvents

  // symbol of wisdom
  IF ~PartyHasItem("RING22")~ THEN
    REPLY @2407  /* What can you do with this ring of holiness? */
    GOTO SymbolWisdom

  ++ @2310 /* Goodbye, lady Elowen. */ + Leave
END

IF ~~ THEN BEGIN Chunk
  SAY @2357 /* This one is simple. Give me two chunks of amber and I will merge them into a single chunk of reinforced amber. It will cost you only 5000 gold. Are you interested? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~NumItemsPartyGT("S!misc27",1) PartyGoldGT(4999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(5000) DestroyGold(5000)
        TakePartyItemNum("S!misc27",2) DestroyItem("S!misc27")
                                       DestroyItem("S!misc27")
        GiveItemCreate("S!sramb",Player1,0,0,0)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN AmberAmulet
  SAY @2360 /* I could if you bring me the Glimmering Essence of Amber, a Ring of Regeneration, a Scroll of Memory Boosting and a Manual of Elaboration. The job will cost 75000 gold. Agreed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!samul") PartyHasItem("S!sesse") PartyHasItem("RING31") PartyHasItem("S!misc01") PartyHasItem("S!misc06") PartyGoldGT(74999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2361 /* I can improve your Supreme Chain Mail with amber. Bring me a single Reinforced Chunk, a bottle of Barbarian Essence and a Permanency scroll. The job will cost 60000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!chan01") PartyHasItem("S!sramb") PartyHasItem("POTN33") PartyHasItem("S!misc02") PartyGoldGT(59999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2362 /* I can merge your Full Plate +2 with Improved Ankheg Plate Mail. Bring me the both plates, a single Reinforced Chunk of Amber, a single Oil of Resurgence and a Permanency scroll. The cost is 100,000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("plat19") PartyHasItem("S!plat03") PartyHasItem("S!sramb") PartyHasItem("POTN37") PartyHasItem("S!misc02") PartyGoldGT(99999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(100000) DestroyGold(100000)
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
  SAY @2363 /* Aye, I can merge it with Great Wyrm Armor. Give me the both plates and a single Reinforced Chunk of Amber. The price will be 50000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~Global("Iaplat06forged","GLOBAL",1) PartyHasItem("S!splat1") PartyHasItem("S!plat06") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!splat1",1) DestroyItem("S!splat1")
        TakePartyItemNum("S!plat06",1) DestroyItem("S!plat06")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!splat2",Player1,0,0,0)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Horn
  SAY @2364 /* Yes, the horn's magic may be improved upon with a single Reinforced Chunk of Amber. The process will cost 50000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!misc10") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!misc10",1) DestroyItem("S!misc10")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shorn",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Balduran
  SAY @2365 /* I can combine it with Helmet of Defense. I will need a single Reinforced Chunk of Amber as well. The price for the job is 40000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!helm02")~ THEN REPLY @2366 /* Would you accept Improved Dragon Helm instead? */ GOTO Balduran2

  IF ~PartyHasItem("helm07") PartyHasItem("helm04") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("helm07",1) DestroyItem("helm07")
        TakePartyItemNum("helm04",1) DestroyItem("helm04")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shelm1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Balduran2
  SAY @2367 /* Yes, it would work as well. Shall I begin? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("helm07") PartyHasItem("S!helm02") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("helm07",1) DestroyItem("helm07")
        TakePartyItemNum("S!helm02",1) DestroyItem("S!helm02")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shelm1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Damascus
  SAY @2368 /* I can improve it, but the charm and confusion immunities on the sword would need to be sacrificed. The essence of Lilarcor won't let me work on it. Do you want to proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList
  ++ @2369 /* Very well. */ + Damascus2
END

IF ~~ THEN BEGIN Damascus2
  SAY @2370 /* Bring me a scimitar called Belm, a chunk of Reinforced Amber and a copy of Manual of Elaboration. And 75000 gold. Then I will begin. */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~OR(6) PartyHasItem("s!sw07") PartyHasItem("s!sw08") PartyHasItem("s!sw09") PartyHasItem("s!sw10") PartyHasItem("s!sw11") PartyHasItem("s!sw12")
      PartyHasItem("SW1H30") PartyHasItem("S!misc06") PartyHasItem("S!sramb") PartyGoldGT(74999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2371 /* Improving a staff made by Hephaestus is no easy task. I need to melt Sentinel +4 Shield and use its special metal to reforge the staff. I need a chunk of Reinforced Amber as well. It will cost you no less than 90000 gp. What do you say? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~Global("Iastaf07forged","GLOBAL",1) PartyHasItem("S!staf07") PartyHasItem("SHLD22") PartyHasItem("S!sramb") PartyGoldGT(89999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(90000) DestroyGold(90000)
        TakePartyItemNum("S!staf07",1) DestroyItem("S!staf07")
        TakePartyItemNum("SHLD22",1) DestroyItem("SHLD22")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sstaf1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Rimed
  SAY @2372 /* Yes, I can meld its powers with those of Ice Star +4. I will need a chunk of Reinforced Amber to do the job. The price is 50000 gp. Shall I begin? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~GlobalGT("Chapter","GLOBAL",7) PartyHasItem("S!blun02") PartyHasItem("BLUN35") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!blun02",1) DestroyItem("S!blun02")
        TakePartyItemNum("BLUN35",1) DestroyItem("BLUN35")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sblu03",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Ioun
  SAY @2373 /* Yes, the ioun stone has the potential to become stronger. I will need a chunk of Reinforced Amber and an Amber Shell to do the job. It will cost you 30000 gp. Shall I begin? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!sioun1") PartyHasItem("S!smisc2") PartyHasItem("S!sramb") PartyGoldGT(29999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(30000) DestroyGold(30000)
        TakePartyItemNum("S!sioun1",1) DestroyItem("S!sioun1")
        TakePartyItemNum("S!smisc2",1) DestroyItem("S!smisc2")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!sioun2",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Roses
  SAY @2374 /* I can imbue the blade with additional enchantments. I will need Kundane sword, a chunk of Reinforced Amber, a Ring of Protection +2 and a Forty Eight sided Garnet to do the job. It will cost you 50000 gp. Shall I begin? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("sw1h40") PartyHasItem("sw1h25") PartyHasItem("ring07") PartyHasItem("S!misc21") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2375 /* Aye, there's enough capacity left for more. Bring me Belt of Inertial Barrier, a chunk of Reinforced Amber and a Ring of Protection +2. The price is 50000 gold. Shall I begin? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("s!belt01") PartyHasItem("belt10") PartyHasItem("ring07") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2376 /* There's a recipe I could try. I will need Defender of Easthaven, a chunk of Reinforced Amber and a Ring of Protection +3. I will also require a unique Amber Star Gem. The price of my work is 40000 gold. Shall I begin? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("s!blun03") PartyHasItem("waflail") PartyHasItem("ring41") PartyHasItem("S!smisc3") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2377 /* Is it the Samara fruit? A rare sight. I can use it to imbue a simple Ring of Protection +2 with additional powers. Bring me Shield of Harmony +2 and a chunk of Reinforced Amber. This will cost you 30000 gold. Shall I begin? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("s!ssama2") PartyHasItem("SHLD25") PartyHasItem("RING07") PartyHasItem("S!sramb") PartyGoldGT(29999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2378 /* The horn may still grow stronger if I continue apply Reinforced Chunk of Amber to the process. Bring me a single Chunk, Moon Dog Figurine and Golden Lion Figurine. The process will cost 50000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!shorn") PartyHasItem("MISC7T") PartyHasItem("MISC3D") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2379 /* I have heard tales about this man. He lives no more, then? I can't produce anything for you, for I lack the necessary experience. I would offer gold to purchase the artefact from you. Say, 75000. Would it suffice? */

  ++ @2380 /* I will think on it. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!misc20")~
  THEN
    REPLY @2381 /* Yes, I will be glad to get rid of it. */
    DO ~TakePartyItemNum("S!misc20",1) DestroyItem("S!misc20")
        GiveGoldForce(75000)~
    EXIT
END

IF ~~ THEN BEGIN Grandlord
  SAY @2382 /* These are a powerful vessel, capable of storing multiple enchantments. Bring me Gauntlets of Weapon Expertise, Gauntlets of Dexterity, Gloves of Healing and a chunk of Reinforced Amber. The price is 30000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("brac10") PartyHasItem("brac06") PartyHasItem("brac07") PartyHasItem("brac20") PartyHasItem("S!sramb") PartyGoldGT(29999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2383 /* I may know a way to bind a powerful magic spell to this artefact. But the final result may be upredictable. Bring me a scroll of Wish, a chunk of Reinforced Amber and a Manual of Elaboration. The price is 50000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!smisc4") PartyHasItem("SCRLB4") PartyHasItem("S!misc06") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2384 /* There is still more that we can accomplish with the horn. Bring me a single Chunk of Reinforced Amber and Shakti Figurine. The process will cost 50000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!shorn2") PartyHasItem("FIGURE01") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!shorn2",1) DestroyItem("S!shorn2")
        TakePartyItemNum("FIGURE01",1) DestroyItem("FIGURE01")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!shorn3",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Ioun2
  SAY @2385 /* I can imbue it with the power of two more lesser stones. Bring me Obsidian Ioun Stone, Lavender Ioun Stone and a single Chunk of Reinforced Amber. The price is 40000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!helm01") PartyHasItem("helm24") PartyHasItem("helm26") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2386 /* That is a vile thing indeed. It has potential for stronger enchantment, but I would need something incredibly powerful to match. Is there an artefact you may offer? */

  ++ @2380 /* I will think on it. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!smisc6")~
  THEN
    REPLY @2387 /* Yes, I have this powdered body of a Greater Dracolich. */
    GOTO Shrivel2
END

IF ~~ THEN BEGIN Shrivel2
  SAY @2388 /* You carry the remains of a dracolich? You tease me not? In that case, I can improve your spear. */
  = @2389 /* The job will cost sixty thousand gold. Are you willing to proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("SPER10") PartyHasItem("S!smisc6") PartyGoldGT(59999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("SPER10",1) DestroyItem("SPER10")
        TakePartyItemNum("S!smisc6",1) DestroyItem("S!smisc6")
        GiveItemCreate("S!sspe01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Draco
  SAY @2390 /* Men have claimed the creature to be but a myth. If someone else were to offer me this treasure, I'd call him a charlatan. */
  = @2391 /* Yet you tend to find the most exotic artefacts. I am willing to buy such a rare specimen for 150 thousand gold. Does it suit you? */

  ++ @2380 /* I will think on it. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!smisc6")~
  THEN
    REPLY @2392 /* Yes, I have no purpose for it. */
    DO ~TakePartyItemNum("S!smisc6",1) DestroyItem("S!smisc6")
        GiveGoldForce(150000)~
    EXIT
END

IF ~~ THEN BEGIN Darksteel
  SAY @2393 /* Ah, this shield reminds me of an amusing story. I may improve it if you bring me another shield, Saving Grace +3, a potion of Magic Shielding, a potion of Barbarian Essence and a Permanency scroll. The price is 40000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("shld31") PartyHasItem("shld27") PartyHasItem("potn35") PartyHasItem("potn33") PartyHasItem("S!misc02") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2394 /* Yes, I have a simple, but efficient improvement to offer. Bring me a Ring of Protection +2 and a chunk of Reinforced Amber. I will ask 60 thousand gold for the job. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!axe01") PartyHasItem("ring07") PartyHasItem("S!sramb") PartyGoldGT(59999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("S!axe01",1) DestroyItem("S!axe01")
        TakePartyItemNum("ring07",1) DestroyItem("ring07")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!saxe01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Bootlord
  SAY @2395 /* A legend follows this pair of footwear. I may just help you fulfill it. Bring me a Cloak of Protection +2, an Oil of Speed, Oil of Resurgence, a potion of Magic Shielding and a Permanency scroll. The job's price is 30 thousand gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!sboo02") PartyHasItem("CLCK02") PartyHasItem("POTN14") PartyHasItem("POTN37") PartyHasItem("POTN35") PartyHasItem("S!misc02") PartyGoldGT(29999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
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
  SAY @2396 /* There's an old dwarven recipe that may fuse this axe with a war hammer. Bring me a War Hammer +3, a dwarven Rune of Clangeddin and a chunk of Reinforced Amber. The price is 50 thousand gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("AX1H12") PartyHasItem("HAMM12") PartyHasItem("COMPON09") PartyHasItem("S!sramb") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("AX1H12",1) DestroyItem("AX1H12")
        TakePartyItemNum("HAMM12",1) DestroyItem("HAMM12")
        TakePartyItemNum("COMPON09",1) DestroyItem("COMPON09")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!saxe02",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Shielding
  SAY @2397 /* The amulet may be infused with more magics still. Bring me Shield amulet, an Amulet of Protection, a chunk of Reinforced Amber and a Permanency scroll. The job will cost you 60 thousand gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!amul02") PartyHasItem("AMUL15") PartyHasItem("AMUL14") PartyHasItem("S!sramb") PartyHasItem("S!misc02") PartyGoldGT(59999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("S!amul02",1) DestroyItem("S!amul02")
        TakePartyItemNum("AMUL15",1) DestroyItem("AMUL15")
        TakePartyItemNum("AMUL14",1) DestroyItem("AMUL14")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!samu01",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Undoer
  SAY @2398 /* I will need a great amount of amber to empower the staff. Bring the head of a Greater Amber golem, a chunk of Reinforced Amber and a scroll of Wish. The price is 75,000 gold pieces. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!staf05") PartyHasItem("SCRLB4") PartyHasItem("S!sramb") PartyHasItem("S!shead") PartyGoldGT(74999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(75000) DestroyGold(75000)
        TakePartyItemNum("S!staf05",1) DestroyItem("S!staf05")
        TakePartyItemNum("SCRLB4",1) DestroyItem("SCRLB4")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        TakePartyItemNum("S!shead",1) DestroyItem("S!shead")
        GiveItemCreate("S!sstaf2",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN WildMage
  SAY @2399 /* Gah! I've never seen a more garish choice of colors in my life! But it'll have to do. Bring me a scroll of Foreknowledge, a wizard's scroll of Protection From Fire, a potion of Defense, a chunk of Reinforced Amber, a Permanency scroll and a scroll of Memory Boosting. The price is 60,000 gold pieces. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!robe04") PartyHasItem("S!scrl06") PartyHasItem("SCRL6H") PartyHasItem("potn24") PartyHasItem("S!sramb") PartyHasItem("S!misc01") PartyHasItem("S!misc02") PartyGoldGT(59999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("S!robe04",1) DestroyItem("S!robe04")
        TakePartyItemNum("S!scrl06",1) DestroyItem("S!scrl06")
        TakePartyItemNum("SCRL6H",1) DestroyItem("SCRL6H")
        TakePartyItemNum("potn24",1) DestroyItem("potn24")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        TakePartyItemNum("S!misc01",1) DestroyItem("S!misc01")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!srobe1",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Styx
  SAY @2400 /* A bold task. I will attempt to do what you ask. Bring me Metaspell Influence amulet, an Amulet of Protection, a wizard's scroll of Protection From Magic Energy, a chunk of Reinforced Amber, a Permanency scroll and a scroll of Memory Boosting. The price will be 40,000 gold pieces. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~!CheckStat(Player1,6,SCRIPTINGSTATE1) PartyHasItem("S!amul04") PartyHasItem("amul16") PartyHasItem("amul14") PartyHasItem("SCRL7J") PartyHasItem("S!sramb") PartyHasItem("S!misc01") PartyHasItem("S!misc02") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("S!amul04",1) DestroyItem("S!amul04")
        TakePartyItemNum("amul16",1) DestroyItem("amul16")
        TakePartyItemNum("amul14",1) DestroyItem("amul14")
        TakePartyItemNum("SCRL7J",1) DestroyItem("SCRL7J")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        TakePartyItemNum("S!misc01",1) DestroyItem("S!misc01")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!samu02",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN NeeraWish
  SAY @2401 /* Your half-elf companion should be wary of what she desires. I will humor the request, but if anything goes awry, the consequences lie with her. Give me Neera's Greater Robe of Invocation, it is a perfect vessel for such an experiment. I will need a copy of Manual of Elaboration as well. The task will cost you 60,000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!robe03") PartyHasItem("S!srobe1") PartyHasItem("S!misc06") PartyGoldGT(59999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("S!robe03",1) DestroyItem("S!robe03")
        TakePartyItemNum("S!srobe1",1) DestroyItem("S!srobe1")
        TakePartyItemNum("S!misc06",1) DestroyItem("S!misc06")
        GiveItemCreate("S!srobe2",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Lakesider
  SAY @2402 /* Rarely have I seen a weapon so perfect in its simplicity. Almost perfect, for I can do more. Bring me a rare Exquisite Water Opal gem and a chunk of Reinforced Amber. The job will cost you 40,000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~GlobalGT("Chapter","GLOBAL",7) OR(2) PartyHasItem("S!axe02") PartyHasItem("S!axe03") PartyHasItem("S!sopal") PartyHasItem("S!sramb") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("S!axe02",1) DestroyItem("S!axe02")
        TakePartyItemNum("S!axe03",1) DestroyItem("S!axe03")
        TakePartyItemNum("S!sopal",1) DestroyItem("S!sopal")
        TakePartyItemNum("S!sramb",1) DestroyItem("S!sramb")
        GiveItemCreate("S!saxe03",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN RedCoral
  SAY @2403 /* A wondrous piece of clothing. We can strengthen it with a few magic trinkets. Bring me Crimson Ioun Stone, a potion of Barbarian Essence, a potion of Magic Shielding and a Permanency scroll. The price will be 60,000 gold pieces. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!leat05") PartyHasItem("S!helm06") PartyHasItem("potn33") PartyHasItem("potn35") PartyHasItem("S!misc02") PartyGoldGT(59999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(60000) DestroyGold(60000)
        TakePartyItemNum("S!leat05",1) DestroyItem("S!leat05")
        TakePartyItemNum("S!helm06",1) DestroyItem("S!helm06")
        TakePartyItemNum("potn33",1) DestroyItem("potn33")
        TakePartyItemNum("potn35",1) DestroyItem("potn35")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!slea04",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Mission
  SAY @2404 /* I believe there's another holy shield that I can use to make this one stronger. Bring me Shield of the Order, a potion of Barbarian Essence and a Permanency scroll. The job will cost you 40,000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!sshld1") PartyHasItem("SHLD32") PartyHasItem("potn33") PartyHasItem("S!misc02") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("S!sshld1",1) DestroyItem("S!sshld1")
        TakePartyItemNum("SHLD32",1) DestroyItem("SHLD32")
        TakePartyItemNum("potn33",1) DestroyItem("potn33")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!sshld2",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN Focused
  SAY @2405 /* Rumours are there's an ancient text replete with secrets of the Wizard Slayer warrior caste. Bring it to me, along with Boots of Grounding and a copy of Manual of Elaboration, and I see what can be done. The price for this is 50,000 gold. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("S!boot05") PartyHasItem("BOOT05") PartyHasItem("S!smisc7") PartyHasItem("S!misc06") PartyGoldGT(49999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(50000) DestroyGold(50000)
        TakePartyItemNum("S!boot05",1) DestroyItem("S!boot05")
        TakePartyItemNum("BOOT05",1) DestroyItem("BOOT05")
        TakePartyItemNum("S!smisc7",1) DestroyItem("S!smisc7")
        TakePartyItemNum("S!misc06",1) DestroyItem("S!misc06")
        GiveItemCreate("S!sboo04",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN TurnOfEvents
  SAY @2406 /* Aye, I have just the recipe in mind. Bring me scrolls of Foreknowledge and Luck, and a Permanency scroll. I will charge 40,000 for the job. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("AMUL14") PartyHasItem("S!scrl06") PartyHasItem("SCRL93") PartyHasItem("S!misc02") PartyGoldGT(39999)~
  THEN
    REPLY @2359 /* Yes please, go ahead. */
    DO ~TakePartyGold(40000) DestroyGold(40000)
        TakePartyItemNum("AMUL14",1) DestroyItem("AMUL14")
        TakePartyItemNum("S!scrl06",1) DestroyItem("S!scrl06")
        TakePartyItemNum("SCRL93",1) DestroyItem("SCRL93")
        TakePartyItemNum("S!misc02",1) DestroyItem("S!misc02")
        GiveItemCreate("S!samu03",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END

IF ~~ THEN BEGIN SymbolWisdom
  SAY @2408 /* I may craft a ring fit for the wisest of the holy folk, for a small commission of 30,000. Bring me the holy symbol of Lathander or Helm and a Ring of Protection +2. Shall I proceed? */

  ++ @2358 /* Maybe later. Could you work on something else? */ + ItemList

  IF ~PartyHasItem("BELT12") PartyHasItem("RING22") PartyHasItem("RING07") PartyGoldGT(29999)~
  THEN
    REPLY @2409 /* Yes please, go ahead. Use Holy Symbol of Lathander. */
    DO ~TakePartyGold(30000) DestroyGold(30000)
        TakePartyItemNum("BELT12",1) DestroyItem("BELT12")
        TakePartyItemNum("RING22",1) DestroyItem("RING22")
        TakePartyItemNum("RING07",1) DestroyItem("RING07")
        GiveItemCreate("S!srin02",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT

  IF ~PartyHasItem("BELT13") PartyHasItem("RING22") PartyHasItem("RING07") PartyGoldGT(29999)~
  THEN
    REPLY @2410 /* Yes please, go ahead. Use Holy Symbol of Helm. */
    DO ~TakePartyGold(30000) DestroyGold(30000)
        TakePartyItemNum("BELT13",1) DestroyItem("BELT13")
        TakePartyItemNum("RING22",1) DestroyItem("RING22")
        TakePartyItemNum("RING07",1) DestroyItem("RING07")
        GiveItemCreate("S!srin02",Player1,1,1,1)
        CreateVisualEffectObject("spcrtwpn","S!selow")~
    EXIT
END