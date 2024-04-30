BEGIN ~S!SLEAT5~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Start
  SAY @3010 /* Greetings, Sibel! Master sends his regrets that he may not stand by your side for reasons beyond his control. */
  = @3011 /* It is my Master's wish that you accept my aid in battle against the Rakshasa deity. */

  IF ~~ THEN EXIT
END