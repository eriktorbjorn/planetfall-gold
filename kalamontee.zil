"KALAMONTEE for PLANETFALL 
(C) COPYRIGHT 1983 INFOCOM, INC. ALL RIGHTS RESERVED

This file contains all the rooms, objects, and actions associated
with Complex One / the Western Complex / the Kalamontee Compleks."

<ROOM UNDERWATER
      (LOC ROOMS)
      (DESC "Underwater")
      (LDESC
"You are momentarily disoriented as you enter the turbulent waters.
Currents buffet you against the sharp rocks of an underwater
cliff. A dim light filters down from above.")
      (UP PER UNDERWATER-UP-F)
      (DOWN TO UNDERWATER)
      (EAST TO UNDERWATER)
      (WEST TO UNDERWATER)
      (NORTH TO UNDERWATER)
      (SOUTH TO UNDERWATER)
      (FLAGS ONBIT RWATERBIT)
      (ACTION UNDERWATER-F)>

<GLOBAL DROWN 0> ;"you die if you return to Underwater or stay too long"

<ROUTINE UNDERWATER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-END>
		<SETG DROWN <+ ,DROWN 1>>
		<COND (<G? ,DROWN 2>
		       <JIGS-UP
"A mighty undertow drags you across some underwater obstructions.">)>)>>

<ROUTINE UNDERWATER-UP-F ()
	 <COND (,MODERN 
		 <SETG DROWN 0>
		 <COND (<L? ,DAY 2> ,CRAG)
			   (<L? ,DAY 4> ,BALCONY)
			   (<L? ,DAY 6> ,WINDING-STAIR)
			   (T ,COURTYARD)>)
			(T ,CRAG)>>

<ROOM CRAG
      (LOC ROOMS)
      (DESC "Crag")
      (LDESC
"You have reached a cleft in the cliff wall where the island rises from the
water. The edge of the cleft displays recently exposed rock where it collapsed
under the weight of the escape pod. About two meters below, turbulent waters
swirl against sharp rocks. A small structure clings to the face of the cliff
about eight meters above you. Even an out-of-shape Ensign Seventh Class could
probably climb up to it.")
      (DOWN TO UNDERWATER)
      (UP TO BALCONY)
      (FLAGS ONBIT RLANDBIT)
      (VALUE 3)
      (GLOBAL CLIFF OCEAN)
      (PSEUDO "STRUCTURE" STRUCTURE-PSEUDO "CLEFT" CLEFT-PSEUDO)
      (ACTION CRAG-F)>

<ROUTINE CRAG-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<SETG DROWN 3>)>>

<ROOM BALCONY
      (LOC ROOMS)
      (DESC "Balcony")
      (DOWN PER WATER-LEVEL-F)
      (UP TO WINDING-STAIR)
      (FLAGS ONBIT RLANDBIT)
      (PSEUDO "PLAQUE" PLAQUE-PSEUDO)
      (GLOBAL CLIFF OCEAN STAIRS WINDOW)
      (ACTION BALCONY-F)>

<ROUTINE BALCONY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is an octagonal room, half carved into and half built out from the cliff
wall. Through the shattered windows which ring the outer wall you can see
ocean to the horizon. A weathered metal plaque with barely readable lettering
rests below the windows. The language seems to be a corrupt form of
Galalingua. A steep stairway, roughly cut into the face of the cliff, leads
upward.">
		<COND (<EQUAL? ,DAY 1>
		       <TELL " A rocky crag can be seen about eight meters below." CR>)
		      (<EQUAL? ,DAY 2>
		       <TELL " The ocean waters swirl below. The crag where you landed yesterday is now underwater!" CR>)
		      (<G? ,DAY 2>
		       <TELL " Ocean waters are lapping at the base of the balcony." CR>)>)>>

<ROOM WINDING-STAIR
      (LOC ROOMS)
      (DESC "Winding Stair")
      (DOWN PER WATER-LEVEL-F)
      (UP TO COURTYARD)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL CLIFF STAIRS)
      (ACTION WINDING-STAIR-F)>

<ROUTINE WINDING-STAIR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "The middle of a long, steep stairway carved into the face of a cliff.">
		<COND (<EQUAL? ,DAY 4> <TELL " You hear the lapping of water from below.">)
		      (<G? ,DAY 4> <TELL " You can see ocean water splashing against the steps below you.">)>
		<CRLF>)>>

<ROOM COURTYARD
      (LOC ROOMS)
      (DESC "Courtyard")
      (DOWN TO WINDING-STAIR)
      (SOUTH TO WINDING-STAIR)
      (WEST TO WEST-WING)
      (NORTH TO  PLAIN-HALL)
      (FLAGS ONBIT RLANDBIT FLOYDBIT)
      (GLOBAL STAIRS)
      (PSEUDO "CASTLE" CASTLE-PSEUDO "RUBBLE" RUBBLE-PSEUDO)
      (ACTION COURTYARD-F)>

<ROUTINE COURTYARD-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in the courtyard of an ancient stone edifice, vaguely reminiscent of
the castles you saw during your leave on Ramos Two. It has decayed to
the point where it can probably be termed a ruin. Openings lead north and west,
and a stairway downward is visible to the south.">
		<COND (<EQUAL? ,DAY 6 7>
		       <TELL " From the direction of the stairway comes the sound of ocean surf.">)
		      (<EQUAL? ,DAY 8>
		       <TELL " Ocean water washes against the top few steps.">)>
		<CRLF>)>>

<ROUTINE WATER-LEVEL-F ()
	 <COND (<EQUAL? ,HERE ,BALCONY>       <COND (<L? ,DAY 2> ,CRAG) (T ,UNDERWATER)>)
	       (<EQUAL? ,HERE ,WINDING-STAIR> <COND (<L? ,DAY 4> ,BALCONY) (T ,UNDERWATER)>)
	       (<EQUAL? ,HERE ,COURTYARD>     <COND (<L? ,DAY 6> ,WINDING-STAIR) (T ,UNDERWATER)>)>>

<ROOM WEST-WING
      (LOC ROOMS)
      (DESC "West Wing")
      (LDESC
"This was once the west wing of the castle, but the walls are now mostly
rubble, allowing a view of the cliff and ocean below. Rubble blocks all exits
save one, eastward to the courtyard.")
      (EAST TO COURTYARD)
      (DOWN SORRY "Certain death.")
      (FLAGS ONBIT RLANDBIT FLOYDBIT)
      (GLOBAL CLIFF OCEAN)
      (PSEUDO "CASTLE" CASTLE-PSEUDO "RUBBLE" RUBBLE-PSEUDO)>

<ROOM PLAIN-HALL
      (LOC ROOMS)
      (DESC "Plain Hall")
      (LDESC
"This is a featureless hall leading north and south. Although the hallway is
old and dusty, the construction is of a much more modern style than the
castle to the south. A similar hall branches off to the northeast.")
      (SOUTH TO COURTYARD)
      (NORTH TO REC-AREA)
      (NE TO REC-CORRIDOR)
      (FLAGS ONBIT RLANDBIT)>

<ROOM REC-AREA
      (LOC ROOMS)
      (DESC "Rec Area")
      (NORTH TO CONFERENCE-ROOM IF CONFERENCE-DOOR IS OPEN)
      (SOUTH TO PLAIN-HALL)
      (EAST TO REC-CORRIDOR)
      (FLAGS ONBIT RLANDBIT FLOYDBIT)
      (GLOBAL CONFERENCE-DOOR)
      (PSEUDO "GAMES" GAMES-PSEUDO "TAPES" TAPES-PSEUDO)
      (ACTION REC-AREA-F)>

<GLOBAL DIAL-NUMBER 0>

<GLOBAL NUMBER-NEEDED 0>

<ROUTINE REC-AREA-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a recreational facility of some sort. Games and tapes are scattered
about the room. Hallways head off to the east and south, and to the north is
a door which is ">
		<COND (<FSET? ,CONFERENCE-DOOR ,OPENBIT>
		       <TELL "open">)
		      (T
		       <TELL
"closed and locked. A dial on the door is currently set to "
N ,DIAL-NUMBER>)>
		<TELL "." CR>)>>

<ROOM CONFERENCE-ROOM
      (LOC ROOMS)
      (DESC "Conference Room")
      (SOUTH TO REC-AREA IF CONFERENCE-DOOR IS OPEN)
      (OUT TO REC-AREA IF CONFERENCE-DOOR IS OPEN)
      (IN TO BOOTH-1)
      (NORTH TO BOOTH-1)
      (FLAGS RLANDBIT ONBIT)
      (PSEUDO "BOOTH" NEAR-BOOTH-PSEUDO)
      (GLOBAL CONFERENCE-DOOR TABLES)
      (ACTION CONFERENCE-ROOM-F)>

<ROUTINE CONFERENCE-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a fairly square room, almost filled by a round conference table.
To the south is a door which is ">
		<DDESC ,CONFERENCE-DOOR>
		<TELL
". To the north is a small room about the size of a phone booth." CR>)>>

<OBJECT CONFERENCE-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION CONFERENCE-DOOR-F)>

<OBJECT COMBINATION-DIAL
	(LOC REC-AREA)
	(DESC "combination dial")
	(SYNONYM DIAL)
	(ADJECTIVE COMBINATION)
	(FLAGS MUNGBIT NDESCBIT)
	(ACTION COMBINATION-DIAL-F)>

<ROUTINE COMBINATION-DIAL-F ()
	 <COND (<VERB? EXAMINE>
	        <TELL
"The dial can be turned to any number between 0 and 1000." CR>)
	       (<AND <VERB? SET>
		     <EQUAL? ,PRSI ,INTNUM>>
		<COND (<FSET? ,COMBINATION-DIAL ,MUNGEDBIT>
		       <TELL
"The dial has somehow become fused and won't move." CR>)
		      (<EQUAL? ,P-NUMBER ,DIAL-NUMBER>
		       <TELL "That's what the dial is set to now!" CR>)
		      (<EQUAL? ,P-NUMBER ,NUMBER-NEEDED>
		       <SETG DIAL-NUMBER 0>
		       <FSET ,CONFERENCE-DOOR ,OPENBIT>
		       <TELL
"The door swings open, and the dial resets to 0." CR>)
		      (<G? ,P-NUMBER 1000>
		       <TELL
"The dial cannot be turned to a number that high." CR>)
		      (T
		       <SETG DIAL-NUMBER ,P-NUMBER>
		       <TELL "The dial is now set to " N ,P-NUMBER "." CR>)>)>>

<ROUTINE CONFERENCE-DOOR-F ()
	<COND (<VERB? OPEN>
	       <COND (<FSET? ,CONFERENCE-DOOR ,OPENBIT>
		      <ALREADY-OPEN>)
		     (T
		      <COND (<EQUAL? ,HERE ,REC-AREA>
			     <TELL
"The door is locked. You probably have to turn the dial to some number to
open it." CR>)
			    (T
			     <TELL
"The door seems to be locked from the other side." CR>)>)>)
	      (<VERB? CLOSE>
	       <COND (<FSET? ,CONFERENCE-DOOR ,OPENBIT>
		      <FCLEAR ,CONFERENCE-DOOR ,OPENBIT>
		      <TELL
"The door closes and you hear a click as it locks." CR>)
		     (T
		      <IS-CLOSED>)>)>>

<ROOM BOOTH-1
      (LOC ROOMS)
      (DESC "Booth 1")
      (LDESC
"This is a tiny room with a large \"1\" painted on the wall. A panel contains
a slot about ten centimeters wide, a beige button labelled \"2\" and a tan
button labelled \"3.\"")
      (SOUTH TO CONFERENCE-ROOM)
      (OUT TO CONFERENCE-ROOM)
      (PSEUDO "BOOTH" IN-BOOTH-PSEUDO)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL CONTROLS SLOT TELEPORTATION-BUTTON-2 TELEPORTATION-BUTTON-3)>

<ROOM REC-CORRIDOR
      (LOC ROOMS)
      (DESC "Rec Corridor")
      (LDESC
"This is a wide, east-west hallway. Portals lead north and south, and another
corridor branches southwest.")
      (WEST TO REC-AREA)
      (NORTH TO DORM-B)
      (SOUTH TO DORM-A)
      (EAST TO MESS-CORRIDOR)
      (SW TO PLAIN-HALL)
      (FLAGS ONBIT RLANDBIT)>

<CONSTANT DORM-DESC 
"This is a very long room lined with multi-tiered bunks. Flimsy partitions
between the tiers may have provided a modicum of privacy. These spartan
living quarters could have once housed many hundreds, but seem quite
deserted now. There are openings at the north and south ends of the room.">

<CONSTANT SANFAC-DESC
"This must be the sanitary facility for the adjacent dormitory. The fixtures
are dry and dusty, the room dead and deserted. You marvel at how little the
millennia and cultural gulfs have changed toilet bowl design. The only exit is ">

<ROOM DORM-A
      (LOC ROOMS)
      (DESC "Dorm A")
      (LDESC ,DORM-DESC)
      (SOUTH TO SANFAC-A)
      (NORTH TO REC-CORRIDOR)
      (FLAGS FLOYDBIT ONBIT RLANDBIT)
      (GLOBAL BED)
      (PSEUDO "PARTITION" PARTITION-PSEUDO)>

<ROOM SANFAC-A
      (LOC ROOMS)
      (DESC "SanFac A")
      (NORTH TO DORM-A)
      (FLAGS ONBIT RLANDBIT FLOYDBIT)
      (PSEUDO "FIXTURES" TOILET-PSEUDO "TOILET" TOILET-PSEUDO)
      (ACTION SANFAC-SOUTH-F)>
      
<ROUTINE SANFAC-SOUTH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL SANFAC-DESC "north." CR>)>>
      
<ROUTINE SANFAC-NORTH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL SANFAC-DESC "south." CR>)>>


<ROOM DORM-B
      (LOC ROOMS)
      (DESC "Dorm B")
      (LDESC ,DORM-DESC)
      (SOUTH TO REC-CORRIDOR)
      (NORTH TO SANFAC-B)
      (FLAGS FLOYDBIT ONBIT RLANDBIT)
      (GLOBAL BED)
      (PSEUDO "PARTITION" PARTITION-PSEUDO)>

<ROOM SANFAC-B
      (LOC ROOMS)
      (DESC "SanFac B")
      (SOUTH TO DORM-B)
      (FLAGS FLOYDBIT ONBIT RLANDBIT)
      (PSEUDO "FIXTURES" TOILET-PSEUDO "TOILET" TOILET-PSEUDO)
      (ACTION SANFAC-NORTH-F)>

<ROOM DORM-C
      (LOC ROOMS)
      (DESC "Dorm C")
      (LDESC ,DORM-DESC)
      (NORTH TO DORM-CORRIDOR)
      (SOUTH TO SANFAC-C)
      (FLAGS ONBIT FLOYDBIT RLANDBIT)
      (GLOBAL BED)
      (PSEUDO "PARTITION" PARTITION-PSEUDO)>

<ROOM SANFAC-C
      (LOC ROOMS)
      (DESC "SanFac C")
      (NORTH TO DORM-C)
      (FLAGS FLOYDBIT ONBIT RLANDBIT)
      (PSEUDO "FIXTURES" TOILET-PSEUDO "TOILET" TOILET-PSEUDO)
      (ACTION SANFAC-SOUTH-F)>

<ROOM DORM-D
      (LOC ROOMS)
      (DESC "Dorm D")
      (LDESC ,DORM-DESC)
      (SOUTH TO DORM-CORRIDOR)
      (NORTH TO SANFAC-D)
      (FLAGS FLOYDBIT ONBIT RLANDBIT)
      (GLOBAL BED)
      (PSEUDO "PARTITION" PARTITION-PSEUDO)>

<ROOM SANFAC-D
      (LOC ROOMS)
      (DESC "SanFac D")
      (SOUTH TO DORM-D)
      (FLAGS ONBIT FLOYDBIT RLANDBIT)
      (PSEUDO "FIXTURES" TOILET-PSEUDO "TOILET" TOILET-PSEUDO)
      (ACTION SANFAC-NORTH-F)>

<ROOM MESS-CORRIDOR
      (LOC ROOMS)
      (DESC "Mess Corridor")
      (SOUTH TO MESS-HALL)
      (NORTH TO STORAGE-WEST IF STORAGE-WEST-DOOR IS OPEN)
      (EAST TO DORM-CORRIDOR)
      (WEST TO REC-CORRIDOR)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL STORAGE-WEST-DOOR)
      (ACTION MESS-CORRIDOR-F)>

<ROUTINE MESS-CORRIDOR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a wide, east-west hallway with a large portal to the south. A
small door to the north is ">
		<DDESC ,STORAGE-WEST-DOOR>
		<COND (<NOT ,PADLOCK-REMOVED>
		       <TELL " and hooked with a simple steel padlock">
		       <COND (<FSET? ,PADLOCK ,OPENBIT>
			      <TELL " which hangs unlocked">)
			     (T
			      <TELL " which is also closed">)>)>
		<TELL "." CR>)>>

<OBJECT STORAGE-WEST-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION STORAGE-WEST-DOOR-F)>

<ROUTINE STORAGE-WEST-DOOR-F ()
	 <COND (<VERB? OPEN>
		<COND (<FSET? ,STORAGE-WEST-DOOR ,OPENBIT>
		       <ALREADY-OPEN>)
		      (,PADLOCK-REMOVED
		       <FSET ,STORAGE-WEST-DOOR ,OPENBIT>
		       <TELL "Opened." CR>)
		      (T
		       <TELL 
"The door cannot be opened until the padlock is removed." CR>)>)
	       (<VERB? CLOSE>
		<COND (<FSET? ,STORAGE-WEST-DOOR ,OPENBIT>
		       <FCLEAR ,STORAGE-WEST-DOOR ,OPENBIT>
		       <TELL "The door is now closed." CR>)
		      (T
		       <IS-CLOSED>)>)
	       (<VERB? UNLOCK>
		<TELL "The door itself isn't locked.">
		<COND (<AND <NOT <FSET? ,PADLOCK ,OPENBIT>> <NOT ,PADLOCK-REMOVED>>
		       <TELL " It is the padlock on the door which is locked.">)>
		<TELL CR>)>>

<OBJECT PADLOCK
	(LOC MESS-CORRIDOR)
	(DESC "padlock")
	(SYNONYM PADLOCK PAD LOCK)
	(ADJECTIVE SIMPLE STEEL METAL)
	(SIZE 10)
	(FLAGS MUNGBIT NDESCBIT TAKEBIT TRYTAKEBIT)
	(ACTION PADLOCK-F)>

<GLOBAL PADLOCK-REMOVED <>> ;"is the padlock still on the door?"

<ROUTINE PADLOCK-F ()
	 <COND (<EQUAL? ,HERE ,BRIG>
		<TELL
"You can't see or reach the lock from inside the cell." CR>)
	       (<AND <VERB? OPEN-WITH>
		     <EQUAL? ,PADLOCK ,PRSO>>
		<PERFORM ,V?UNLOCK ,PADLOCK ,PRSI>
		<RTRUE>)
	       (<VERB? UNLOCK OPEN>
		<COND (<NOT <FSET? ,PADLOCK ,OPENBIT>>
		       <COND (<NOT ,PRSI>
			      <TELL "You can't open it with your hands." CR>)
			     (<EQUAL? ,PRSI ,KEY>
			      <COND (<FSET? ,PADLOCK ,MUNGEDBIT>
			             <TELL
"Tsk, tsk... the padlock seems to be fused shut." CR>)
				    (T
				     <FSET ,PADLOCK ,OPENBIT>
				     <TELL "The padlock springs open." CR>)>)
			     (T
			      <TELL "That doesn't work." CR>)>)
		      (T
		       <TELL "The padlock is already unlocked." CR>)>)
	       (<VERB? CLOSE LOCK>
		<COND (<FSET? ,PADLOCK ,OPENBIT>
		       <FCLEAR ,PADLOCK ,OPENBIT>
		       <TELL "The padlock closes with a sharp click." CR>)
		      (T
		       <TELL "The padlock is already locked." CR>)>)
	       (<AND <VERB? TAKE>
		     <NOT ,PADLOCK-REMOVED>>
		<COND (<FSET? ,PADLOCK ,OPENBIT>
		       <SETG PADLOCK-REMOVED T>
		       <FCLEAR ,PADLOCK ,TRYTAKEBIT>
		       <FCLEAR ,PADLOCK ,NDESCBIT>
		       <RFALSE>)
		      (<NOT <FSET? ,PADLOCK ,OPENBIT>>
		       <TELL "The padlock is locked to the door." CR>)>)
	       (<VERB? MUNG>
		<TELL
"And, as we go into the next round, it's Padlock 1, Adventurer 0..." CR>)>>

<ROOM STORAGE-WEST
      (LOC ROOMS)
      (DESC "Storage West")
      (LDESC
"This is a small room obviously intended as a storage area.")
      (SOUTH TO MESS-CORRIDOR IF STORAGE-WEST-DOOR IS OPEN)
      (OUT TO MESS-CORRIDOR IF STORAGE-WEST-DOOR IS OPEN)
      (FLAGS RLANDBIT ONBIT)
      (VALUE 4)
      (GLOBAL SHELVES STORAGE-WEST-DOOR)>

<OBJECT CAN
	(LOC STORAGE-WEST)
	(DESC "tin can")
	(LDESC 
"There is a large tin can, labelled \"Spam and Egz,\" sitting here.")
	(FDESC
"On a small shelf is a large, unopened tin can. It has a plain white
label which reads \"Spam and Egz.\"")
	(SIZE 15)
	(SYNONYM CAN)
	(ADJECTIVE LARGE TIN UNOPENED)
	(FLAGS TAKEBIT)
	(ACTION CAN-F)>

<ROUTINE CAN-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a rather normal tin can. It is large and is labelled \"Spam
and Egz.\"" CR>)
	       (<VERB? OPEN>
		<TELL
"You certainly can't open it with your hands, and you don't seem to have
found a can opener yet." CR>)>> 

<OBJECT LADDER
	(LOC STORAGE-WEST)
	(DESC "ladder")
	(FDESC
"A heavy-duty extendable ladder is leaning against the rear wall.")
	(LDESC
"There is a large aluminum ladder here.")
	(SYNONYM LADDER)
	(ADJECTIVE HEAVY DUTY HEAVY-DUTY ALUMINUM LARGE)
	(SIZE 80)
	(FLAGS TAKEBIT)
	(ACTION LADDER-F)>

<GLOBAL LADDER-EXTENDED <>> ;"is the ladder extended?"

<GLOBAL LADDER-FLAG <>> ;"is the ladder spanning the rift?"

<ROUTINE LADDER-F ()
	 <COND (<VERB? TAKE>
		<COND (,LADDER-EXTENDED
		       <TELL
"You can't possibly carry the ladder while it's extended." CR>)>)
	       (<VERB? EXAMINE>
		<TELL
"It is a heavy-duty ladder built of sturdy aluminum tubing. It is currently ">
		<COND (,LADDER-EXTENDED
		       <TELL
"extended to its full length of about 8 meters, but could be collapsed to
a shorter length for easier carrying." CR>)
		      (T
		       <TELL
"collapsed and is around two-and-a-half meters long, but if extended would
obviously be much longer." CR>)>)
	       (<VERB? OPEN>
		<COND (,LADDER-EXTENDED
		       <TELL "The ladder is already extended." CR>)
		      (<OR <EQUAL? ,HERE ,STORAGE-EAST ,STORAGE-WEST ,BOOTH-2>
			   <EQUAL? ,HERE ,UPPER-ELEVATOR ,LOWER-ELEVATOR>>
		       <TELL
"You can't extend the ladder in this tiny space!" CR>)
		      (<IN? ,LADDER ,ADVENTURER>
		       <TELL
"You couldn't possibly extend the ladder while you're holding it." CR>)
		      (T
		       <FSET ,LADDER ,TRYTAKEBIT>
		       <SETG LADDER-EXTENDED T>
		       <SETG C-ELAPSED 36>
		       <TELL
"The ladder extends to a length of around eight meters." CR>)>)
	       (<VERB? CLOSE>
		<COND (,LADDER-EXTENDED
		       <SETG C-ELAPSED 21>
		       <COND (,LADDER-FLAG
			      <SETG LADDER-FLAG <>>
			      <REMOVE ,LADDER>
			      <TELL
"As the ladder shortens it plunges into the rift." CR>)
			     (T
			      <SETG LADDER-EXTENDED <>>
			      <FCLEAR ,LADDER ,TRYTAKEBIT>
			      <TELL
"The ladder collapses to a length of around two-and-a-half meters." CR>)>)
		      (T
		       <TELL
"The ladder is already in its collapsed state." CR>)>)
	       (<AND <VERB? SPAN ATTRACT>
		     <EQUAL? ,PRSI ,RIFT>>
		<COND (,LADDER-FLAG
		       <TELL "The ladder already spans the rift." CR>)
		      (T
		       <COND (,LADDER-EXTENDED
			      <SETG LADDER-FLAG T>
			      <FSET ,LADDER ,NDESCBIT>
			      <TELL
"The ladder swings out across the rift and comes to rest on the far edge,
spanning the precipice." CR>)
			     (T <SHORT-LADDER-RIFT-F>)>)>)
	       (<VERB? CLIMB-UP CLIMB-FOO>
		<COND (,LADDER-FLAG
		       <TELL "You can't climb a horizontal ladder!" CR>)
		      (<IN? ,LADDER ,ADVENTURER>
		       <TELL
"That would be a neat trick, considering that you're holding it." CR>)>)>>

<ROUTINE SHORT-LADDER-RIFT-F ()
	<TELL "The ladder is far too short to reach the other edge of the rift. It ">
	<COND (<EQUAL? ,MODERN T> <TELL "would plunge into the rift and be lost forever!" CR>)
		  (T <REMOVE ,LADDER> <TELL "plunges into the rift and is lost forever!" CR>)>>

<ROOM DORM-CORRIDOR
      (LOC ROOMS)
      (DESC "Dorm Corridor")
      (LDESC
"This is a wide, east-west hallway with openings to the north and south.
To the east, the corridor stretches off into the distance. That section of
the hallway is lined with a motorized walkway (no longer running) that
was probably intended to transport people or cargo down the tremendously
long hall.")
      (NORTH TO DORM-D)
      (SOUTH TO DORM-C)
      (WEST TO MESS-CORRIDOR)
      (EAST PER LONG-HALL-F)
      (FLAGS ONBIT RLANDBIT)
      (PSEUDO "WALKWAY" WALKWAY-PSEUDO)>

<ROOM MESS-HALL
      (LOC ROOMS)
      (DESC "Mess Hall")
      (NORTH TO MESS-CORRIDOR)
      (OUT TO MESS-CORRIDOR)
      (SOUTH TO KITCHEN IF KITCHEN-DOOR IS OPEN)
      (IN TO KITCHEN IF KITCHEN-DOOR IS OPEN)
      (GLOBAL TABLES KITCHEN-DOOR SLOT)
      (FLAGS ONBIT FLOYDBIT RLANDBIT)
      (PSEUDO "BENCH" BENCH-PSEUDO "BENCHES" BENCH-PSEUDO)
      (ACTION MESS-HALL-F)>

<ROUTINE MESS-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a large hall lined with tables and benches. An opening to the north
leads back to the corridor. A door to the south is ">
		<DDESC ,KITCHEN-DOOR>
		<TELL ". Next to the door is a small slot." CR>)>>


<OBJECT KITCHEN-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(ADJECTIVE KITCHEN)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION KITCHEN-DOOR-F)>

<ROUTINE KITCHEN-DOOR-F ()
	 <COND (<VERB? OPEN>
	        <TELL "A light flashes \"Pleez yuuz kichin akses kard.\"" CR>)
          (<AND <VERB? CLOSE> <FSET? ,KITCHEN-DOOR ,OPENBIT>>
           <TELL "There's no obvious way to do that." CR>)>>

<ROOM KITCHEN
      (LOC ROOMS)
      (DESC "Kitchen")
      (LDESC
"This is the food production and dispensary area for the dining hall to the
north. Of particular interest is a machine near the door. You should probably
examine it more closely.")
      (NORTH TO MESS-HALL)
      (OUT TO MESS-HALL)
      (GLOBAL KITCHEN-DOOR)
      (PSEUDO "SPOUT" SPOUT-PSEUDO "BUTTON" BUTTON-PSEUDO)
      (FLAGS ONBIT RLANDBIT)
      (VALUE 4)>

<OBJECT DISPENSER
	(LOC KITCHEN)
	(DESC "dispenser unit")
	(SYNONYM UNIT NICHE MACHINE DISPENSER)
	(ADJECTIVE DISPENSER)
	(FLAGS MUNGBIT CONTBIT SEARCHBIT OPENBIT TRANSBIT NDESCBIT)
	(ACTION DISPENSER-F)>

<OBJECT CANTEEN
	(LOC MESS-HALL)
	(DESC "canteen")
	(FDESC 
"Although the room is quite barren, an octagonally shaped
canteen is sitting on one of the benches.")
	(SYNONYM CANTEEN)
	(ADJECTIVE OCTAGONAL)
	(CAPACITY 5)
	(SIZE 10)
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)>

<ROUTINE DISPENSER-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This wall-mounted unit contains an octagonal niche beneath a spout. ">
		<COND (<IN? ,CANTEEN ,DISPENSER>
		       <TELL
"A canteen is resting in the niche, its mouth lying just below the spout. ">)>
		<TELL
"Above the spout is a button. The machine is labelled \"Hii Prooteen Likwid
Dispensur.\"" CR>)
	       (<VERB? CLOSE>
		<NO-CLOSE>
		<RTRUE>)
	       (<VERB? PUT>
		<COND (<EQUAL? ,PRSO ,CANTEEN>
		       <MOVE ,CANTEEN ,DISPENSER>
		       <TELL "The canteen fits snugly into the octagonal niche,
its mouth resting just below the spout of the machine." CR>)
		      (T
		       <TELL "It doesn't fit in the niche." CR>)>)>>

<OBJECT HIGH-PROTEIN
	(DESC "quantity of protein-rich liquid")
	(SYNONYM LIQUID FLUID FOOD QUANTITY)
	(ADJECTIVE BROWN PROTEIN-RICH PROTEIN RICH)
	(SIZE 5)
	(FLAGS FOODBIT LIQUIDBIT)
	(ACTION HIGH-PROTEIN-F)>

<ROUTINE HIGH-PROTEIN-F ("AUX" (X <>))
	 <COND (<VERB? EAT>
		<COND (<NOT <IN? ,CANTEEN ,ADVENTURER>>
		       <SETG PRSO ,CANTEEN>
		       <NOT-HOLDING>)
		      (T
		       <COND (<EQUAL? ,HUNGER-LEVEL 0>
			      <TELL ,NOT-HUNGRY CR>)
			     (T
			      <REMOVE ,HIGH-PROTEIN>
			      <SETG C-ELAPSED 15>
               <COND (<EQUAL? ,MODERN <>>
                  <SETG HUNGER-LEVEL 0>
                  <ENABLE QUEUE I-HUNGER-WARNINGS 3600>)>
			      <TELL
"Mmmm... that was good. It certainly quenched your thirst and satisfied your
hunger." CR>)>)>)
	       (<AND <VERB? POUR>
		     <EQUAL? ,PRSO ,HIGH-PROTEIN>>
		<COND (<NOT <IN? ,CANTEEN ,ADVENTURER>>
		       <TELL "Maybe if you were holding the canteen..." CR>
		       <RTRUE>)
		      (<NOT ,PRSI>
		       <SETG PRSI ,GROUND>)>
		<COND (<EQUAL? ,PRSI ,FLASK>
		       <WORTHLESS-ACTION>)
		      (<EQUAL? ,PRSI ,FUNNEL-HOLE>
		       <COND (<IN? ,CHEMICAL-FLUID ,FLASK>
			      <SET X T>)>
		       <SETG CHEMICAL-REQUIRED 10>
		       <REMOVE ,HIGH-PROTEIN>
		       <PERFORM ,V?POUR ,CHEMICAL-FLUID ,FUNNEL-HOLE>
		       <COND (.X
			      <MOVE ,CHEMICAL-FLUID ,FLASK>)>
		       <RTRUE>)
		      (T
		       <REMOVE ,HIGH-PROTEIN>
		       <TELL
"The protein-rich fluid pours over the " D ,PRSI " and then dries up." CR>)>)>>

<ROUTINE WORTHLESS-ACTION ()
	 <TELL
"A worthless action -- and much too difficult for a poorly written program
like this one to handle." CR>>

<ROOM CORRIDOR-JUNCTION
      (LOC ROOMS)
      (DESC "Corridor Junction")
      (LDESC
"A north-south corridor intersects the main corridor here. To the west, the
main corridor extends as far as you can see; a nonworking walkway from
that direction ends here. To the east, the corridor widens into a well-lit
area.")
      (NORTH TO ADMIN-CORRIDOR-S)
      (SOUTH TO MECH-CORRIDOR-N)
      (WEST PER LONG-HALL-F)
      (EAST TO ELEVATOR-LOBBY)
      (FLAGS FLOYDBIT RLANDBIT ONBIT)
      (PSEUDO "WALKWAY" WALKWAY-PSEUDO)>

<ROUTINE LONG-HALL-F ()
	 <TELL
"You walk down the long, featureless hallway for a long time. Finally,
you see ">
	 <SETG C-ELAPSED 160>
	 <COND (<EQUAL? ,HERE ,CORRIDOR-JUNCTION>
		<TELL "some doorways ahead..." CR CR>
		,DORM-CORRIDOR)
	       (T
		<TELL "an intersection ahead..." CR CR>
		,CORRIDOR-JUNCTION)>>
		
<ROOM ADMIN-CORRIDOR-S
      (LOC ROOMS)
      (DESC "Admin Corridor South")
      (LDESC
"This section of hallway seems to have suffered some minor structural
damage. The walls are cracked, and a jagged crevice crosses the floor.
An opening leads east and the corridor heads north and south.")
      (SOUTH TO CORRIDOR-JUNCTION)
      (NORTH TO ADMIN-CORRIDOR)
      (EAST TO SANFAC-E)
      (FLAGS RLANDBIT ONBIT)
      (ACTION ADMIN-CORRIDOR-S-F)>

<ROUTINE ADMIN-CORRIDOR-S-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <FSET? ,KEY ,INVISIBLE>
		     <PROB 20>>
		<TELL
"You catch, out of the corner of your eye, a glint of light from the direction
of the floor." CR>)>>

<OBJECT CREVICE
	(LOC ADMIN-CORRIDOR-S)
	(DESC "crevice")
	(SYNONYM CREVICE CRACK HOLE)
	(ADJECTIVE NARROW JAGGED)
	(FLAGS NDESCBIT)
	(ACTION CREVICE-F)>

<ROUTINE CREVICE-F ()
	 <COND (<VERB? REACH>
		<TELL "The crevice is too narrow to reach into." CR>)
	       (<VERB? LOOK-INSIDE EXAMINE SEARCH>
		<COND (<FSET? ,KEY ,TOUCHBIT>
		       <TELL "Nothing there but bunches of dust." CR>)
		      (T
		       <FCLEAR ,KEY ,INVISIBLE>
		       <TELL
"Lying at the bottom of the narrow crack, partly covered by layers of dust,
is a shiny steel key!" CR>)>)>>

<OBJECT KEY
	(LOC ADMIN-CORRIDOR-S)
	(DESC "key")
	(FDESC "Lying at the bottom of a narrow crevice is a shiny object.")
	(SIZE 3)
	(SYNONYM KEY METAL OBJECT)
	(ADJECTIVE PIECE STEEL IRON SHINY)
	(FLAGS ACIDBIT TAKEBIT TOOLBIT INVISIBLE TRYTAKEBIT)
	(ACTION KEY-F)>

<ROUTINE KEY-F ()
	 <COND (<AND <VERB? TAKE ZATTRACT MOVE>
		     <NOT <FSET? ,KEY ,TOUCHBIT>>>
	        <COND (<EQUAL? ,PRSI ,PLIERS>
		       <TELL
"These are heavy-duty pliers, too large to reach into this narrow crack." CR>)
		      (<EQUAL? ,PRSI ,MAGNET>
		       <PERFORM ,V?ATTRACT ,MAGNET ,KEY>
		       <RTRUE>)
		      (,PRSI
		       <TELL "Nice try." CR>)
		      (T
		       <TELL
"Either the crevice is too narrow, or your fingers are too large." CR>)>)
	       (<AND <VERB? PUT>
		     <EQUAL? ,PRSI ,CREVICE>>
		<TELL
"And you wonder why you're still only an Ensign Seventh Class?" CR>)>>

<ROOM ADMIN-CORRIDOR
      (LOC ROOMS)
      (DESC "Admin Corridor") 
      (SOUTH TO ADMIN-CORRIDOR-S)
      (NORTH PER LADDER-EXIT-F)
      (WEST TO SYSTEMS-MONITORS)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL RIFT)
      (PSEUDO "RUBBLE" RUBBLE-PSEUDO)
      (ACTION ADMIN-CORRIDOR-F)>

<ROUTINE ADMIN-CORRIDOR-F (RARG)
	 <COND (<AND ,LADDER-FLAG
		     <EQUAL? .RARG ,M-ENTER>>
		<MOVE ,LADDER ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL 
"The hallway, in fact the entire building, has been rent apart here, presumably
by seismic upheaval. You can see the sky through the severed roof above, and
the ground is thick with rubble. To the north is a gaping rift, at least eight
meters across and thirty meters deep. ">
		<COND (,LADDER-FLAG
		       <TELL "A metal ladder spans the rift. ">)>
		<TELL
"A wide doorway, labelled \"Sistumz Moniturz,\" leads west." CR>)>>

<ROOM ADMIN-CORRIDOR-N
      (LOC ROOMS)
      (DESC "Admin Corridor North")
      (SOUTH PER LADDER-EXIT-F)
      (NORTH TO TRANSPORTATION-SUPPLY)
      (EAST TO PLAN-ROOM)
      (WEST TO SMALL-OFFICE)
      (FLAGS RLANDBIT ONBIT)
      (VALUE 4)
      (GLOBAL RIFT)
      (ACTION ADMIN-CORRIDOR-N-F)>

<ROUTINE ADMIN-CORRIDOR-N-F (RARG)
	 <COND (<AND ,LADDER-FLAG
		     <EQUAL? .RARG ,M-ENTER>>
		<MOVE ,LADDER ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The corridor ends here. Portals lead west, north, and east. Signs above these
portals read, respectively, \"Administraativ Awfisiz,\" \"Tranzportaashun
Suplii,\" and \"Plan Ruum.\" To the south is a wide rift">
		<COND (,LADDER-FLAG
		       <TELL ", spanned by a metal ladder,">)>
		<TELL
" separating this area from the rest of the building." CR>)>>

<ROUTINE LADDER-EXIT-F ()
	 <COND (,LADDER-FLAG
		<SETG C-ELAPSED 33>
		<TELL
"You slowly make your way across the swaying ladder. You can see sharp,
pointy rocks at the bottom of the rift, far below..." CR CR>
		<COND (<EQUAL? ,HERE ,ADMIN-CORRIDOR-N>
		       ,ADMIN-CORRIDOR)
		      (T
		       ,ADMIN-CORRIDOR-N)>)
	       (T
		<TELL "The rift is too wide to jump across." CR>
		<RFALSE>)>>

<OBJECT RIFT
	(LOC LOCAL-GLOBALS)
	(DESC "rift")
	(SYNONYM RIFT GULF PRECIPICE HOLE)
	(ADJECTIVE WIDE DEEP GAPING)
	(FLAGS NDESCBIT)
	(ACTION RIFT-F)>

<ROUTINE RIFT-F ()
	 <COND (<VERB? LEAP>
		<JIGS-UP
"You get a brief (but much closer) view of the sharp and nasty rocks at
the bottom of the rift.">)
	       (<AND <VERB? PUT>
		     <EQUAL? ,RIFT ,PRSI>>
		<COND (<EQUAL? ,PRSO ,LASER>
			      <DISABLE <INT I-WARMTH>>)>
		<REMOVE ,PRSO>
		<COND (<EQUAL? ,PRSO ,SCRUB-BRUSH>
		       <TELL
"You watch with tremendous satisfaction as the brush is lost forever." CR>)
		      (T
		       <TELL
"The " D, PRSO " sails gracefully into the rift." CR>)>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
"The rift is at least eight meters wide and more than thirty meters deep. The
bottom is covered with sharp and nasty rocks." CR>)>>

<ROOM SANFAC-E
      (LOC ROOMS)
      (DESC "SanFac E")
      (LDESC
"Here is another sanitary facility. Like the others, it is dusty and
nonfunctional.")
      (WEST TO ADMIN-CORRIDOR-S)
      (OUT TO ADMIN-CORRIDOR-S)
      (FLAGS FLOYDBIT RLANDBIT ONBIT)
      (PSEUDO "FIXTURES" TOILET-PSEUDO "TOILET" TOILET-PSEUDO)>

<ROOM SYSTEMS-MONITORS
      (LOC ROOMS)
      (DESC "Systems Monitors")
      (EAST TO ADMIN-CORRIDOR)
      (OUT TO ADMIN-CORRIDOR)
      (FLAGS FLOYDBIT RLANDBIT ONBIT)
      (GLOBAL TABLES)
      (PSEUDO "MONITORS" MONITORS-PSEUDO "EQUIPMENT" EQUIPMENT-PSEUDO)
      (ACTION SYSTEMS-MONITORS-F)>

<ROUTINE SYSTEMS-MONITORS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a large room packed with tables full of strange equipment. ">
		<DESCRIBE-MONITORS>)>>

<ROUTINE DESCRIBE-MONITORS ()
	 <TELL
"The far wall is covered with a number of monitors. Of these,
the ones labelled ">
	 <COND (,DEFENSE-FIXED
		<TELL "PLANATEREE DEFENS, ">)>
	 <COND (,COURSE-CONTROL-FIXED
		<TELL "PLANATEREE KORS KUNTROOL, ">)>
	 <COND (,COMM-FIXED
		<TELL "KUMUUNIKAASHUNZ, ">)>
	 <TELL
"LIIBREREE, REEAKTURZ, and LIIF SUPORT are green, but the one">
	 <COND (<NOT <AND ,DEFENSE-FIXED
			  ,COURSE-CONTROL-FIXED
			  ,COMM-FIXED>>
		<TELL "s">)>
	 <TELL " labelled ">
	 <COND (<NOT ,DEFENSE-FIXED>
		<TELL "PLANATEREE DEFENS, ">)>
	 <COND (<NOT ,COURSE-CONTROL-FIXED>
		<TELL "PLANATEREE KORS KUNTROOL, ">)>
	 <COND (<NOT ,COMM-FIXED>
		<TELL "KUMUUNIKAASHUNZ, ">)>
	 <COND (<NOT <AND ,DEFENSE-FIXED
			  ,COURSE-CONTROL-FIXED
			  ,COMM-FIXED>>
		<TELL "and ">)>
	 <TELL "PRAJEKT KUNTROOL indicate">
	 <COND (<AND ,DEFENSE-FIXED ,COURSE-CONTROL-FIXED ,COMM-FIXED>
		<TELL "s">)>
	 <TELL " a malfunctioning condition." CR>>

<ROOM PLAN-ROOM
      (LOC ROOMS)
      (DESC "Plan Room")
      (LDESC
"This is a small room whose far wall is covered with many small cubbyholes,
all empty. The left wall is covered with an enormous map, labelled
\"Kalamontee Kompleks\", showing two installations connected by a long
hallway. Near the upper part of this map is a red arrow saying \"Yuu ar
heer.\" The right wall is covered with a similar map, labelled \"Lawanda
Kompleks\", showing two installations, one apparently buried deep
underground.")
      (WEST TO ADMIN-CORRIDOR-N)
      (FLAGS RLANDBIT ONBIT FLOYDBIT)
      (PSEUDO "CUBBYHOLE" CUBBYHOLE-PSEUDO "MAPS" MAPS-PSEUDO)>

<ROOM TRANSPORTATION-SUPPLY
      (LOC ROOMS)
      (DESC "Transportation Supply")
      (LDESC "You have just located a serious bug.")
      (SOUTH TO ADMIN-CORRIDOR-N)
      (NORTH TO TRANSPORTATION-SUPPLY)
      (EAST TO TRANSPORTATION-SUPPLY)
      (WEST TO TRANSPORTATION-SUPPLY)
      (OUT TO ADMIN-CORRIDOR-N)
      (FLAGS RLANDBIT)>

<ROOM SMALL-OFFICE
      (LOC ROOMS)
      (DESC "Small Office")
      (LDESC
"You have entered a small office of some sort. A small desk faces the main
doorway which lies to the east. Another exit leads west.")
      (EAST TO ADMIN-CORRIDOR-N)
      (WEST TO LARGE-OFFICE)
      (FLAGS RLANDBIT FLOYDBIT ONBIT)>

<OBJECT SMALL-DESK
	(LOC SMALL-OFFICE)
	(DESC "small desk")
	(SYNONYM DESK DRAWER)
	(ADJECTIVE SMALL)
	(CAPACITY 10)
	(FLAGS NDESCBIT CONTBIT SEARCHBIT)
	(ACTION DESK-F)>

<OBJECT KITCHEN-CARD
	(LOC SMALL-DESK)
	(DESC "kitchen access card")
	(SYNONYM CARD CARDS)
	(ADJECTIVE KITCHEN ACCESS)
	(SIZE 3)
	(FLAGS TAKEBIT READBIT)
      (TEXT "The card is embossed \"kichin akses kard.\"")
	(VALUE 1)
   (ACTION CARD-F)>

<OBJECT UPPER-ELEVATOR-CARD
	(LOC SMALL-DESK)
	(DESC "upper elevator access card")
	(SYNONYM CARD CARDS)
	(ADJECTIVE UPPER ELEVATOR ACCESS)
	(SIZE 3)
	(FLAGS VOWELBIT TAKEBIT READBIT)
	(TEXT "The card is embossed \"upur elivaatur akses kard.\"")
	(VALUE 1)
   (ACTION CARD-F)>

<OBJECT SHUTTLE-CARD
	(LOC LARGE-DESK)
	(DESC "shuttle access card")
	(SYNONYM CARD CARDS)
	(ADJECTIVE SHUTTLE ACCESS)
	(SIZE 3)
	(FLAGS TAKEBIT READBIT)
	(TEXT "The card is embossed \"shutul akses kard.\"")
	(VALUE 1)
   (ACTION CARD-F)>

<OBJECT LOWER-ELEVATOR-CARD
	(DESC "lower elevator access card")
	(SYNONYM CARD CARDS)
	(ADJECTIVE LOWER ELEVATOR ACCESS)
	(SIZE 3)
	(FLAGS TAKEBIT READBIT)
	(TEXT "The card is embossed \"loowur elivaatur akses kard.\"")
	(VALUE 1)
   (ACTION CARD-F)>

<ROUTINE CARD-F ()
   <COND (<AND <EQUAL? ,MODERN T> <VERB? RUB>> <TELL "You optimistically rub the magnetic stripe." CR> <FCLEAR ,PRSO ,SCRAMBLEDBIT>)>>

<ROOM LARGE-OFFICE
      (LOC ROOMS)
      (DESC "Large Office")
      (LDESC
"This is a large, plush office. The far wall is one large picture window,
scratched but unbroken, offering a view of this installation and the ocean
beyond. In front of the window is a wide wooden desk. The only exit is east.")
      (EAST TO SMALL-OFFICE)
      (FLAGS FLOYDBIT RLANDBIT ONBIT)
      (GLOBAL WINDOW OCEAN)>

<OBJECT LARGE-DESK
	(LOC LARGE-OFFICE)
	(DESC "large desk")
	(SYNONYM DESK DRAWER)
	(ADJECTIVE LARGE WIDE WOODEN)
	(CAPACITY 20)
	(FLAGS CONTBIT SEARCHBIT NDESCBIT)
	(ACTION DESK-F)>

<ROUTINE DESK-F ()
	 <COND (<VERB? SEARCH EXAMINE>
		<TELL "The desk has a drawer which is currently ">
		<DDESC ,PRSO>
		<TELL "." CR>)>>

<ROOM MECH-CORRIDOR-N
      (LOC ROOMS)
      (DESC "Mech Corridor North")
      (LDESC
"Entrances to rooms lie to the east and west from this north-south hall.")
      (EAST TO STORAGE-EAST)
      (WEST TO PHYSICAL-PLANT)
      (NORTH TO CORRIDOR-JUNCTION)
      (SOUTH TO MECH-CORRIDOR)
      (FLAGS RLANDBIT ONBIT)>

<ROOM MECH-CORRIDOR
      (LOC ROOMS)
      (DESC "Mech Corridor")
      (LDESC
"Entrances to rooms lie to the east and west from this north-south hall.")
      (EAST TO REACTOR-CONTROL)
      (WEST TO PHYSICAL-PLANT)
      (NORTH TO MECH-CORRIDOR-N)
      (SOUTH TO MECH-CORRIDOR-S)
      (FLAGS RLANDBIT ONBIT)>

<ROOM MECH-CORRIDOR-S
      (LOC ROOMS)
      (DESC "Mech Corridor South")
      (LDESC
"The corridor ends here with doorways to the southwest, south, and southeast.")
      (NORTH TO MECH-CORRIDOR)
      (SW TO TOOL-ROOM)
      (SOUTH TO MACHINE-SHOP)
      (SE TO ROBOT-SHOP)
      (FLAGS RLANDBIT ONBIT)>

<ROOM STORAGE-EAST
      (LOC ROOMS)
      (DESC "Storage East")
      (LDESC
"A small room for storage. The exit is to the west.")
      (WEST TO MECH-CORRIDOR-N)
      (FLAGS RLANDBIT FLOYDBIT ONBIT)
      (GLOBAL SHELVES)>

<OBJECT OIL-CAN
	(LOC STORAGE-EAST)
	(DESC "oil can")
	(FDESC
"One dusty shelf, otherwise bare, holds a small oil can.")
	(SYNONYM CAN)
	(ADJECTIVE SMALL OIL)
	(SIZE 10)
	(FLAGS VOWELBIT TAKEBIT)
	(ACTION OIL-CAN-F)>

<ROUTINE OIL-CAN-F ()
	 <COND (<VERB? POUR>
		<COND (<NOT ,PRSI>
		       <SETG PRSI ,GROUND>)>
		<PERFORM ,V?OIL ,PRSI>
		<RTRUE>)
	       (<VERB? EMPTY>
		<TELL
"Pretty much impossible -- you could only do that one drop at a time." CR>)>>

<OBJECT CARTON
	(LOC STORAGE-EAST)
	(DESC "cardboard box")
	(FDESC
"On the floor beneath the shelves sits a small cardboard box.")
	(SYNONYM BOX CARTON)
	(ADJECTIVE SMALL CARDBOARD)
	(SIZE 10)
	(CAPACITY 50)
	(FLAGS TAKEBIT CONTBIT SEARCHBIT OPENBIT)
	(ACTION CARTON-F)>

<ROUTINE CARTON-F ()
	 <COND (<VERB? CLOSE>
		<NO-CLOSE>
		<RTRUE>)>>

<OBJECT CRACKED-BOARD
	(LOC CARTON)
	(DESC "cracked seventeen-centimeter fromitz board")
	(SYNONYM BOARD BOARDS)
	(ADJECTIVE CRACKED SEVENTEEN CENTIMETER FROMITZ)
	(SIZE 10)
	(FLAGS ACIDBIT TAKEBIT)
	(ACTION CRACKED-BOARD-F)>

<ROUTINE CRACKED-BOARD-F ()
	 <COND (<VERB? EXAMINE>
		<EXAMINE-BOARD>
		<TELL " This one looks as though it's been dropped." CR>)>>

<OBJECT MEGAFUSE-B
	(LOC CARTON)
	(DESC "B-series megafuse")
	(SYNONYM FUSE MEGAFUSE)
	(ADJECTIVE B-SERIES B SERIES MEGA)
	(SIZE 5)
	(FLAGS ACIDBIT TAKEBIT)>

<OBJECT MEGAFUSE-K
	(LOC CARTON)
	(DESC "K-series megafuse")
	(SYNONYM FUSE MEGAFUSE)
	(ADJECTIVE K-SERIES K SERIES MEGA)
	(SIZE 5)
	(FLAGS ACIDBIT TAKEBIT)>

<OBJECT GOOD-BEDISTOR
	(LOC CARTON)
	(DESC "good ninety-ohm bedistor")
	(SYNONYM BEDISTOR)
	(ADJECTIVE GOOD NINETY OHM NINETY-OHM)
	(SIZE 8)
	(FLAGS ACIDBIT TAKEBIT)
	(ACTION GOOD-BEDISTOR-F)>

<ROUTINE GOOD-BEDISTOR-F ()
	 <COND (<AND <VERB? TAKE>
		     ,COURSE-CONTROL-FIXED>
		<JIGS-UP
"Kerzap!! You should know better than to touch an active bedistor!">)>>

<ROOM PHYSICAL-PLANT
      (LOC ROOMS)
      (DESC "Physical Plant")
      (LDESC
"This is a huge, dim room with exits in the northeast and southeast
corners. The room is criss-crossed with catwalks and is filled with
heavy equipment presumably intended to heat and ventilate this complex.
Hardly any of the equipment is still operating.")
      (NE TO MECH-CORRIDOR-N)
      (SE TO MECH-CORRIDOR)
      (FLAGS FLOYDBIT RLANDBIT ONBIT)
      (PSEUDO "EQUIPMENT" EQUIPMENT-PSEUDO "CATWALK" CATWALK-PSEUDO)>

<ROOM REACTOR-CONTROL
      (LOC ROOMS)
      (DESC "Reactor Control")
      (LDESC
"This room contains many dials and gauges for controlling a massive planetary
power reactor which, according to a diagram on the wall, must be buried far
below this very complex. The exit is to the west. To the east is a metal door,
and next to it, a button. A dark stairway winds downward.")
      (WEST TO MECH-CORRIDOR)
      (EAST TO REACTOR-ELEVATOR IF REACTOR-ELEVATOR-DOOR IS OPEN)
      (IN TO REACTOR-ELEVATOR IF REACTOR-ELEVATOR-DOOR IS OPEN)
      (DOWN TO REACTOR-ACCESS-STAIRS)
      (FLAGS RLANDBIT FLOYDBIT ONBIT)
      (PSEUDO "BUTTON" REACTOR-BUTTON-PSEUDO "DIAGRAM" DIAGRAM-PSEUDO)
      (GLOBAL CONTROLS STAIRS REACTOR-ELEVATOR-DOOR)>

<ROOM REACTOR-ACCESS-STAIRS
      (LOC ROOMS)
      (DESC "Reactor Access Stairs")
      (LDESC "You have just located a serious bug.")
      (DOWN TO REACTOR-ACCESS-STAIRS)
      (UP TO REACTOR-CONTROL)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)> 

<OBJECT REACTOR-ELEVATOR-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "reactor elevator door")
	(SYNONYM DOOR)
	(ADJECTIVE REACTOR ELEVATOR)
	(FLAGS DOORBIT)
	(ACTION REACTOR-ELEVATOR-DOOR-F)>

<ROUTINE REACTOR-ELEVATOR-DOOR-F ()
	 <COND (<VERB? OPEN CLOSE>
		<TELL "It won't budge." CR>)>>

<ROUTINE I-REACTOR-DOOR-CLOSE ()
	 <ENABLE <QUEUE I-REACTOR-DOOR-CLOSE -1>>
	 <COND (<NOT <EQUAL? ,HERE ,REACTOR-ELEVATOR>>
		<FCLEAR ,REACTOR-ELEVATOR-DOOR ,OPENBIT>
		<COND (<EQUAL? ,HERE ,REACTOR-CONTROL>
		       <TELL CR "The elevator door slides shut." CR>)>
		<DISABLE <INT I-REACTOR-DOOR-CLOSE>>)>>

<ROOM REACTOR-ELEVATOR
      (LOC ROOMS)
      (DESC "Reactor Elevator")
      (LDESC
"This is an elevator with a door to the west, currently open. A control panel
contains an Up button, a Down button, and a small slot.")
      (WEST TO REACTOR-CONTROL)
      (OUT TO REACTOR-CONTROL)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL REACTOR-ELEVATOR-DOOR SLOT ELEVATOR-BUTTON CONTROLS)> 

<ROOM TOOL-ROOM
      (LOC ROOMS)
      (DESC "Tool Room")
      (LDESC
"This is apparently a storage room for tools. Exits lead northeast and east.")
      (NE TO MECH-CORRIDOR-S)
      (EAST TO MACHINE-SHOP)
      (FLAGS RLANDBIT FLOYDBIT ONBIT)
      (GLOBAL SHELVES)>

;"LASER stuff has been moved to COMPTWO with the inside-the-computer stuff"

<OBJECT FLASK
	(LOC TOOL-ROOM)
	(DESC "glass flask")
	(FDESC
"Sitting on the floor below the lowest shelf is a large glass flask.")
	(SYNONYM FLASK)
	(ADJECTIVE GLASS LARGE PLASTIC)
	(SIZE 10)
	(CAPACITY 2)
	(FLAGS CONTBIT SEARCHBIT OPENBIT TAKEBIT)
	(ACTION FLASK-F)>

<ROUTINE FLASK-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The flask has a wide mouth and looks large enough to hold one or two liters.
It is made of glass, or perhaps some tough plastic">
		<COND (<IN? ,CHEMICAL-FLUID ,FLASK>
		       <TELL ", and is filled with a milky white fluid">)>
		<TELL "." CR>)
	       (<VERB? CLOSE>
		<NO-CLOSE>
		<RTRUE>)
	       (<AND <VERB? EMPTY>
		     <IN? ,CHEMICAL-FLUID ,FLASK>
		     <EQUAL?  ,PRSI ,FUNNEL-HOLE>>
		<PERFORM ,V?POUR ,CHEMICAL-FLUID ,FUNNEL-HOLE>
		<RTRUE>)>>

<OBJECT MAGNET
	(LOC TOOL-ROOM)
	(SIZE 10)
	(DESC "curved metal bar")
	(FDESC "On an upper shelf is a metal bar, curved into a U-shape.")
	(SYNONYM MAGNET BAR)
	(ADJECTIVE CURVED METAL HORSESHOE)
	(FLAGS TRYTAKEBIT TAKEBIT)
	(ACTION MAGNET-F)>

<ROUTINE MAGNET-F ()
	 <COND (<VERB? TAKE>
		<ENABLE <QUEUE I-MAGNET -1>>
		<RFALSE>)
	       (<VERB? ATTRACT PUT-ON>
		<COND (<AND <EQUAL? ,PRSO ,MAGNET>
			    <NOT <IN? ,MAGNET ,ADVENTURER>>>
		       <NOT-HOLDING>)
		      (<AND <FSET? ,KEY ,TOUCHBIT>
			    <EQUAL? ,PRSI ,KEY>>
		       <MOVE ,KEY ,ADVENTURER>
		       <TELL
"The key jumps against the ends of the magnet and sticks there. Proud of your
feat, you remove the key from the magnet." CR>)
		      (<AND <NOT <FSET? ,KEY ,TOUCHBIT>>
			    <EQUAL? ,PRSI ,KEY ,CREVICE>>
		       <MOVE ,KEY ,ADVENTURER>
		       <FCLEAR ,KEY ,INVISIBLE>
		       <FCLEAR ,KEY ,TRYTAKEBIT>
		       <FSET ,KEY ,TOUCHBIT>
		       <TELL 
"With a spray of dust and a loud clank, a piece of metal leaps from the
crevice and affixes itself to the magnet. It is a steel key! With a tug,
you remove the key from the magnet." CR>)>)>>

<ROUTINE I-MAGNET ()
	 <COND (<IN? ,MAGNET ,ADVENTURER>
		<COND (<HELD? ,KITCHEN-CARD>
		       <FSET ,KITCHEN-CARD ,SCRAMBLEDBIT>)
		      (<HELD? ,SHUTTLE-CARD>
		       <FSET ,SHUTTLE-CARD ,SCRAMBLEDBIT>)
		      (<HELD? ,TELEPORTATION-CARD>
		       <FSET ,TELEPORTATION-CARD ,SCRAMBLEDBIT>)
		      (<HELD? ,UPPER-ELEVATOR-CARD>
		       <FSET ,UPPER-ELEVATOR-CARD ,SCRAMBLEDBIT>)
		      (<HELD? ,LOWER-ELEVATOR-CARD>
		       <FSET ,LOWER-ELEVATOR-CARD ,SCRAMBLEDBIT>)
		      (<HELD? ,MINI-CARD>
		       <FSET ,MINI-CARD ,SCRAMBLEDBIT>)
		      (<HELD? ,ID-CARD>
		       <FSET ,ID-CARD ,SCRAMBLEDBIT>)>)
	       (T
		<DISABLE <INT I-MAGNET>>)>
	 <RFALSE>>

<OBJECT PLIERS
	(LOC TOOL-ROOM)
	(DESC "pair of wide-nosed pliers")
	(SYNONYM PAIR PLIERS)
	(ADJECTIVE WIDE-NOSED WIDE NOSED)
	(SIZE 15)
	(FLAGS TAKEBIT)>

<ROOM MACHINE-SHOP
      (LOC ROOMS)
      (DESC "Machine Shop")
      (NORTH TO MECH-CORRIDOR-S)
      (EAST TO ROBOT-SHOP)
      (WEST TO TOOL-ROOM)
      (FLAGS RLANDBIT FLOYDBIT ONBIT)
      (PSEUDO "SPOUT" CHEM-SPOUT-PSEUDO)
      (ACTION MACHINE-SHOP-F)>

<ROUTINE MACHINE-SHOP-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This room is some sort of machine shop filled with a variety
of unusual machines. Doorways lead north, east, and west.|
|
Standing against the rear wall is a large dispensing machine with a
spout. ">
		<COND (<NOT <EQUAL? ,SPOUT-PLACED ,GROUND>>
		       <TELL
"Sitting under the spout is ">
		       <COND (<FSET? ,SPOUT-PLACED ,VOWELBIT>
			      <TELL "an ">)
			     (T
			      <TELL "a ">)>
		       <TELL D ,SPOUT-PLACED". ">)>
		<TELL
"The dispenser is lined with brightly colored buttons. The first four
buttons, labelled \"KUULINTS 1 - 4\", are colored red, blue, green, and
yellow. The next three buttons, labelled \"KATALISTS 1 - 3\", are colored
gray, brown, and black. The last two buttons are both white. One of
these is square and says \"BAAS.\" The other white button is round and
says \"ASID.\"" CR>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SPOUT-PLACED ,GROUND>
		     <FLOYD-HERE-AWAKE>
		     <PROB 15>>
		<SETG FLOYD-SPOKE T>
		<TELL
"Floyd pushes one of the dispenser buttons. Fluid pours from the spout and
splashes across the floor. Floyd jumps up and down, giggling." CR>)>>

<OBJECT CHEMICAL-DISPENSER
	(LOC MACHINE-SHOP)
	(DESC "chemical dispenser")
	(SYNONYM DISPENSER MACHINE)
	(ADJECTIVE DISPENSER LARGE CHEMICAL)
	(FLAGS MUNGBIT NDESCBIT)
	(ACTION CHEMICAL-DISPENSER-F)>

<GLOBAL SPOUT-PLACED <>>

<ROUTINE CHEMICAL-DISPENSER-F ()
	 <COND (<AND <VERB? PUT-UNDER>
		     <EQUAL? ,PRSI ,CHEMICAL-DISPENSER>>
		<COND (<EQUAL? ,SPOUT-PLACED ,GROUND>
            <COND (<FSET? ,PRSO ,PARTBIT> <TELL "You can't do that." CR>)
                  (T
                   <MOVE ,PRSO ,HERE>
                   <TELL "The " D ,PRSO " is now sitting under the spout." CR>
                   <SETG SPOUT-PLACED ,PRSO>)>)
		      (T
		       <TELL
"The " D ,SPOUT-PLACED " is already resting under the spout." CR>)>)>>

<OBJECT RED-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "red button")
	(SYNONYM BUTTON)
	(ADJECTIVE RED)
	(FLAGS NDESCBIT)
	(C-MOVE 1)
	(ACTION CHEM-BUTTON-F)>

<OBJECT BLUE-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "blue button")
	(SYNONYM BUTTON)
	(ADJECTIVE BLUE)
	(FLAGS NDESCBIT)
	(C-MOVE 2)
	(ACTION CHEM-BUTTON-F)>

<OBJECT GREEN-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "green button")
	(SYNONYM BUTTON)
	(ADJECTIVE GREEN)
	(FLAGS NDESCBIT)
	(C-MOVE 3)
	(ACTION CHEM-BUTTON-F)>

<OBJECT YELLOW-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "yellow button")
	(SYNONYM BUTTON)
	(ADJECTIVE YELLOW)
	(FLAGS NDESCBIT)
	(C-MOVE 4)
	(ACTION CHEM-BUTTON-F)>

<OBJECT GRAY-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "gray button")
	(SYNONYM BUTTON)
	(ADJECTIVE GRAY GREY)
	(FLAGS NDESCBIT)
	(C-MOVE 5)
	(ACTION CHEM-BUTTON-F)>

<OBJECT BROWN-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "brown button")
	(SYNONYM BUTTON)
	(ADJECTIVE BROWN)
	(FLAGS NDESCBIT)
	(C-MOVE 6)
	(ACTION CHEM-BUTTON-F)>

<OBJECT BLACK-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "black button")
	(SYNONYM BUTTON)
	(ADJECTIVE BLACK)
	(FLAGS NDESCBIT)
	(C-MOVE 7)
	(ACTION CHEM-BUTTON-F)>

<OBJECT ROUND-WHITE-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "round white button")
	(SYNONYM BUTTON)
	(ADJECTIVE WHITE ROUND)
	(FLAGS NDESCBIT)
	(C-MOVE 8)
	(ACTION CHEM-BUTTON-F)>

<OBJECT SQUARE-WHITE-BUTTON
	(LOC MACHINE-SHOP)
	(DESC "square white button")
	(SYNONYM BUTTON)
	(ADJECTIVE SQUARE WHITE)
	(FLAGS NDESCBIT)
	(C-MOVE 9)
	(ACTION CHEM-BUTTON-F)>

<GLOBAL CHEMICAL-FLAG 0>

<CONSTANT COLOR-LTBL
	 <PLTABLE
	  "red"
	  "blue"
	  "green"
	  "yellow"
	  "gray"
	  "brown"
	  "black"
	  "clear"
	  "clear">>

<ROUTINE CHEM-BUTTON-F ()
	 <COND (<VERB? PUSH>
		<COND (<FSET? ,CHEMICAL-DISPENSER ,MUNGEDBIT>
		       <TELL
"The machine coughs a few times, but nothing else happens." CR>)
		      (<EQUAL? ,SPOUT-PLACED ,FLASK>
		       <COND (<IN? ,CHEMICAL-FLUID ,FLASK>
			      <TELL
"Another dose of the chemical fluid pours out of the spout, splashes over
the already-full flask, spills onto the floor, and dries up." CR>)
			     (T
			      <MOVE ,CHEMICAL-FLUID ,FLASK>
			      <TELL "The flask fills with some ">
			      <SETG CHEMICAL-FLAG <GETP ,PRSO ,P?C-MOVE>>
			      <TELL <GET ,COLOR-LTBL <GETP ,PRSO ,P?C-MOVE>>>
			      <TELL
" chemical fluid. The fluid gradually turns milky white." CR>)>)
		      (<AND <EQUAL? ,SPOUT-PLACED ,CANTEEN>
			    <FSET? ,CANTEEN ,OPENBIT>>
		       <TELL
"Chemical fluid gushes from the spout. Unfortunately, the mouth of the canteen
is very narrow, and the fluid just splashes over it." CR>)
		      (T
		       <TELL
"Some sort of chemical fluid pours out of the spout, spills all over the "
D ,SPOUT-PLACED ", and dries up." CR>
		       <COND (<AND <EQUAL? ,PRSO ,ROUND-WHITE-BUTTON
					         ,SQUARE-WHITE-BUTTON>
				   <OR <FSET? ,SPOUT-PLACED ,ACIDBIT>
				       <FSET? ,SPOUT-PLACED ,MUNGBIT>>>
			      <SETG CHEMICAL-FLAG 9>
			      <PERFORM ,V?POUR ,CHEMICAL-FLUID ,SPOUT-PLACED>
			      <RTRUE>)>
		       <RTRUE>)>)>>


<ROOM ROBOT-SHOP
      (LOC ROOMS)
      (DESC "Robot Shop")
      (LDESC
"This room, with exits west and northwest, is filled with robot-like
devices of every conceivable description, all in various states of
disassembly.")
      (WEST TO MACHINE-SHOP)
      (NW TO MECH-CORRIDOR-S)
      (FLAGS RLANDBIT FLOYDBIT ONBIT)
      (PSEUDO "DEVICE" DEVICES-PSEUDO)>

;Elevator department

<ROOM ELEVATOR-LOBBY
      (LOC ROOMS)
      (DESC "Elevator Lobby")
      (NORTH PER ELEVATOR-ENTER-F)
      (SOUTH PER ELEVATOR-ENTER-F)
      (WEST TO CORRIDOR-JUNCTION)
      (EAST TO BOOTH-2)
      (IN TO BOOTH-2)
      (FLAGS RLANDBIT FLOYDBIT ONBIT)
      (GLOBAL UPPER-ELEVATOR-DOOR LOWER-ELEVATOR-DOOR)
      (PSEUDO "BOOTH" NEAR-BOOTH-PSEUDO)
      (ACTION ELEVATOR-LOBBY-F)>

<ROUTINE ELEVATOR-LOBBY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a wide, brightly lit lobby. A blue metal door to the north is ">
		<COND (<AND <FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,UPPER-ELEVATOR-UP <>>>
		       <TELL "open">)
		      (T
		       <TELL "closed">)>
		<TELL
" and a larger red metal door to the south is ">
		<COND (<AND <FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,LOWER-ELEVATOR-UP T>>
		       <COND (<AND <FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>
				   <EQUAL? ,UPPER-ELEVATOR-UP <>>>
			      <TELL "also ">)>
		       <TELL "open">)
		      (T
		       <COND (<OR <NOT <FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>>
				  <EQUAL? ,UPPER-ELEVATOR-UP T>>
			      <TELL "also ">)>
		       <TELL "closed">)>
		<TELL
". Beside the blue door is a blue button, and beside the red door is
a red button. A corridor leads west. To the east is a small room
about the size of a telephone booth." CR>)>>

<ROOM UPPER-ELEVATOR
      (LOC ROOMS)
      (DESC "Upper Elevator")
      (OUT PER ELEVATOR-EXIT-F)
      (SOUTH PER ELEVATOR-EXIT-F)
      (UP SORRY "You'll have to use the elevator controls.")
      (DOWN SORRY "You'll have to use the elevator controls.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL LIGHTS CONTROLS SLOT ELEVATOR-BUTTON UPPER-ELEVATOR-DOOR)
      (ACTION UPPER-ELEVATOR-F)>

<ROUTINE UPPER-ELEVATOR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You have entered a tiny room with a sliding door to the south which is ">
		<DDESC ,UPPER-ELEVATOR-DOOR>
		<TELL
". A control panel contains an Up button, a Down button, and a
narrow slot." CR>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <NOT <FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>>
		     <PROB 10>>
		<TELL
"Some innocuous Hawaiian music oozes from the elevator's intercom." CR>)>>

<ROOM LOWER-ELEVATOR
       (LOC ROOMS)
       (DESC "Lower Elevator")
       (NORTH PER ELEVATOR-EXIT-F)
       (OUT PER ELEVATOR-EXIT-F)
       (UP SORRY "You'll have to use the elevator controls.")
       (DOWN SORRY "You'll have to use the elevator controls.")
       (FLAGS RLANDBIT ONBIT)
       (GLOBAL LIGHTS CONTROLS SLOT ELEVATOR-BUTTON LOWER-ELEVATOR-DOOR)
       (ACTION LOWER-ELEVATOR-F)>

<ROUTINE LOWER-ELEVATOR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a medium-sized room with a door to the north which is ">
		<DDESC ,LOWER-ELEVATOR-DOOR>
		<TELL
". A control panel contains an Up button, a Down button, and
a narrow slot." CR>)>>

<ROUTINE ELEVATOR-ENTER-F ()
	 <COND (<EQUAL? ,PRSO ,P?NORTH>
		<COND (<AND <FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,UPPER-ELEVATOR-UP <>>>
		       ,UPPER-ELEVATOR)
		      (T
		       <DOOR-CLOSED>
		       <RFALSE>)>)
	       (<EQUAL? ,PRSO ,P?SOUTH>
		<COND (<AND <FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,LOWER-ELEVATOR-UP T>>
		       ,LOWER-ELEVATOR)
		      (T
		       <DOOR-CLOSED>
		       <RFALSE>)>)>>

<ROUTINE ELEVATOR-EXIT-F ()
	 <COND (<EQUAL? ,HERE ,UPPER-ELEVATOR>
		<COND (<FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>		
		       <COND (<EQUAL? ,UPPER-ELEVATOR-UP T>
			      ,TOWER-CORE)
			     (T
			      ,ELEVATOR-LOBBY)>)
		      (T
		       <DOOR-CLOSED>
		       <RFALSE>)>)
	       (<EQUAL? ,HERE ,LOWER-ELEVATOR>
		<COND (<FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>		
		       <COND (<EQUAL? ,LOWER-ELEVATOR-UP T>
			      ,ELEVATOR-LOBBY)
			     (T
			      ,WAITING-AREA)>)
		      (T
		       <DOOR-CLOSED>
		       <RFALSE>)>)>>

<OBJECT UPPER-ELEVATOR-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "blue door")
	(SYNONYM DOOR)
	(ADJECTIVE ELEVATOR BLUE METAL)
	(FLAGS NDESCBIT DOORBIT)
	(ACTION UPPER-ELEVATOR-DOOR-F)>

<ROUTINE UPPER-ELEVATOR-DOOR-F ()
	 <COND (<VERB? OPEN>
		<COND (<FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>
		       <ALREADY-OPEN>)
		      (T
		       <TELL "It won't budge." CR>)>)
	       (<VERB? CLOSE>
		<COND (<FSET? ,UPPER-ELEVATOR-DOOR ,OPENBIT>
		       <TELL "You can't close it yourself." CR>)
		      (T
		       <IS-CLOSED>)>)>>

<OBJECT LOWER-ELEVATOR-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "red door")
	(SYNONYM DOOR)
	(ADJECTIVE RED ELEVATOR METAL)
	(FLAGS NDESCBIT DOORBIT)
	(ACTION LOWER-ELEVATOR-DOOR-F)>

<ROUTINE LOWER-ELEVATOR-DOOR-F ()
	 <COND (<VERB? OPEN>
		<COND (<AND <FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,HERE ,ELEVATOR-LOBBY>
			    <EQUAL? ,LOWER-ELEVATOR-UP T>>
		       <ALREADY-OPEN>)
		      (<AND <FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,HERE ,WAITING-AREA>
			    <EQUAL? ,LOWER-ELEVATOR-UP <>>>
		       <ALREADY-OPEN>)
		      (T
		       <TELL "It won't budge." CR>)>)
	       (<VERB? CLOSE>
		<COND (<AND <FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,HERE ,ELEVATOR-LOBBY>
			    <EQUAL? ,LOWER-ELEVATOR-UP T>>
		       <TELL "You can't close it yourself." CR>)
		      (<AND <FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>
			    <EQUAL? ,HERE ,WAITING-AREA>
			    <EQUAL? ,LOWER-ELEVATOR-UP <>>>
		       <TELL "You can't close it yourself." CR>)
		      (T
		       <IS-CLOSED>)>)>>

<ROUTINE DOOR-CLOSED ()
	 <TELL "The door is closed." CR>>

<OBJECT BLUE-ELEVATOR-BUTTON
	(LOC ELEVATOR-LOBBY)
	(DESC "blue button")
	(SYNONYM BUTTON)
	(ADJECTIVE BLUE NORTH)
	(FLAGS NDESCBIT)
	(ACTION BLUE-ELEVATOR-BUTTON-F)>

<OBJECT RED-ELEVATOR-BUTTON
	(LOC ELEVATOR-LOBBY)
	(DESC "red button")
	(SYNONYM BUTTON)
	(ADJECTIVE RED SOUTH)
	(FLAGS NDESCBIT)
	(ACTION RED-ELEVATOR-BUTTON-F)>

<ROUTINE BLUE-ELEVATOR-BUTTON-F ()
	 <COND (<AND <VERB? PUSH>
		     <EQUAL? ,UPPER-ELEVATOR-UP T>>
		<COND (<EQUAL? <GET <INT I-UPPER-ELEVATOR-ARRIVE> ,C-ENABLED?> 1>
		       <TELL "Patience, patience..." CR>)
		      (T
		       <ENABLE<QUEUE I-UPPER-ELEVATOR-ARRIVE<+<RANDOM 20> 40>>>
		       <TELL
"You hear a faint whirring noise from behind the blue door." CR>)>)>>

<ROUTINE RED-ELEVATOR-BUTTON-F ()
	 <COND (<AND <VERB? PUSH>
		     <EQUAL? ,LOWER-ELEVATOR-UP <>>>
	        <COND (<EQUAL? <GET <INT I-LOWER-ELEVATOR-ARRIVE> ,C-ENABLED?> 1>
		       <TELL "Patience, patience..." CR>)
		      (T
		       <ENABLE<QUEUE I-LOWER-ELEVATOR-ARRIVE<+<RANDOM 40> 80>>>
		       <TELL "The red door begins vibrating a bit." CR>)>)>>

<ROUTINE I-UPPER-ELEVATOR-ARRIVE ()
	 <FSET ,UPPER-ELEVATOR-DOOR ,OPENBIT>
	 <SETG UPPER-ELEVATOR-UP <>>
	 <DISABLE <INT I-UPPER-ELEVATOR-ARRIVE>>
	 <COND (<EQUAL? ,HERE ,ELEVATOR-LOBBY>
		<TELL CR 
"The door at the north end of the room slides open." CR>)
	       (T
		<RFALSE>)>>

<ROUTINE I-LOWER-ELEVATOR-ARRIVE ()
	 <FSET ,LOWER-ELEVATOR-DOOR ,OPENBIT>
	 <SETG LOWER-ELEVATOR-UP T>
	 <DISABLE <INT I-LOWER-ELEVATOR-ARRIVE>>
	 <COND (<EQUAL? ,HERE ,ELEVATOR-LOBBY>
		<TELL CR
"The door at the south end of the room slides open." CR>)
	       (T
		<RFALSE>)>>

<OBJECT ELEVATOR-BUTTON
	(LOC LOCAL-GLOBALS)
	(DESC "button")
	(SYNONYM BUTTON)
	(FLAGS NDESCBIT)
	(ACTION ELEVATOR-BUTTON-F)>

;"*-ELEVATOR-UP should be <> if elevator is at bottom of shaft and T if
elevator is at top of shaft"

<GLOBAL LOWER-ELEVATOR-UP <>>

<GLOBAL UPPER-ELEVATOR-UP T>

<GLOBAL ELEVATOR-IN-TRANSIT <>> ;"should be T if elevator is in transit"

<GLOBAL LOWER-ELEVATOR-ON <>> ;"elevator enabled by card in slot?"

<GLOBAL UPPER-ELEVATOR-ON <>> ;"elevator enabled by card in slot?"

<ROUTINE ELEVATOR-BUTTON-F ()
	 <COND (<VERB? PUSH-UP>
		<COND (<AND <EQUAL? ,HERE ,LOWER-ELEVATOR>
			    <EQUAL? ,LOWER-ELEVATOR-UP <>>
			    <EQUAL? ,LOWER-ELEVATOR-ON T>
			    <EQUAL? ,ELEVATOR-IN-TRANSIT <>>>
		       <TELL ,ELEVATOR-STARTS CR>
		       <FCLEAR ,LOWER-ELEVATOR-DOOR ,OPENBIT>
		       <SETG ELEVATOR-IN-TRANSIT T>
		       <ENABLE <QUEUE I-LOWER-ELEVATOR-TRIP 100>>)
		      (<AND <EQUAL? ,HERE ,UPPER-ELEVATOR>
			    <EQUAL? ,UPPER-ELEVATOR-UP <>>
			    <EQUAL? ,UPPER-ELEVATOR-ON T>
			    <EQUAL? ,ELEVATOR-IN-TRANSIT <>>>
		       <TELL ,ELEVATOR-STARTS CR>
		       <FCLEAR ,UPPER-ELEVATOR-DOOR ,OPENBIT>
		       <SETG ELEVATOR-IN-TRANSIT T>
		       <ENABLE <QUEUE I-UPPER-ELEVATOR-TRIP 50>>)
		      (T
		       <TELL "Nothing happens." CR>)>)
	       (<VERB? PUSH-DOWN>
		<COND (<AND <EQUAL? ,HERE ,LOWER-ELEVATOR>
			    <EQUAL? ,LOWER-ELEVATOR-UP T>
			    <EQUAL? ,LOWER-ELEVATOR-ON T>
			    <EQUAL? ,ELEVATOR-IN-TRANSIT <>>>
		       <TELL ,ELEVATOR-STARTS CR>
		       <FCLEAR ,LOWER-ELEVATOR-DOOR ,OPENBIT>
		       <SETG ELEVATOR-IN-TRANSIT T>
		       <ENABLE <QUEUE I-LOWER-ELEVATOR-TRIP 100>>)
		      (<AND <EQUAL? ,HERE ,UPPER-ELEVATOR>
			    <EQUAL? ,UPPER-ELEVATOR-UP T>
			    <EQUAL? ,UPPER-ELEVATOR-ON T>
			    <EQUAL? ,ELEVATOR-IN-TRANSIT <>>>
		       <TELL ,ELEVATOR-STARTS CR>
		       <FCLEAR ,UPPER-ELEVATOR-DOOR ,OPENBIT>
		       <SETG ELEVATOR-IN-TRANSIT T>
		       <ENABLE <QUEUE I-UPPER-ELEVATOR-TRIP 50>>)
		      (T
		       <TELL "Nothing happens." CR>)>)
	       (<VERB? PUSH>
		<TELL
"You must specify whether you want to push the Up button or
the Down button." CR>)>>

<ROUTINE I-TURNOFF-UPPER-ELEVATOR ()
	 <COND (,ELEVATOR-IN-TRANSIT
		<ENABLE <QUEUE I-TURNOFF-UPPER-ELEVATOR 120>>)
	       (T
		<SETG UPPER-ELEVATOR-ON <>>
		<COND (<EQUAL? ,HERE ,UPPER-ELEVATOR>
		       <TELL CR ,ELEVATOR-LIGHT-OFF CR>)>)>
	 <RFALSE>>

<ROUTINE I-TURNOFF-LOWER-ELEVATOR ()
	 <COND (,ELEVATOR-IN-TRANSIT
		<ENABLE <QUEUE I-TURNOFF-LOWER-ELEVATOR 120>>)
	       (T
		<SETG LOWER-ELEVATOR-ON <>>
		<COND (<EQUAL? ,HERE ,LOWER-ELEVATOR>
		       <TELL CR ,ELEVATOR-LIGHT-OFF CR>)>)>
	 <RFALSE>>

<CONSTANT ELEVATOR-LIGHT-OFF 
"A recording says \"Elevator no longer enabled.\"">

<CONSTANT ELEVATOR-STARTS
"The elevator door slides shut. After a moment, you feel a sensation of
vertical movement.">

<ROUTINE I-UPPER-ELEVATOR-TRIP ()
	 <COND (<EQUAL? ,UPPER-ELEVATOR-UP T>
		<SETG UPPER-ELEVATOR-UP <>>
		<SETG ELEVATOR-IN-TRANSIT <>>
		<FSET ,UPPER-ELEVATOR-DOOR ,OPENBIT>
		<CRLF>
		<ELEVATOR-DOOR-OPENS>)
	       (T
		<SETG UPPER-ELEVATOR-UP T>
		<SETG ELEVATOR-IN-TRANSIT <>>
		<FSET ,UPPER-ELEVATOR-DOOR ,OPENBIT>
		<CRLF>
		<ELEVATOR-DOOR-OPENS>)>>

<ROUTINE I-LOWER-ELEVATOR-TRIP ()
	 <COND (<EQUAL? ,LOWER-ELEVATOR-UP T>
		<SETG LOWER-ELEVATOR-UP <>>
		<SETG ELEVATOR-IN-TRANSIT <>>
		<FSET ,LOWER-ELEVATOR-DOOR ,OPENBIT>
		<CRLF>
		<ELEVATOR-DOOR-OPENS>)
	       (T
		<SETG LOWER-ELEVATOR-UP T>
		<SETG ELEVATOR-IN-TRANSIT <>>
		<FSET ,LOWER-ELEVATOR-DOOR ,OPENBIT>
		<CRLF>
		<ELEVATOR-DOOR-OPENS>)>>

<ROUTINE ELEVATOR-DOOR-OPENS ()
	 <TELL "The elevator door slides open." CR>>

<ROOM BOOTH-2
      (LOC ROOMS)
      (DESC "Booth 2")
      (LDESC
"This is a tiny room with a large \"2\" painted on the wall. A panel contains
a slot about ten centimeters wide, a brown button labelled \"1\" and a tan
button labelled \"3.\"")
      (WEST TO ELEVATOR-LOBBY)
      (OUT TO ELEVATOR-LOBBY)
      (FLAGS RLANDBIT ONBIT)
      (PSEUDO "BOOTH" IN-BOOTH-PSEUDO)
      (GLOBAL CONTROLS SLOT TELEPORTATION-BUTTON-1 TELEPORTATION-BUTTON-3)>

<ROOM TOWER-CORE
      (LOC ROOMS)
      (DESC "Tower Core")
      (LDESC
"This is a small, circular room. A sliding door leads north, and a spiral
staircase heads upwards. Other exits lie to the northeast and southwest.")
      (NORTH TO UPPER-ELEVATOR)
      (UP TO HELIPAD)
      (SW TO OBSERVATION-DECK)
      (NE TO COMM-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (VALUE 4)
      (GLOBAL STAIRS UPPER-ELEVATOR-DOOR)>

<ROOM HELIPAD
      (LOC ROOMS)
      (DESC "Helipad")
      (LDESC
"You are at the center of a wide, flat area atop the tower. A fence
prevents you from approaching the perimeter, so your view is limited to
cloud-filled sky. A large vehicle, severely weathered and topped with rotor
blades, lies nearby. A spiral staircase leads down into the tower.")
      (DOWN TO TOWER-CORE)
      (IN TO HELICOPTER)
      (EAST SORRY "A fence keeps you away from the edge, where you would
probably be swept over the brink by the high winds.")
      (WEST SORRY "A fence keeps you away from the edge, where you would
probably be swept over the brink by the high winds.")
      (NORTH SORRY "A fence keeps you away from the edge, where you would
probably be swept over the brink by the high winds.")
      (SOUTH SORRY "A fence keeps you away from the edge, where you would
probably be swept over the brink by the high winds.")
      (FLAGS RLANDBIT ONBIT)
      (PSEUDO "FENCE" FENCE-PSEUDO)
      (GLOBAL STAIRS HELICOPTER-OBJECT)>

<OBJECT HELICOPTER-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "large vehicle")
	(SYNONYM VEHICLE HELICOPTER)
	(ADJECTIVE LARGE)
	(FLAGS VEHBIT NDESCBIT)
	(ACTION HELICOPTER-OBJECT-F)>

<ROUTINE HELICOPTER-OBJECT-F ()
	 <COND (<VERB? THROUGH BOARD WALK-TO>
		<COND (<EQUAL? ,HERE ,HELIPAD>
		       <GOTO ,HELICOPTER>)
		      (T
		       <TELL "You're in it!" CR>)>)
	       (<VERB? EXIT DROP DISEMBARK>
		<COND (<EQUAL? ,HERE ,HELICOPTER>
		       <GOTO ,HELIPAD>)
		      (T
		       <TELL "You're not in it!" CR>)>)
	       (<VERB? FLY>
		<COND (<EQUAL? ,HERE ,HELICOPTER>
		       <TELL "The controls seem to be locked." CR>)
		      (T
		       <TELL "You're not even in it!" CR>)>)>>

<ROOM HELICOPTER
      (LOC ROOMS)
      (DESC "Helicopter")
      (LDESC
"This is a large vehicle with a lot of cargo space. A complex control panel
is closed and locked. Everything is covered with a thick layer of rust.
Through the windows of the vehicle you can see a wide Helipad, and beyond
that, endless ocean far below. Several doors lead out to the Helipad.")
      (OUT TO HELIPAD)
      (FLAGS RLANDBIT ONBIT)
      (PSEUDO "LOCK" LOCK-PSEUDO)
      (GLOBAL OCEAN CONTROLS WINDOW HELICOPTER-OBJECT)>

<ROOM COMM-ROOM
      (LOC ROOMS)
      (DESC "Comm Room")
      (SW TO TOWER-CORE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL LIGHTS)
      (PSEUDO "CABLES" CABLES-PSEUDO "ENUNCIATOR" ENUNCIATOR-PSEUDO)
      (ACTION COMM-ROOM-F)>

<ROUTINE COMM-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a small room with no windows. The sole exit is southwest. Two wide
consoles fill either end of the room; thick cables lead up into the ceiling.|
|
The console on the left side of the room is labelled \"Reeseev Staashun.\" A
bright red light, labelled \"Tranzmishun Reeseevd\", is blinking rapidly.
Next to the light is a glowing button marked \"Mesij Plaabak.\"|
|
The console on the right side of the room is labelled \"Send Staashun.\" A
screen on the console displays a message. Next to the screen is a flashing
sign which says ">
		<COND (,COMM-SHUTDOWN
		       <SHUTDOWN>)
		      (,COMM-FIXED
		       <TELL "\"Tranzmishun in pragres.\"">)
		      (T
		       <TELL "\"Malfunkshun in Sendeeng Kuulint Sistum.\"">)>
		<TELL " Next to this console is an enunciator">
		<COND (<OR ,COMM-FIXED ,COMM-SHUTDOWN>
		       <TELL " whose lights are all dark">)>
		<TELL
". On the console next to the enunciator panel is a funnel-shaped hole
labelled \"Kuulint Sistum Manyuuwul Oovuriid.\"" CR>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <NOT ,COMM-FIXED>
		     <NOT ,COMM-SHUTDOWN>
		     ,JUST-ENTERED>
		<ENABLE <QUEUE I-UNENTER -1>>
		<SETG JUST-ENTERED <>>
	        <TELL "A ">
		<COND (<EQUAL? ,CHEMICAL-REQUIRED 1>
		       <TELL "red">)
		      (<EQUAL? ,CHEMICAL-REQUIRED 2>
		       <TELL "blue">)
		      (<EQUAL? ,CHEMICAL-REQUIRED 3>
		       <TELL "green">)
		      (<EQUAL? ,CHEMICAL-REQUIRED 4>
		       <TELL "yellow">)
		      (<EQUAL? ,CHEMICAL-REQUIRED 5>
		       <TELL "gray">)
		      (<EQUAL? ,CHEMICAL-REQUIRED 6>
		       <TELL "brown">)
		      (<EQUAL? ,CHEMICAL-REQUIRED 7>
		       <TELL "black">)>
		<TELL
" colored light flashes briefly on the enunciator panel." CR>)>>

<GLOBAL JUST-ENTERED T>

<ROUTINE I-UNENTER ()
	 <COND (<NOT <EQUAL? ,HERE ,COMM-ROOM>>
		<SETG JUST-ENTERED T>
		<DISABLE <INT I-UNENTER>>)>
	 <RFALSE>>

<OBJECT RECEIVE-CONSOLE
	(LOC COMM-ROOM)
	(DESC "communications receive console")
	(SYNONYM CONSOLE CONTROL)
	(ADJECTIVE COMMUNICATIONS RECEIVE LEFT FIRST)
	(FLAGS NDESCBIT)>

<OBJECT PLAYBACK-BUTTON
	(LOC COMM-ROOM)
	(DESC "glowing button")
	(SYNONYM BUTTON)
	(ADJECTIVE GLOWING PLAYBACK)
	(FLAGS NDESCBIT)
	(ACTION PLAYBACK-BUTTON-F)>

<ROUTINE PLAYBACK-BUTTON-F ()
	 <COND (<VERB? PUSH>
		<TELL
"A voice fills the room... the voice of the Feinstein's communications
officer! \"Stellar Patrol Ship Feinstein to planetside... Please respond
on frequency 48.5... S.P.S. Feinstein to planetside... Please come in...\"
After a pause you hear the officer, in a quieter voice, say \"Admiral, no
response on any of the standard frequen--\" The sentence is cut short by the
sound of an explosion and a loud burst of static, followed by silence." CR>)>>

<OBJECT SEND-CONSOLE
	(LOC COMM-ROOM)
	(DESC "communication send console")
	(SYNONYM CONSOLE CONTROL)
	(ADJECTIVE COMMUNICATIONS SEND RIGHT SECOND)
	(FLAGS NDESCBIT)>

<OBJECT COMM-SCREEN
	(LOC COMM-ROOM)
	(DESC "screen")
	(SYNONYM COMMUNICATIONS MESSAGE SCREEN)
	(FLAGS NDESCBIT READBIT)
	(TEXT
"\"Tuu enee ship uv xe Sekund Galaktik Yuunyun: Planitwiid plaag haz struk
entiir popyuulaashun. Tiim iz kritikul. Eemurjensee asistins reekwestid.
<reepeet mesij>\"")>

<OBJECT FUNNEL-HOLE
	(LOC COMM-ROOM)
	(DESC "funnel-shaped hole")
	(SYNONYM HOLE)
	(ADJECTIVE FUNNEL SHAPED FUNNEL-SHAPED)
	(FLAGS NDESCBIT)>

<OBJECT CHEMICAL-FLUID
	(DESC "quantity of chemical fluid")
	(SYNONYM QUANTITY LIQUID FLUID CHEMICAL)
	(ADJECTIVE MILKY WHITE CHEMICAL)
   (FLAGS LIQUIDBIT)
	(ACTION CHEMICAL-FLUID-F)>

<ROUTINE RANDOMIZE-ORDER ("AUX" (COUNT 0) TEMP)
	 <REPEAT ()
		 <COND (<G? <SET COUNT <+ .COUNT 1>> 7>
			<RETURN>)
		       (T
			<PUT ,ORDER-LTBL .COUNT <>>)>>
	 <SET COUNT 0>
	 <REPEAT ()
		 <COND (<G? <SET COUNT <+ .COUNT 1>> 7>
			<RETURN>)
		       (T
			<SET TEMP <RANDOM 7>>
			<COND (<OR <EQUAL? .TEMP <GET ,ORDER-LTBL 1>
					         <GET ,ORDER-LTBL 2>
					         <GET ,ORDER-LTBL 3>>
				   <EQUAL? .TEMP <GET ,ORDER-LTBL 4>
					         <GET ,ORDER-LTBL 5>
						 <GET ,ORDER-LTBL 6>>
				   <EQUAL? .TEMP <GET ,ORDER-LTBL 7>>>
			       <SET COUNT <- .COUNT 1>>)
			      (T
			       <PUT ,ORDER-LTBL .COUNT .TEMP>)>)>>>

<GLOBAL ORDER-LTBL
	<LTABLE 0 0 0 0 0 0 0>>

<GLOBAL STEPS-TO-GO 0>

<ROUTINE CHEMICAL-FLUID-F ()
	 <COND (<VERB? EAT>
		<JIGS-UP
"Mmmmm... that tasted just like delicious poisonous chemicals!">)
	       (<AND <VERB? PUT>
		     <EQUAL? ,PRSI ,CHEMICAL-FLUID>>
		<PERFORM ,V?PUT ,PRSO ,FLASK>
		<RTRUE>)
	       (<AND <VERB? THROW POUR>
		     <OR <EQUAL? ,PRSI ,RAT-ANT ,TROLL>
			 <EQUAL? ,PRSI ,GRUE ,TRIFFID>>>
		<COND (<NOT <HELD? ,FLASK>>
		       <TELL "You're not holding the flask." CR>
		       <RTRUE>)>
		<REMOVE ,CHEMICAL-FLUID>
		<TELL
"The mutants lap up the chemical, howling with delight. One immediately
grows three new mouths." CR>)
	       (<VERB? PUT POUR>
		<COND (<AND <NOT <HELD? ,FLASK>> <NOT <EQUAL? ,PRSI ,SPOUT-PLACED>>>
		       <TELL "You're not holding the flask." CR>
		       <RTRUE>)
		      (<EQUAL? ,PRSI ,CANTEEN>
		       <WORTHLESS-ACTION>
		       <RTRUE>)>
		<REMOVE ,CHEMICAL-FLUID>
		<COND (<NOT ,PRSI>
		       <SETG PRSI ,GROUND>)>
		<COND (<EQUAL? ,PRSI ,FUNNEL-HOLE>
		       <COND (<EQUAL? ,CHEMICAL-FLAG ,CHEMICAL-REQUIRED>
			      <SETG CHEMICAL-REQUIRED 
				    <GET ,ORDER-LTBL ,STEPS-TO-GO>>
			      <SETG STEPS-TO-GO <- ,STEPS-TO-GO 1>>
			      <TELL
"The liquid disappears into the hole. The lights on the enunciator
panel blink rapidly ">
			      <COND (<EQUAL? ,STEPS-TO-GO 0>
				     <SETG COMM-FIXED T>
				     <SETG SCORE <+ ,SCORE 6>>
				     <SETG CHEMICAL-REQUIRED 10>
				     <TELL
"and then go dark. The coolant system warning light goes off, and another
flashes, indicating that the help message is now being sent." CR>)
				    (T
				     <TELL "and all go off except one, a ">
				     <COND (<EQUAL? ,CHEMICAL-REQUIRED 1>
					    <TELL "red">)
					   (<EQUAL? ,CHEMICAL-REQUIRED 2>
					    <TELL "blue">)
					   (<EQUAL? ,CHEMICAL-REQUIRED 3>
					    <TELL "green">)
					   (<EQUAL? ,CHEMICAL-REQUIRED 4>
					    <TELL "yellow">)
					   (<EQUAL? ,CHEMICAL-REQUIRED 5>
					    <TELL "gray">)
					   (<EQUAL? ,CHEMICAL-REQUIRED 6>
					    <TELL "brown">)
					   (<EQUAL? ,CHEMICAL-REQUIRED 7>
					    <TELL "black">)>
				     <TELL " light." CR>)>)
			     (T
			      <SETG COMM-SHUTDOWN T>
			      <COND (,COMM-FIXED
				     <SETG SCORE <- ,SCORE 6>>
				     <SETG COMM-FIXED <>>)>
			      <TELL
"An alarm sounds briefly, and a sign flashes ">
			      <SHUTDOWN>
			      <TELL 
" A moment later, the lights in the room dim and the send
console shuts down." CR>)>)
		      (<EQUAL? ,CHEMICAL-FLAG 8 9>
		       <COND (<FSET? ,PRSI ,ACIDBIT>
			      <COND (<EQUAL? ,PRSI ,SPOUT-PLACED>
				     <SETG SPOUT-PLACED ,GROUND>)>
			      <REMOVE ,PRSI>
			      <TELL
"The " D ,PRSI " dissolves right before your eyes!">
			      <COND (<AND <EQUAL? ,PRSI ,BAD-BEDISTOR>
					 <NOT <FSET? ,BAD-BEDISTOR ,TOUCHBIT>>>
				     <FSET ,CUBE ,MUNGEDBIT>
				     <CUBE-SEEMS>)
				    (<AND <EQUAL? ,PRSI ,GOOD-BEDISTOR>
					  ,COURSE-CONTROL-FIXED>
				     <FSET ,CUBE ,MUNGEDBIT>
				     <SETG SCORE <- ,SCORE 6>>
				     <SETG COURSE-CONTROL-FIXED <>>
				     <CUBE-SEEMS>)>
			      <CRLF>
			      <RTRUE>)
			     (<AND <EQUAL? ,CREVICE ,PRSI>
				   <NOT <FSET? ,KEY ,TOUCHBIT>>>
			      <COND (<FSET? ,KEY ,INVISIBLE>
				     <TELL
"A puff of smoke rises from the crevice." CR>)
				    (T
				     <TELL
"Although the chemical has no effect on the crevice, it does seem to have
dissolved the key that was lying in it." CR>)>
			      <REMOVE ,KEY>
			      <FSET ,KEY ,TOUCHBIT>
			      <FCLEAR ,KEY ,INVISIBLE>)
			     (<EQUAL? ,PRSI ,HIGH-PROTEIN ,MEDICINE>
			      <JIGS-UP
"Unfortunately, those two liquids seem to react quite violently with each
other. The resulting exothermic reaction might have been interesting to
watch from a distance of, say, several hundred feet.">)
			     (<EQUAL? ,PRSI ,ME ,ADVENTURER ,HANDS>
			      <JIGS-UP
"Have you always had this desire to see melting flesh?">)
			     (<AND <EQUAL? ,PRSI ,FLOYD>
				   <FSET? ,FLOYD ,RLANDBIT>>
			      <TELL
"Floyd yelps. \"Hey, cut it out! That stuff burns!\"" CR>)
			     (<EQUAL? ,PRSI ,MICROBE>
			      <TELL "The microbe writhes in pain. ">
			      <STRIP-DISSOLVES>)
			     (<EQUAL? ,PRSI ,STRIP ,RELAY>
			      <STRIP-DISSOLVES>)
			     (<FSET? ,PRSI ,MUNGBIT>
			      <FSET ,PRSI ,MUNGEDBIT>
			      <COND (<EQUAL? ,PRSI ,CHRONOMETER>
				     <SETG MUNGED-TIME ,INTERNAL-MOVES>)>
			      <TELL
"The " D ,PRSI " seems to undergo some damage as a result of your action." CR>
			      <COND (<AND <EQUAL? ,PRSI ,CUBE>
					  ,COURSE-CONTROL-FIXED>
				     <SETG COURSE-CONTROL-FIXED <>>
				     <REMOVE ,GOOD-BEDISTOR>
				     <SETG SCORE <- ,SCORE 6>>
				     <TELL
"The bedistor also happens to dissolve." CR>)>
			      <RTRUE>)
			     (T
			      <CHEMICAL-POURS>)>)
		      (T
		       <CHEMICAL-POURS>)>)>>

<ROUTINE CUBE-SEEMS ()
	 <TELL
" Unfortunately, the cube seems to undergo some damage as well.">>

<ROUTINE CHEMICAL-POURS ()
	 <TELL
"The chemical pours all over the " D ,PRSI ", making quite a mess." CR>>

<ROUTINE STRIP-DISSOLVES ()
	 <JIGS-UP
"The chemical drips all over the silicon strip, which immediately begins to
dissolve. As it does so, you plunge into the void below.">> 

<GLOBAL COMM-SHUTDOWN <>>

<ROUTINE SHUTDOWN ()
	 <TELL
"\"Kuulint Sistum Imbalins Kritikul -- Shuteeng Down Awl Sistumz.\"">>

<ROUTINE COMM-SETUP () ;"was called by GO - now by I-RANDOM-INTERRUPTS"
	 <SETG OLD-SHOTS <+ 2 <RANDOM 3>>>
	 <SETG NEW-SHOTS <+ 20 <RANDOM 10>>>
	 <RANDOMIZE-ORDER>
	 <SETG STEPS-TO-GO <+ 1 <RANDOM 2>>>
	 <SETG CHEMICAL-REQUIRED <GET ,ORDER-LTBL <+ ,STEPS-TO-GO 1>>>>

<GLOBAL COMM-FIXED <>>

<GLOBAL CHEMICAL-REQUIRED 0>


<ROOM OBSERVATION-DECK
      (LOC ROOMS)
      (DESC "Observation Deck")
      (LDESC
"This is a balcony girdling the tower. The view is breathtaking; the tower
must be half a kilometer tall. From here it is clear that you are on an
island. The dormitory section of the complex is visible on the other side
of the island, and the rest of the complex sprawls out directly below. In
the distance, about 20 kilometers to the east, you can spot another island
similar to this one. The only exit is a doorway leading northeast.")
      (NE TO TOWER-CORE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL OCEAN)>

<ROOM WAITING-AREA
      (LOC ROOMS)
      (DESC "Waiting Area")
      (LDESC
"This is a concrete platform sparsely furnished with benches. The platform
continues to the east, and to the south is a metal door.")
      (EAST TO KALAMONTEE-PLATFORM)
      (SOUTH PER OTHER-ELEVATOR-ENTER-F)
      (IN PER OTHER-ELEVATOR-ENTER-F)
      (PSEUDO "BENCH" BENCH-PSEUDO "BENCHES" BENCH-PSEUDO)
      (GLOBAL LOWER-ELEVATOR-DOOR)
      (FLAGS RLANDBIT ONBIT)>

<ROUTINE OTHER-ELEVATOR-ENTER-F ()
	 <COND (<AND <FSET? ,LOWER-ELEVATOR-DOOR ,OPENBIT>
		     <NOT ,LOWER-ELEVATOR-UP>>
		,LOWER-ELEVATOR)
	       (T
		<DOOR-CLOSED>
		<THIS-IS-IT ,LOWER-ELEVATOR-DOOR>
		<RFALSE>)>>

<ROOM KALAMONTEE-PLATFORM
      (LOC ROOMS)
      (DESC "Kalamontee Platform")
      (WEST TO WAITING-AREA)
      (SOUTH PER SHUTTLE-ENTER-F)
      (NORTH PER SHUTTLE-ENTER-F)
      (FLAGS RLANDBIT ONBIT)
      (VALUE 4)
      (GLOBAL GLOBAL-SHUTTLE)
      (ACTION KALAMONTEE-PLATFORM-F)>

<ROUTINE KALAMONTEE-PLATFORM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a wide, flat strip of concrete which continues westward. ">
		<COND (<AND ,BETTY-AT-KALAMONTEE ,ALFIE-AT-KALAMONTEE>
		       <TELL
"Open shuttle cars lie on the north and south sides of the platform. ">)
		      (,BETTY-AT-KALAMONTEE
		       <TELL
"An open shuttle car lies to the north. ">)
		      (,ALFIE-AT-KALAMONTEE
		       <TELL
"A large transport of some sort lies to the south, its open door
beckoning you to enter. ">)>
		<TELL "A faded sign on the wall reads \"Shutul Platform --
Kalamontee Staashun.\"" CR>)>>