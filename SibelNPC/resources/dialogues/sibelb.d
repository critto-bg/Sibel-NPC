BEGIN ~S!SibelB~

/* first banter */

IF ~Global("IaSibelTalks","GLOBAL",2)~ THEN BEGIN B1SibelQuestion
  SAY ~Tell me <CHARNAME>, what is the difference between intelligence and wisdom?~
  ++ ~Good question! I am all ears to listen to your own answer.~ + B1SibelAnswer
  ++ ~I have an answer to give, but I'd like to hear yours first.~ + B1SibelAnswer
END

IF ~~ THEN BEGIN B1SibelAnswer
  SAY ~If we compare our mind to a machine, intelligence is the apparatus, while wisdom is the skill to run it for the right purpose.~
  ++ ~In other words, intelligence is wit, whereas wisdom is utilizing the wit.~ + B1Clarification
END

IF ~~ THEN BEGIN B1Clarification
  SAY ~Exactly! That is why you sometimes see intelligent people who believe in absurd superstitions. They can solve complex math puzzles, but are unable to see that their fundamental beliefs about the world are misguided.~
  ++ ~I couldn't agree more.~ + B1ThankYou
  ++ ~Maybe we can say that wisdom relates more to philosophy, while intelligence is more about the capacity of calculation and utilizing the memory.~ + B1Glad
END

IF ~~ THEN BEGIN B1ThankYou
  SAY ~Thank you very much, <CHARNAME>!~
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN B1Glad
  SAY ~I am glad to see that we two think so much alike.~
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",3)~ EXIT
END

/* second banter */

IF ~Global("IaSibelTalks","GLOBAL",5)~ THEN BEGIN B2SibelQuestion
  SAY ~Have I told you about Virtus Arcanis, <CHARNAME>?~
  ++ ~No you have not, but I'm curious to hear.~ + B2WhoIsVirtus
END

IF ~~ THEN BEGIN B2WhoIsVirtus
  SAY ~He was a son of a grandson of Lord Tristan's, whom we've met in the ancient Arcanis village.~
  ++ ~He was three generations younger than Lord Arcanis?~ + B2Still
  ++ ~Was he also one of your ancestors?~ + B2Lineage
END

IF ~~ THEN BEGIN B2Still
  SAY ~Yes. Still quite a good number of generations older than my father.~
  ++ ~Was he also one of your ancestors?~ + B2Lineage
END

IF ~~ THEN BEGIN B2Lineage
  SAY ~No, my family lineage goes back to one of his father's cousins, another grandson of Lord Tristan.~
  ++ ~Go on.~ + B2MoreLineage
END

IF ~~ THEN BEGIN B2MoreLineage
  SAY ~Some say that the father of Virtus was a very attractive man. In his younger years, he succeded to win Mnemosyne's affection and married her... well... in a way. Virtus is their son.~
  ++ ~Who is Mnemosyne?~ + B2Mnemosyne
  ++ ~I recall reading the old books of lore about Mnemosyne.~ + B2Mnemosyne
END

IF ~~ THEN BEGIN B2Mnemosyne
  SAY ~Mnemosyne is the titaness and goddess of memory, a daughter of Uranus and Gaea.~
  ++ ~Go on.~ + B2More
  ++ ~Virtus was a demigod then?~ + B2More
END

IF ~~ THEN BEGIN B2More
  SAY ~My father had a theory that Virtus inherited a limited type of immortality from his mother. The onset of age and passage of time hold no power over him, yet he can be slain in battle, still.~
  ++ ~How could your father possibly know this?~ + B2How
END

IF ~~ THEN BEGIN B2How
  SAY ~I am uncertain. Maybe it was just a theory? Perhaps, he had found a scroll about Virtus in our family's old library.~
  = ~Father claimed that Virtus had left the family village when he was a child to pursue education under the tutelage of his mother.~
  ++ ~Who was the goddess of memory.~ + B2End
END

IF ~~ THEN BEGIN B2End
  SAY ~Yes, father believed Virtus to be a mage of immense power, his capacity to recite and weave magic surpassing that of mere mortal mages.~
  = ~According to father, a day will come when our enemies will strike with all their might, seeking retribution for perceived wrongs. On that day, Virtus Arcanis will return and aid us.~
  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",6)~ EXIT
END

/* third banter */

IF ~Global("IaSibelClericTalk","GLOBAL",2)~ THEN BEGIN B3OnYourMind
  SAY ~You seem preoccupied, <CHARNAME>? Is there something on your mind?~
  ++ ~Yes, actually. I've had a question to ask of you for a time now.~ + B3Question
END

IF ~~ THEN BEGIN B3Question
  SAY ~Go ahead.~
  ++ ~As a priest, which god do you worship?~ + B3WhichGod
END

IF ~~ THEN BEGIN B3WhichGod
  SAY ~None! I don't worship any god.~
  IF ~~ THEN REPLY ~What is the source of your magic, then?~ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
  IF ~~ THEN REPLY ~What do you think of the gods, Sibel?~ DO ~SetGlobal("IaB3Kids","LOCALS",1)~ GOTO B3Kids
END

IF ~~ THEN BEGIN B3Wisdom
  SAY ~My magic flows from my wisdom, not from any god.~
  ++ ~Is it the same for other clerics?~ + B3Clerics
END

IF ~~ THEN BEGIN B3Clerics
  SAY ~Perhaps, for the most of them, even if they are not aware of it. They pray to their gods to fuel their magic, and the gods are pleased with the notion.~
  IF ~Global("IaB3Kids","LOCALS",0)~ THEN REPLY ~What do you think of the gods, Sibel?~ DO ~SetGlobal("IaB3Kids","LOCALS",1)~ GOTO B3Kids
  ++ ~Lord Tristan was right to call you wise.~ + B3Wise
END

IF ~~ THEN BEGIN B3Kids
  SAY ~Gods are just big kids who never grew up. They love to play and they want to be pleased.~
  ++ ~If you mean "powerful" when you say "big", then I couldn't agree more.~ + B3Power
END

IF ~~ THEN BEGIN B3Power
  SAY ~They are powerful, but have we ever knelt down in front of power?~
  ++ ~No, we haven't. Mere power is not a reason enough to be respected, let alone worshipped.~ + B3Exactly
  IF ~Global("IaB3Wisdom","LOCALS",0)~ THEN REPLY ~Where does you magic come from, then?~ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
END

IF ~~ THEN BEGIN B3Exactly
  SAY ~'Tis true!~
  IF ~Global("IaB3Wisdom","LOCALS",0)~ THEN REPLY ~What is the source of your magic, then?~ DO ~SetGlobal("IaB3Wisdom","LOCALS",1)~ GOTO B3Wisdom
  ++ ~Lord Tristan was right to call you wise.~ + B3Wise
END

IF ~~ THEN BEGIN B3Wise
  SAY ~Thank you, <CHARNAME>! I am glad we are of the same mind.~

  IF ~~ THEN DO ~SetGlobal("IaSibelClericTalk","GLOBAL",3)~ EXIT
END

/* fourth banter */

IF ~Global("IaSibelTalks","GLOBAL",8)~ THEN BEGIN B4Letter
  SAY ~The letter the boy gave me is signed by Lawrence Amberville.~

  ++ ~That is odd. Lord Lawrence still lives?~ + B4Signature
  ++ ~What does it say?~ + B4Says
END

IF ~~ THEN BEGIN B4Signature
  SAY ~I wondered the same once I saw the signature.~

  ++ ~What does it say?~ + B4Says
END

IF ~~ THEN BEGIN B4Says
  SAY ~He states that I am of Amberville heritage, through my mother's line. The amulet should serve as proof, for only a member of Amberville family may wear it, or so he claims.~

  IF ~Global("IaB4Judge","LOCALS",0)~ THEN
    REPLY ~Does this mean your father hid the truth from you?~
    DO ~SetGlobal("IaB4Judge","LOCALS",1)~
    GOTO B4Judge

  IF ~Global("IaB4Amulet","LOCALS",0)~ THEN
    REPLY ~The whole story could be a fabrication.~
    DO ~SetGlobal("IaB4Amulet","LOCALS",1)~
    GOTO B4Amulet

  IF ~Global("IaB4Mother","LOCALS",0)~ THEN
    REPLY ~How much do you know about your mother?~
    DO ~SetGlobal("IaB4Mother","LOCALS",1)~
    GOTO B4Mother
END

IF ~~ THEN BEGIN B4Judge
  SAY ~Who am I to judge what my father chose to tell me or not? Children are in no position to make such judgement, for they lack complete knowledge of all that transpired between their parents.~

  IF ~Global("IaB4Amulet","LOCALS",0)~ THEN
    REPLY ~The whole story could be a fabrication.~
    DO ~SetGlobal("IaB4Amulet","LOCALS",1)~
    GOTO B4Amulet

  ++ ~What if this claim proves to be truth? What will you do?~ + B4Time

  IF ~Global("IaB4Mother","LOCALS",0)~ THEN
    REPLY ~How much do you know about your mother?~
    DO ~SetGlobal("IaB4Mother","LOCALS",1)~
    GOTO B4Mother
END

IF ~~ THEN BEGIN B4Amulet
  SAY ~I have no choice but to try the amulet.~

  ++ ~The amulet alone is not evidence enough to discern the truth.~ + B4Time

  IF ~Global("IaB4Judge","LOCALS",0)~ THEN
    REPLY ~Does this mean your father hid the truth from you?~
    DO ~SetGlobal("IaB4Judge","LOCALS",1)~
    GOTO B4Judge

  IF ~Global("IaB4Mother","LOCALS",0)~ THEN
    REPLY ~How much do you know about your mother?~
    DO ~SetGlobal("IaB4Mother","LOCALS",1)~
    GOTO B4Mother
END

IF ~~ THEN BEGIN B4Mother
  SAY ~Precious little. She passed away when I was an infant. Father told little of her, but when he did, he always spoke of good things.~

  IF ~Global("IaB4Amulet","LOCALS",0)~ THEN
    REPLY ~The whole story could be a fabrication.~
    DO ~SetGlobal("IaB4Amulet","LOCALS",1)~
    GOTO B4Amulet

  ++ ~What if this claim proves to be truth? What will you do?~ + B4Time
END

IF ~~ THEN BEGIN B4Time
  SAY ~I am unsure. I need time to weigh this story in my mind.~

  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",9)~ UNSOLVED_JOURNAL @1109 EXIT
END

/* fifth banter */

IF ~Global("IaSibelTalks","GLOBAL",11)~ THEN BEGIN B5Advice
  SAY ~I am in need of your advice, <CHARNAME>!~

  ++ ~I am listening. What troubles you?~ + B5Suggest
END

IF ~~ THEN BEGIN B5Suggest
  SAY ~I still ponder the dilemma of my heritage. What course of action would you choose, were you in my stead?~

  ++ ~Your father has concealed the full truth. You should explore what your mother's kin may offer.~ + B5Hid
  ++ ~There's naught more important than family. You still remain Sibel Arcanis. You should stand by your folk.~ + B5Lineage

  IF ~GlobalGT("IaSGiftPlace","GLOBAL",0) Global("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY ~You have a family that cares for you. Lord Tristan put trust in your wisdom. Howard chose to make a gift, even unsure if it would ever reach you.~
    GOTO B5Good

  IF ~OR(2) Global("IaSGiftPlace","GLOBAL",0) GlobalLT("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY ~Those of Arcanis blood have treated us with kindness. The Amberville family unleashed only violence, and promises of yet more to come.~
    GOTO B5Good

  ++ ~Blood of both families courses through your veins. The choice is yours to make, and I will stand by you.~ + B5Neutral
  ++ ~What of the amulet? Does it confirm what Lord Amberville claims?~ + B5Examined
END

IF ~~ THEN BEGIN B5Hid
  SAY ~There may be a strong reason for my father's reticence.~

  ++ ~You seek words that would absolve your father of his weakness. It only steers you toward the same path he's trodden.~ + B5Evil
  ++ ~Blood of both families courses through your veins. The choice is yours to make, and I will stand by you.~ + B5Neutral
END

IF ~~ THEN BEGIN B5Lineage
  SAY ~Wiser words have not been spoken. Yet I am both an Amberville and an Arcanis. There's a choice to be made who are my true folk. Until I do, there won't be a resolution.~
  ++ ~What of the amulet? Does it confirm what Lord Amberville claims?~ + B5Examined
END

IF ~~ THEN BEGIN B5Examined
  SAY ~I have studied the binding magic stored within, and it rings true. The necklace does not reject me. So there's honesty in lord Amberville's claim.~

  ++ ~Take caution. The Ambervilles may still harbour hate toward your mother. And now they call forth her name, seeking to win your allegiance. To what end?~ + B5Agree
  ++ ~Your father has concealed the full truth. You should explore what your mother's kin may offer.~ + B5Evil
  ++ ~Blood of both families courses through your veins. The choice is yours to make, and I will stand by you.~ + B5Neutral
END

IF ~~ THEN BEGIN B5Agree
  SAY ~I take your words close to heart. There's little proof yet to abandon those I hold dear.~

  IF ~GlobalGT("IaSGiftPlace","GLOBAL",0) Global("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY ~You have a family that cares for you. Lord Tristan put trust in your wisdom. Howard chose to make a gift, even unsure if it would ever reach you.~
    GOTO B5Good

  IF ~OR(2) Global("IaSGiftPlace","GLOBAL",0) GlobalLT("IaAmbervillePlot","GLOBAL",7)~ THEN
    REPLY ~Those of Arcanis blood have treated us with kindness. The Amberville family unleashed only violence, and promises of yet more to come.~
    GOTO B5Good
END

IF ~~ THEN BEGIN B5Good
  SAY ~You words strengthen my resolve, <CHARNAME>. The Arcanis folk are the only true family I have ever known. I will stand by them, whatever may come.~

  IF ~~ THEN
    DO ~SetGlobal("IaSibelFamilyPath","GLOBAL",1)
        SetGlobal("IaSibelTalks","GLOBAL",12)
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
  SAY ~Thank you, <CHARNAME>. I treasure your loyalty. When the time comes to make the final decision, I might call upon your wisdom once more.~

  IF ~~ THEN
    DO ~SetGlobal("IaSibelFamilyPath","GLOBAL",2)
        SetGlobal("IaSibelTalks","GLOBAL",12)~
    UNSOLVED_JOURNAL @1111
    EXIT
END

IF ~~ THEN BEGIN B5Evil
  SAY ~What would you propose, then?~

  ++ ~If Virtus Arcanis still lives and comes to you, refuse his offer.~ + B5StopQuest
  ++ ~Cast off the shackles of your past. If Virtus Arcanis reveals himself, you should dispose of him and be done with Arcanis family.~ + B5Leave
END

IF ~~ THEN BEGIN B5StopQuest
  SAY ~I doubt that he will. A mage of his power has learnt not to engulf himself in petty schemes of insignificant men. Come, let us continue our journey, <CHARNAME>.~

  IF ~~ THEN
    DO ~SetGlobal("IaSibelFamilyPath","GLOBAL",3)
        SetGlobal("IaSibelTalks","GLOBAL",12)
        EraseJournalEntry(@1109)~
    SOLVED_JOURNAL @1112
    EXIT
END

IF ~~ THEN BEGIN B5Leave
  SAY ~Murder one of my own? Why would you propose such a depravity! How could a <MANWOMAN> harbour such evil in one's heart, <CHARNAME>? I shan't remain in your group any longer.~

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

IF ~Global("IaSibelTalks","GLOBAL",13)~ THEN BEGIN B6Ambush
  SAY ~<CHARNAME>, we are about to be ambushed! Prepare yourself, fast!~

  ++ ~An ambush? How would you know?~ + B6How
END

IF ~~ THEN BEGIN B6How
  SAY ~I am not sure. I could feel them getting close! Hurry!~

  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",14) SetGlobalTimer("IaSibelAmberTimer","GLOBAL",12)~ EXIT
END

IF ~Global("IaSibelTalks","GLOBAL",15)~ THEN BEGIN B6Aftermath
  SAY ~Thank you, <CHARNAME>! The ancient rivalry brings more trouble still upon our heads.~

  ++ ~You are welcome. You've had your own share of fights caused by the choices I have made.~ + B6Amber
END

IF ~~ THEN BEGIN B6Amber
  SAY ~Let us keep some of the amber the golems were made of. I feel it might become useful in the future.~

  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",16)~ EXIT
END

/* seventh banter */

IF ~Global("IaSibelTalks","GLOBAL",17)~ THEN BEGIN B7Ambush
  SAY ~<CHARNAME>, they are coming for us again! Steel yourself for another attack!~

  IF ~~ THEN
    REPLY ~We are ready. Let them come!~
    DO ~SetGlobal("IaSibelTalks","GLOBAL",18) SetGlobalTimer("IaSibelAmberTimer","GLOBAL",12)~
    EXIT
END

IF ~Global("IaSibelTalks","GLOBAL",19)~ THEN BEGIN B7Aftermath
  SAY ~Their attacks grow in boldness and precision! The Ambverville family ventures to employ powerful scrying to stalk my movements.~

  IF ~Global("IaSibelFamilyPath","GLOBAL",2)~ THEN
    REPLY ~What if this is a trick played on us by Virtus Arcanis?~
    GOTO B7Neutral

  ++ ~The Ambervilles haven't divined your lack of desire to join their effort. Or else they would've brought a bigger army upon our heads.~ + B7Howard
END

IF ~~ THEN BEGIN B7Neutral
  SAY ~As I have said once, when the time comes to make the final decision, I will call upon your wisdom to guide me.~

  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",20)~ EXIT
END

IF ~~ THEN BEGIN B7Howard
  SAY ~Howard kept true to his word, and it means a lot to me. When the time comes, I will stand by my family.~

  IF ~~ THEN DO ~SetGlobal("IaSibelTalks","GLOBAL",20)~ EXIT
END
