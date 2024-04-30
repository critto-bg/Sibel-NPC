APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN GreetsLeatherGolemAgain
    SAY @2950 /* Well, hello again, friendly golem! */

    IF ~~ THEN EXTERN ~S!SLEAT2~ Trap
  END
END

BEGIN ~S!SLEAT2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Start
  SAY @2951 /* Greetings, Sibel. And <CHARNAME>. */

  IF ~~ THEN EXTERN ~S!SibelJ~ GreetsLeatherGolemAgain
END

IF ~~ THEN BEGIN Trap
  SAY @2952 /* The merchant man seeks to lure you into a trap, a grand one! Yet it is the opinion of my Master that you should be the one to face the challenge. */
  = @2953 /* For it is through endurance that you become ready for the upcoming confrontation with the Ambervilles. */

  ++ @2954 /* What is the nature of this trap, golem? */ + WhatTrap
END

IF ~~ THEN BEGIN WhatTrap
  SAY @2955 /* That is an unknown. Master may choose to interfere, yet it is his preference that you seek the resolution. */
  = @2956 /* Shall you find yourself in dire straits, pronounce the need for the Master's assistance, and he shall come. */
  = @2957 /* It is the will of the Master that I share one piece of knowledge with you. */

  ++ @2958 /* I am listening. */ + Knowledge
END

IF ~~ THEN BEGIN Knowledge
  SAY @2959 /* A magical barrier envelops the area you are about to enter. Waste no time on arcane protections, for they will cease their existence when you set foot into the trap. */
  = @2960 /* Master wishes you luck. Farewell. */

  IF ~~ THEN DO ~SetGlobal("IaAndriasPlot","GLOBAL",5)~ EXIT
END
