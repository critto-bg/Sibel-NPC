BEGIN ~S!SibelB~

/* first banter */

IF ~Global("IaSibelTalks","GLOBAL",2)~ THEN BEGIN B1SibelQuestion
  SAY @3500 /* Tell me <CHARNAME>, what is the difference between intelligence and wisdom? */
  ++ @3501 /* Good question! I am all ears to listen to your own answer. */ + B1SibelAnswer
  ++ @3502 /* I have an answer to give, but I'd like to hear yours first. */ + B1SibelAnswer
END

IF ~~ THEN BEGIN B1SibelAnswer
  SAY @3503 /* If we compare our mind to a machine, intelligence is the apparatus, while wisdom is the skill to run it for the right purpose. */
  ++ @3504 /* In other words, intelligence is wit, whereas wisdom is utilizing the wit. */ + B1Clarification
END

IF ~~ THEN BEGIN B1Clarification
  SAY @3505 /* Exactly! That is why you sometimes see intelligent people who believe in absurd superstitions. They can solve complex math puzzles, but are unable to see that their fundamental beliefs about the world are misguided. */
  ++ @3506 /* I couldn't agree more. */ + B1ThankYou
  ++ @3507 /* Maybe we can say that wisdom relates more to philosophy, while intelligence is more about the capacity of calculation and utilizing the memory. */ + B1Glad
END

IF ~~ THEN BEGIN B1ThankYou
  SAY @3508 /* Thank you very much, <CHARNAME>! */
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",3) AddXPObject("S!Sibel",51000)~ EXIT
END

IF ~~ THEN BEGIN B1Glad
  SAY @3509 /* I am glad to see that we two think so much alike. */
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",3) AddXPObject("S!Sibel",51000)~ EXIT
END

/* second banter */

IF ~Global("IaSibelTalks","GLOBAL",5)~ THEN BEGIN B2SibelQuestion
  SAY @3510 /* Have I told you about Virtus Arcanis, <CHARNAME>? */
  ++ @3511 /* No you have not, but I'm curious to hear. */ + B2WhoIsVirtus
END

IF ~~ THEN BEGIN B2WhoIsVirtus
  SAY @3512 /* He was a son of a grandson of Lord Tristan's, whom we've met in the ancient Arcanis village. */
  ++ @3513 /* He was three generations younger than Lord Arcanis? */ + B2Still
  ++ @3514 /* Was he also one of your ancestors? */ + B2Lineage
END

IF ~~ THEN BEGIN B2Still
  SAY @3515 /* Yes. Still quite a good number of generations older than my father. */
  ++ @3514 /* Was he also one of your ancestors? */ + B2Lineage
END

IF ~~ THEN BEGIN B2Lineage
  SAY @3516 /* No, my family lineage goes back to one of his father's cousins, another grandson of Lord Tristan. */
  ++ @3517 /* Go on. */ + B2MoreLineage
END

IF ~~ THEN BEGIN B2MoreLineage
  SAY @3518 /* Some say that the father of Virtus was a very attractive man. In his younger years, he succeded to win Mnemosyne's affection and married her... well... in a way. Virtus is their son. */
  ++ @3519 /* Who is Mnemosyne? */ + B2Mnemosyne
  ++ @3520 /* I recall reading the old books of lore about Mnemosyne. */ + B2Mnemosyne
END

IF ~~ THEN BEGIN B2Mnemosyne
  SAY @3521 /* Mnemosyne is the titaness and goddess of memory, a daughter of Uranus and Gaea. */
  ++ @3517 /* Go on. */ + B2More
  ++ @3522 /* Virtus was a demigod then? */ + B2More
END

IF ~~ THEN BEGIN B2More
  SAY @3523 /* My father had a theory that Virtus inherited a limited type of immortality from his mother. The onset of age and passage of time hold no power over him, yet he can be slain in battle, still. */
  ++ @3524 /* How could your father possibly know this? */ + B2How
END

IF ~~ THEN BEGIN B2How
  SAY @3525 /* I am uncertain. Maybe it was just a theory? Perhaps, he had found a scroll about Virtus in our family's old library. */
  = @3526 /* Father claimed that Virtus had left the family village when he was a child to pursue education under the tutelage of his mother. */
  ++ @3527 /* Who was the goddess of memory. */ + B2End
END

IF ~~ THEN BEGIN B2End
  SAY @3528 /* Yes, father believed Virtus to be a mage of immense power, his capacity to recite and weave magic surpassing that of mere mortal mages. */
  = @3529 /* According to father, a day will come when our enemies will strike with all their might, seeking retribution for perceived wrongs. On that day, Virtus Arcanis will return and aid us. */
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",6)~ EXIT
END

/* third banter */

IF ~Global("IaSibelClericTalk","GLOBAL",2)~ THEN BEGIN B3OnYourMind
  SAY @3530 /* You seem preoccupied, <CHARNAME>? Is there something on your mind? */
  ++ @3531 /* Yes, actually. I've had a question to ask of you for a time now. */ + B3Question
END

IF ~~ THEN BEGIN B3Question
  SAY @3532 /* Go ahead. */
  ++ @3533 /* As a priest, which god do you worship? */ + B3WhichGod
END

IF ~~ THEN BEGIN B3WhichGod
  SAY @3534 /* None! I don't worship any god. */
  IF ~~ THEN REPLY @3535 /* What is the source of your magic, then? */ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
  IF ~~ THEN REPLY @3536 /* What do you think of the gods, Sibel? */ DO ~SetGlobal("IaB3Kids","LOCALS",1)~ GOTO B3Kids
END

IF ~~ THEN BEGIN B3Wisdom
  SAY @3537 /* My magic flows from my wisdom, not from any god. */
  ++ @3538 /* Is it the same for other clerics? */ + B3Clerics
END

IF ~~ THEN BEGIN B3Clerics
  SAY @3539 /* Perhaps, for the most of them, even if they are not aware of it. They pray to their gods to fuel their magic, and the gods are pleased with the notion. */
  IF ~Global("IaB3Kids","LOCALS",0)~ THEN REPLY @3536 /* What do you think of the gods, Sibel? */ DO ~SetGlobal("IaB3Kids","LOCALS",1)~ GOTO B3Kids
  ++ @3540 /* Lord Tristan was right to call you wise. */ + B3Wise
END

IF ~~ THEN BEGIN B3Kids
  SAY @3541 /* Gods are just big kids who never grew up. They love to play and they want to be pleased. */
  ++ @3542 /* If you mean "powerful" when you say "big", then I couldn't agree more. */ + B3Power
END

IF ~~ THEN BEGIN B3Power
  SAY @3543 /* They are powerful, but have we ever knelt down in front of power? */
  ++ @3544 /* No, we haven't. Mere power is not a reason enough to be respected, let alone worshipped. */ + B3Exactly
  IF ~Global("IaB3Wisdom","LOCALS",0)~ THEN REPLY @3545 /* Where does you magic come from, then? */ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
END

IF ~~ THEN BEGIN B3Exactly
  SAY @3546 /* 'Tis true! */
  IF ~Global("IaB3Wisdom","LOCALS",0)~ THEN REPLY @3535 /* What is the source of your magic, then? */ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
  ++ @3540 /* Lord Tristan was right to call you wise. */ + B3Wise
END

IF ~~ THEN BEGIN B3Wise
  SAY @3547 /* Thank you, <CHARNAME>! I am glad we are of the same mind. */

  IF ~~ THEN DO ~SetGlobal("IaSibelClericTalk","GLOBAL",3)~ EXIT
END

/* fourth banter */

IF ~Global("IaSibelTalks","GLOBAL",8)~ THEN BEGIN B4Letter
  SAY @3548 /* The letter the boy gave me is signed by Lawrence Amberville. */

  ++ @3549 /* That is odd. Lord Lawrence still lives? */ + B4Signature
  ++ @3550 /* What does it say? */ + B4Says
END

IF ~~ THEN BEGIN B4Signature
  SAY @3551 /* I wondered the same once I saw the signature. */

  ++ @3550 /* What does it say? */ + B4Says
END

IF ~~ THEN BEGIN B4Says
  SAY @3552 /* He states that I am of Amberville heritage, through my mother's line. The amulet should serve as proof, for only a member of Amberville family may wear it, or so he claims. */

  IF ~Global("IaB4Judge","LOCALS",0)~ THEN
    REPLY @3553 /* Does this mean your father hid the truth from you? */
    DO ~SetGlobal("IaB4Judge","LOCALS",1)~
    GOTO B4Judge

  IF ~Global("IaB4Amulet","LOCALS",0)~ THEN
    REPLY @3554 /* The whole story could be a fabrication. */
    DO ~SetGlobal("IaB4Amulet","LOCALS",1)~
    GOTO B4Amulet

  IF ~Global("IaB4Mother","LOCALS",0)~ THEN
    REPLY @3555 /* How much do you know about your mother? */
    DO ~SetGlobal("IaB4Mother","LOCALS",1)~
    GOTO B4Mother
END

IF ~~ THEN BEGIN B4Judge
  SAY @3556 /* Who am I to judge what my father chose to tell me or not? Children are in no position to make such judgement, for they lack complete knowledge of all that transpired between their parents. */

  IF ~Global("IaB4Amulet","LOCALS",0)~ THEN
    REPLY @3554 /* The whole story could be a fabrication. */
    DO ~SetGlobal("IaB4Amulet","LOCALS",1)~
    GOTO B4Amulet

  ++ @3557 /* What if this claim proves to be truth? What will you do? */ + B4Time

  IF ~Global("IaB4Mother","LOCALS",0)~ THEN
    REPLY @3555 /* How much do you know about your mother? */
    DO ~SetGlobal("IaB4Mother","LOCALS",1)~
    GOTO B4Mother
END

IF ~~ THEN BEGIN B4Amulet
  SAY @3558 /* I have no choice but to try the amulet. */

  ++ @3559 /* The amulet alone is not evidence enough to discern the truth. */ + B4Time

  IF ~Global("IaB4Judge","LOCALS",0)~ THEN
    REPLY @3553 /* Does this mean your father hid the truth from you? */
    DO ~SetGlobal("IaB4Judge","LOCALS",1)~
    GOTO B4Judge

  IF ~Global("IaB4Mother","LOCALS",0)~ THEN
    REPLY @3555 /* How much do you know about your mother? */
    DO ~SetGlobal("IaB4Mother","LOCALS",1)~
    GOTO B4Mother
END

IF ~~ THEN BEGIN B4Mother
  SAY @3560 /* Precious little. She passed away when I was an infant. Father told little of her, but when he did, he always spoke of good things. */

  IF ~Global("IaB4Amulet","LOCALS",0)~ THEN
    REPLY @3554 /* The whole story could be a fabrication. */
    DO ~SetGlobal("IaB4Amulet","LOCALS",1)~
    GOTO B4Amulet

  ++ @3557 /* What if this claim proves to be truth? What will you do? */ + B4Time
END

IF ~~ THEN BEGIN B4Time
  SAY @3561 /* I am unsure. I need time to weigh this story in my mind. */

  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",9)~ UNSOLVED_JOURNAL @1109 EXIT
END

/* fifth banter */

IF ~Global("IaSibelTalks","GLOBAL",11)~ THEN BEGIN B5Advice
  SAY @3562 /* I am in need of your advice, <CHARNAME>! */

  ++ @3563 /* I am listening. What troubles you? */ + B5Suggest
END

IF ~~ THEN BEGIN B5Suggest
  SAY @3564 /* I still ponder the dilemma of my heritage. What course of action would you choose, were you in my stead? */

  ++ @3565 /* Your father has concealed the full truth. You should explore what your mother's kin may offer. */ + B5Hid
  ++ @3566 /* There's naught more important than family. You still remain Sibel Arcanis. You should stand by your folk. */ + B5Lineage

  IF ~GlobalGT("IaSGiftPlace","GLOBAL",0) Global("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY @3567 /* You have a family that cares for you. Lord Tristan put trust in your wisdom. Howard chose to make a gift, even unsure if it would ever reach you. */
    GOTO B5Good

  IF ~OR(2) Global("IaSGiftPlace","GLOBAL",0) GlobalLT("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY @3568 /* Those of Arcanis blood have treated us with kindness. The Amberville family unleashed only violence, and promises of yet more to come. */
    GOTO B5Good

  ++ @3569 /* Blood of both families courses through your veins. The choice is yours to make, and I will stand by you. */ + B5Neutral
  ++ @3570 /* What of the amulet? Does it confirm what Lord Amberville claims? */ + B5Examined
END

IF ~~ THEN BEGIN B5Hid
  SAY @3571 /* There may be a strong reason for my father's reticence. */

  ++ @3572 /* You seek words that would absolve your father of his weakness. It only steers you toward the same path he's trodden. */ + B5Evil
  ++ @3569 /* Blood of both families courses through your veins. The choice is yours to make, and I will stand by you. */ + B5Neutral
END

IF ~~ THEN BEGIN B5Lineage
  SAY @3573 /* Wiser words have not been spoken. Yet I am both an Amberville and an Arcanis. There's a choice to be made who are my true folk. Until I do, there won't be a resolution. */
  ++ @3570 /* What of the amulet? Does it confirm what Lord Amberville claims? */ + B5Examined
END

IF ~~ THEN BEGIN B5Examined
  SAY @3574 /* I have studied the binding magic stored within, and it rings true. The necklace does not reject me. So there's honesty in lord Amberville's claim. */

  ++ @3575 /* Take caution. The Ambervilles may still harbour hate toward your mother. And now they call forth her name, seeking to win your allegiance. To what end? */ + B5Agree
  ++ @3565 /* Your father has concealed the full truth. You should explore what your mother's kin may offer. */ + B5Evil
  ++ @3569 /* Blood of both families courses through your veins. The choice is yours to make, and I will stand by you. */ + B5Neutral
END

IF ~~ THEN BEGIN B5Agree
  SAY @3576 /* I take your words close to heart. There's little proof yet to abandon those I hold dear. */

  IF ~GlobalGT("IaSGiftPlace","GLOBAL",0) Global("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY @3567 /* You have a family that cares for you. Lord Tristan put trust in your wisdom. Howard chose to make a gift, even unsure if it would ever reach you. */
    GOTO B5Good

  IF ~OR(2) Global("IaSGiftPlace","GLOBAL",0) GlobalLT("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY @3568 /* Those of Arcanis blood have treated us with kindness. The Amberville family unleashed only violence, and promises of yet more to come. */
    GOTO B5Good
END

IF ~~ THEN BEGIN B5Good
  SAY @3577 /* Your words strengthen my resolve, <CHARNAME>. The Arcanis folk are the only true family I have ever known. I will stand by them, whatever may come. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelFamilyPath","GLOBAL",1)
        SetGlobal("IaSibelTalks","GLOBAL",12)
        SetGlobalTimer("IaSResolutionTimer","GLOBAL",7200)
        AddXPObject(Player1,45000)
        AddXPObject(Player2,45000)
        AddXPObject(Player3,45000)
        AddXPObject(Player4,45000)
        AddXPObject(Player5,45000)
        AddXPObject(Player6,45000)~
    UNSOLVED_JOURNAL @1110
    EXIT
END

IF ~~ THEN BEGIN B5Neutral
  SAY @3578 /* Thank you, <CHARNAME>. I treasure your loyalty. When the time comes to make the final decision, I might call upon your wisdom once more. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelFamilyPath","GLOBAL",2)
        SetGlobal("IaSibelTalks","GLOBAL",12)
        SetGlobalTimer("IaSResolutionTimer","GLOBAL",7200)~
    UNSOLVED_JOURNAL @1111
    EXIT
END

IF ~~ THEN BEGIN B5Evil
  SAY @3579 /* What would you propose, then? */

  ++ @3580 /* If Virtus Arcanis still lives and comes to you, refuse his offer. */ + B5StopQuest
  ++ @3581 /* Cast off the shackles of your past. If Virtus Arcanis reveals himself, we should kill him and be done with Arcanis family. */ + B5Leave
END

IF ~~ THEN BEGIN B5StopQuest
  SAY @3582 /* I doubt that he will. A mage of his power has learnt not to engulf himself in petty schemes of insignificant men. Come, let us continue our journey, <CHARNAME>. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelFamilyPath","GLOBAL",3)
        SetGlobal("IaSibelTalks","GLOBAL",12)
        EraseJournalEntry(@1109)~
    SOLVED_JOURNAL @1112
    EXIT
END

IF ~~ THEN BEGIN B5Leave
  SAY @3583 /* Murder one of my own? Why would you propose such a depravity! How could a <MANWOMAN> harbour such evil in one's heart, <CHARNAME>? I shan't remain in your group any longer. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelFamilyPath","GLOBAL",4)
        SetGlobal("IaSibelTalks","GLOBAL",12)
        EraseJournalEntry(@1109)
        LeaveParty()
        TakeItemListParty("S!sitems")
        EscapeArea()~
    SOLVED_JOURNAL @1113
    EXIT
END

/* sixth banter */

IF ~Global("IaSibelTalks","GLOBAL",12) Global("IaSibelAmberAmbush","GLOBAL",1)~ THEN BEGIN B6Ambush
  SAY @3584 /* <CHARNAME>, we are about to be ambushed! Prepare yourself, fast! */

  ++ @3585 /* An ambush? How would you know? */ + B6How
END

IF ~~ THEN BEGIN B6How
  SAY @3586 /* I am not sure. I could feel them getting close! Hurry! */

  IF ~~ THEN DO ~SetGlobal("IaSibelAmberAmbush","GLOBAL",2) SetGlobalTimer("IaSibelAmberTimer","GLOBAL",12)~ EXIT
END

IF ~Global("IaSibelTalks","GLOBAL",12) Global("IaSibelAmberAmbush","GLOBAL",4)~ THEN BEGIN B6Aftermath
  SAY @3587 /* Thank you, <CHARNAME>! The ancient rivalry brings more trouble still upon our heads. */

  ++ @3588 /* You are welcome. You've had your own share of fights caused by the choices I have made. */ + B6Amber
END

IF ~~ THEN BEGIN B6Amber
  SAY @3589 /* Let us keep some of the amber the golems were made of. I feel it might become useful in the future. */

  IF ~~ THEN DO ~SetGlobal("IaSibelAmberAmbush","GLOBAL",5)~ EXIT
END

/* seventh banter */

IF ~Global("IaSibelTalks","GLOBAL",12) Global("IaSibelAmberAmbush","GLOBAL",6)~ THEN BEGIN B7Ambush
  SAY @3590 /* <CHARNAME>, they are coming for us again! Steel yourself for another attack! */

  IF ~~ THEN
    REPLY @3591 /* We are ready. Let them come! */
    DO ~SetGlobal("IaSibelAmberAmbush","GLOBAL",7) SetGlobalTimer("IaSibelAmberTimer","GLOBAL",12)~
    EXIT
END

IF ~Global("IaSibelTalks","GLOBAL",12) Global("IaSibelAmberAmbush","GLOBAL",9)~ THEN BEGIN B7Aftermath
  SAY @3592 /* Their attacks grow in boldness and precision! The Ambverville family ventures to employ powerful scrying to stalk my movements. */

  IF ~Global("IaSibelFamilyPath","GLOBAL",2)~ THEN
    REPLY @3593 /* What if this is a trick played on us by Virtus Arcanis? */
    GOTO B7Neutral

  ++ @3594 /* The Ambervilles haven't divined your lack of desire to join their effort. Or else they would've brought a bigger army upon our heads. */ + B7Howard
END

IF ~~ THEN BEGIN B7Neutral
  SAY @3595 /* As I have said once, when the time comes to make the final decision, I will call upon your wisdom to guide me. */

  IF ~~ THEN DO ~SetGlobal("IaSibelAmberAmbush","GLOBAL",10)~ EXIT
END

IF ~~ THEN BEGIN B7Howard
  SAY @3596 /* Howard kept true to his word, and it means a lot to me. When the time comes, I will stand by my family. */

  IF ~~ THEN DO ~SetGlobal("IaSibelAmberAmbush","GLOBAL",10)~ EXIT
END

/* eighth banter */

IF ~Global("IaSibelTalks","GLOBAL",16)~ THEN BEGIN B8Virtus
  SAY @3597 /* The time has finally come, <CHARNAME>! The mysterious Virtus Arcanis expects us. I would appreciate if we depart to meet him at once. */

  ++ @3598 /* Of course, Sibel. We will leave shortly. */ + B8ThankYou
  ++ @3599 /* We can't drop everything and rush away immediately, Sibel! */ + B8Leave
END

IF ~~ THEN BEGIN B8ThankYou
  SAY @3600 /* Thank you, <CHARNAME>! */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelTalks","GLOBAL",17)
        SetGlobalTimer("IaSLeatherTimer","GLOBAL",28800)~
    UNSOLVED_JOURNAL @1114
    EXIT
END

IF ~Global("IaSibelTalks","GLOBAL",18)~ THEN BEGIN B8UrgeToGo
  SAY @3601 /* Why aren't we on our way to meet Virtus, <CHARNAME>? He will not wait forever. */

  ++ @3602 /* I'm sorry, Sibel. We will leave immediately. */ + B8ThankYouAgain
  ++ @3603 /* We'll depart when the time is appropriate, Sibel. */ + B8Leave
END

IF ~~ THEN BEGIN B8ThankYouAgain
  SAY @3604 /* I hope that we do. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelTalks","GLOBAL",19)
        SetGlobalTimer("IaSLeatherTimer","GLOBAL",14400)~
    EXIT
END

IF ~~ THEN BEGIN B8Leave
  SAY @3605 /* I appreciate the importance of your quest, but I must do this. I wouldn't burden you any longer, for you have troubles of your own. I will travel alone. Goodbye, <CHARNAME>. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelTalks","GLOBAL",21)
        SetGlobal("IaSVirtusArrives","GLOBAL",2)
        EraseJournalEntry(@1109)
        EraseJournalEntry(@1110)
        EraseJournalEntry(@1111)
        EraseJournalEntry(@1114)
        LeaveParty()
        TakeItemListParty("S!sitems")
        EscapeArea()~
    SOLVED_JOURNAL @1115
    EXIT
END

IF ~Global("IaSibelTalks","GLOBAL",20)~ THEN BEGIN B8LeaveForGood
  SAY @3606 /* <CHARNAME>, I dare not wait any longer. I will travel to meet Virtus alone. Goodbye and good luck in your travels. */

  IF ~~ THEN
    DO ~SetGlobal("IaSibelTalks","GLOBAL",21)
        SetGlobal("IaSVirtusArrives","GLOBAL",2)
        EraseJournalEntry(@1109)
        EraseJournalEntry(@1110)
        EraseJournalEntry(@1111)
        EraseJournalEntry(@1114)
        LeaveParty()
        TakeItemListParty("S!sitems")
        EscapeArea()~
    SOLVED_JOURNAL @1115
    EXIT
END

/* 10th banter/event */

IF ~Global("IaSRegiPlot","GLOBAL",4)~ THEN BEGIN B10Start
  SAY @3607 /* The ghost has just appeared and called us forth, hasn't it, <CHARNAME>? Or have I begun to hear phantoms? */

  ++ @3608 /* I've heard it too. */ + B10WhatIsIt
END

IF ~~ THEN BEGIN B10WhatIsIt
  SAY @3609 /* Do we proceed to explore the sewers and discover the source of this intrusion? */

  ++ @3610 /* Someone might seek to ensnare us. If we proceed, we should do so with caution. */ + B10YouDecide
  ++ @3611 /* I smell a trap. We shouldn't rush headlong into it. */ + B10YouDecide
END

IF ~~ THEN BEGIN B10YouDecide
  SAY @3612 /* I shall leave the decision to you, <CHARNAME>. */

  IF ~~ THEN DO ~SetGlobal("IaSRegiPlot","GLOBAL",5)~ EXIT
END

/* 12th event */

IF ~Global("IaAndriasPlot","GLOBAL",2)~ THEN BEGIN B12Start
  SAY @3613 /* That was an odd man. He talked as if he was not aware that the amber is bought and sold in chunks. Have you noticed? */

  ++ @3614 /* Yes, he did seem intentionally vague. */ + B12End
  ++ @3615 /* Perhaps. What are you implying? */ + B12End
END

IF ~~ THEN BEGIN B12End
  SAY @3616 /* It is amber golems that we may find down in the sewers, not a stockpile of pure amber. */

  IF ~~ THEN
    REPLY @3617 /* We shall see soon enough. */
    DO ~SetGlobalTimer("IaSLeather2Timer","GLOBAL",3) SetGlobal("IaAndriasPlot","GLOBAL",3)~
    EXIT
END

IF ~Global("IaAndriasPlot","GLOBAL",8)~ THEN BEGIN B12Fight
  SAY @3618 /* These are Greater Amber Golems, <CHARNAME>! We fought one of these creatures in Amberville House! And the liches are fighting on their side. Could we handle such a group of foes? */

  ++ @3619 /* Steel yourself, Sibel! We've handled worse, let them come. */ + B12Attack
  ++ @3620 /* The situation may become dire. We should seek aid. */ + B12Help
END

IF ~~ THEN BEGIN B12Attack
  SAY @3621 /* They shall taste our wrath! */

  IF ~~ THEN DO ~SetGlobal("IaFightBegins","AR0404",1)~ EXIT
END

IF ~~ THEN BEGIN B12Help
  SAY @3622 /* So shall it be. I ask Virtus Arcanis to aid us! */

  IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("S!scut15")~ EXIT
END