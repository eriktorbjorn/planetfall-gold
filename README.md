# Infocom's Planetfall, modernized

Planetfall is a 1983 interactive fiction game written by Steve Meretzky and published by Infocom.

__What is this Repository?__

This repository is a modification of the original Planetfall source code, with the goal to make it more playable by a modern audience with some minor tweaks and all known bugs fixed.

__Overview of Changes__

CLASSIC (default) allows the player to take advantage of the bug fixes while still playing the game as it was intended.

MODERN (type MODERN at the prompt) allows the player to enjoy the game without having to worry about unfair deaths or hunger.

* addition of CLASSIC and MODERN pseudo-verbs
* bug fixes
* spelling corrections
* removal of need to eat for MODERN mode
* removal of some egregious deaths in MODERN mode
* removal of "walking deads" in MODERN mode (in progress)

__Bugs fixed__

* fixed sexlessness of ambassador and Blather when being shot (Cree #6)
* fixed switched off Floyd responding to things (Cree #7, Simpson #36)
* fixed behavior of water level as the days progress (Cree #8)
* prevented the pod from being opened from the webbing (Cree #9)
* prevented the player from falling asleep while some interrupts are running (Cree #10)
* fixed diary interfering with the elevator controls (Simpson #24)
* fixed "You're not holding the flask" when non-flask under spout (Simpson #25)
* fixed wearing uniform in carried container (Simpson #26)
* fixed some THROW/DROP HANDS bugs (Simpson #27)
* fixed DROP/THROW LITTLE BUTTON (gave button and dial PARTBIT) (Simpson #28)
* fixed PUT DIAL/LITTLE BUTTON UNDER SPOUT (Simpson #28)
* fixed GIVE LITTLE BUTTON TO FLOYD
* fixed DROP/THROW dial, goo and liquids (Simpson #28, #29, #30)
* fixed GIVE DIAL/GOO/FLUID/MEDICINE TO FLOYD (Simpson #28, #33)
* fixed EMPTY/SHAKE BOTTLE (Simpson #31)
* fixed medicine bottle bugs by making only the medicine fit inside (Simpson #32)
* fixed FLOYD, PRESS RED followed by FLOYD, PRESS RED BUTTON (Simpson #34)
* prevented kitchen door from being manually closed (Simpson #35)
* fixed Floyd leaving closed rooms when seeing the breastplate (Simpson #37)
* fixed Floyd entering lab when not there (Simpson #37)
* Floyd reacts appropriately to SHOW PLATE TO FLOYD (Simpson #38)
* fixed dreaming of Floyd before meeting him (Simpson #39)
* fixed EMPTY X INTO Y (Simpson #40)
* fixed confusion with UNLOCK DOOR when padlock removed (Simpson #41)
* fixed error message when showing something to inanimate object (Simpson #42)
* fixed spool is/isn't on bed confusion (Simpson #43)
* fixed new battery having OBJECT adjective (Simpson #44)
* removed UPPER adjective from the blue door so that SLIDE UPPER THROUGH SLOT works

__To do list__

* some more CLASSIC/MODERN modifications...?

Where appropriate, bugs taken from
* Graham Cree's list http://graeme.50webs.com/infobugs/planetfa.htm
* Nathan Simpson's list http://www.microheaven.com/InfocomBugs/planetfa.shtml
