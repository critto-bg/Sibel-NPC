REPLACE ~IASPY4~
  IF ~~ THEN BEGIN 27
    SAY @4794
    IF ~!GlobalTimerNotExpired("Iarecastskel","GLOBAL")~ THEN REPLY @4795 GOTO 33
    IF ~!GlobalTimerNotExpired("Iarecastrest","GLOBAL")~ THEN REPLY @4799 GOTO 37
    IF ~~ THEN REPLY @4797 GOTO 35
    IF ~~ THEN REPLY @4785 GOTO 19
    IF ~~ THEN REPLY @4786 GOTO 20
    IF ~~ THEN REPLY @4787 GOTO 21
    IF ~~ THEN REPLY @4788 GOTO 22
    IF ~~ THEN REPLY @4789 GOTO 23
    IF ~~ THEN REPLY @4790 GOTO 24
  END

  IF ~~ THEN BEGIN 29
    SAY @4794
    IF ~~ THEN REPLY @4796 GOTO 34
    IF ~~ THEN REPLY @4797 GOTO 35
    IF ~~ THEN REPLY @4785 GOTO 19
    IF ~~ THEN REPLY @4786 GOTO 20
    IF ~~ THEN REPLY @4787 GOTO 21
    IF ~~ THEN REPLY @4788 GOTO 22
    IF ~~ THEN REPLY @4789 GOTO 23
    IF ~~ THEN REPLY @4790 GOTO 24
  END

  IF ~~ THEN BEGIN 31
    SAY @4794
    IF ~~ THEN REPLY @4797 GOTO 35
    IF ~~ THEN REPLY @4798 GOTO 36
    IF ~~ THEN REPLY @4785 GOTO 19
    IF ~~ THEN REPLY @4786 GOTO 20
    IF ~~ THEN REPLY @4787 GOTO 21
    IF ~~ THEN REPLY @4788 GOTO 22
    IF ~~ THEN REPLY @4789 GOTO 23
    IF ~~ THEN REPLY @4790 GOTO 24
  END

  IF ~~ THEN BEGIN 32
    SAY @4794
    IF ~!GlobalTimerNotExpired("Iarecastskel","GLOBAL")~ THEN REPLY @4795 GOTO 33
    IF ~!GlobalTimerNotExpired("Iarecastrest","GLOBAL")~ THEN REPLY @4799 GOTO 37
    IF ~~ THEN REPLY @4796 GOTO 34
    IF ~~ THEN REPLY @4797 GOTO 35
    IF ~~ THEN REPLY @4798 GOTO 36
    IF ~~ THEN REPLY @4785 GOTO 19
    IF ~~ THEN REPLY @4786 GOTO 20
    IF ~~ THEN REPLY @4787 GOTO 21
    IF ~~ THEN REPLY @4788 GOTO 22
    IF ~~ THEN REPLY @4789 GOTO 23
    IF ~~ THEN REPLY @4790 GOTO 24
  END
END