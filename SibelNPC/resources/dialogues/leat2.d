APPEND ~S!SibelJ~
  IF ~~ THEN BEGIN GreetsLeatherGolemAgain
    SAY ~Well, hello again, friendly golem!~

    IF ~~ THEN EXTERN ~S!SLEAT2~ Trap
  END
END

BEGIN ~S!SLEAT2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Start
  SAY ~Greetings, Sibel. And <CHARNAME>.~

  IF ~~ THEN EXTERN ~S!SibelJ~ GreetsLeatherGolemAgain
END

IF ~~ THEN BEGIN Trap
  SAY ~The merchant man seeks to lure you into a trap, a grand one! Yet it is the opinion of my Master that you should be the one to face the challenge.~
  = ~For it is through endurance that you become ready for the upcoming confrontation with the Ambervilles.~

  ++ ~What is the nature of this trap, golem?~ + WhatTrap
END

IF ~~ THEN BEGIN WhatTrap
  SAY ~That is an unknown. Master may choose to interfere, yet it is his preference that you seek the resolution.~
  = ~Shall you find yourself in dire straits, pronounce the need for the Master's assistance, and he shall come.~
  = ~It is the will of the Master that I share one piece of knowledge with you.~

  ++ ~I am listening.~ + Knowledge
END

IF ~~ THEN BEGIN Knowledge
  SAY ~A magical barrier envelops the area you are about to enter. Waste no time on arcane protections, for they will cease their existence when you set foot into the trap.~
  = ~Master wishes you luck. Farewell.~

  IF ~~ THEN DO ~SetGlobal("IaAndriasPlot","GLOBAL",5)~ EXIT
END
