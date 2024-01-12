REPLACE ~BOTSMITH~
  IF ~~ THEN BEGIN 221
    SAY @1220 IF ~~ THEN REPLY @1218 GOTO 4
    IF ~PartyHasItem("rods04") PartyHasItem("scrl5i") PartyHasItem("S!misc02") PartyHasItem("staf24")
        PartyHasItem("staf19") PartyHasItem("S!misc06") NumItemsPartyGT("S!scrl01",2) PartyGoldGT(89999)~
      THEN REPLY @1219
      DO ~TakePartyGold(90000)      DestroyGold(90000)
          TakePartyItemNum("rods04",1)   DestroyItem("rods04")
          TakePartyItemNum("staf24",1)   DestroyItem("staf24")
          TakePartyItemNum("staf19",1)   DestroyItem("staf19")
          TakePartyItemNum("S!misc06",1)   DestroyItem("S!misc06")
          TakePartyItemNum("S!misc02",1)   DestroyItem("S!misc02")
          TakePartyItemNum("scrl5i",1)   DestroyItem("scrl5i")
          TakePartyItemNum("S!scrl01",3)   DestroyItem("S!scrl01")
                                         DestroyItem("S!scrl01")
                                         DestroyItem("S!scrl01")
          GiveItemCreate("S!staf05",Player1,1,1,1)
          CreateVisualEffect("spcrtwpn",[401.348])~ EXIT
  END
END