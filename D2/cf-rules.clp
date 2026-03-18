; --------------------------------------------------------------------
; ------------------------ Uncertain Rules  --------------------------
; --------------------------------------------------------------------

; Deterministic Rule 2: Fatigue-Based Practice Adjustment Revision 

; ------ Uncertain Rule U2A: High Fatigue + Long Session ------
(defrule rule-U2A-fatigue-long-sessions
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (fatigue-confidence
      (user-id ?id)
      (value ?cf))
   (practice-habits
      (user-id ?id)
      (average-session-duration ?duration&:(> ?duration 90)))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U2A")
         (category "well-being-management")
         (advice "Shorten practice sessions to manage fatigue.")
         (reason "high-fatigue-long-sessions")
         (confidence ?cf)))
)

; ------ Uncertain Rule U2B: High Fatigue + Long Streak ------
(defrule rule-U2B-fatigue-long-streak
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (fatigue-confidence
      (user-id ?id)
      (value ?cf))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(> ?streak 7))
      (average-session-duration ?duration&:(<= ?duration 90)))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U2B")
         (category "well-being-management")
         (advice "Consider taking a break to prevent burnout.")
         (reason "high-fatigue-long-streak")
         (confidence ?cf)))
)

; ------ Uncertain Rule U2C: High Fatigue + Low Motivation ------
(defrule rule-U2C-general-high-fatigue
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (fatigue-confidence
      (user-id ?id)
      (value ?cf))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(<= ?streak 7))
      (average-session-duration ?duration&:(<= ?duration 90)))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U2C")
         (category "well-being-management")
         (advice "Reduce practice intensity and focus on lighter problems.")
         (reason "general-high-fatigue")
         (confidence ?cf)))
)

; Deterministic Rule 3: Motivation Recovery Revision 

; ------ Uncertain Rule U3A: Low Motivation + High Fatigue ------
(defrule rule-U3A-low-motivation-high-fatigue
   (well-being
      (user-id ?id)
      (motivation-level low)
      (fatigue-level high))
   (motivation-confidence
      (user-id ?id)
      (value ?cf1))
   (fatigue-confidence
      (user-id ?id)
      (value ?cf2))
=>
   (bind ?combined-cf (* ?cf1 ?cf2))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U3A")
         (category "well-being-management")
         (advice "Set small, achievable goals to rebuild momentum.")
         (reason "low-motivation-high-fatigue")
         (confidence ?combined-cf)))
)

; ------ Uncertain Rule U3B: Low Motivation + Short Streak ------
(defrule rule-U3B-low-motivation-short-streak
   (well-being
      (user-id ?id)
      (motivation-level low))
   (motivation-confidence
      (user-id ?id)
      (value ?cf1))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(< ?streak 3)))
   (consistency-confidence
      (user-id ?id)
      (value ?cf2))
=>
   (bind ?combined-cf (* ?cf1 ?cf2))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U3B")
         (category "well-being-management")
         (advice "Set small, achievable goals to rebuild momentum.")
         (reason "low-motivation-short-streak")
         (confidence ?combined-cf)))
)
