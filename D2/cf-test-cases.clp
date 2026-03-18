; -------------------------------------------------------------------
; ------------------- Uncertain Rules Test Cases --------------------
; -------------------------------------------------------------------

; Deterministic Rule 2: Fatigue-Based Practice Adjustment Revision 

; ------ Uncertain Rule U2A: High Fatigue + Long Session ------
(deffacts test-rule-U2A
   (well-being
      (user-id 1000)
      (fatigue-level high))
   (fatigue-confidence
      (user-id 1000)
      (value 0.8))
   (practice-habits
      (user-id 1000)
      (average-session-duration 120))
)

; ------ Uncertain Rule U2B: High Fatigue + Long Streak ------
(deffacts test-rule-U2B
   (well-being
      (user-id 1001)
      (fatigue-level high))
   (fatigue-confidence
      (user-id 1001)
      (value 0.9))
   (practice-habits
      (user-id 1001)
      (practice-streak 10)
      (average-session-duration 60))
)

; ------ Uncertain Rule U2C: General High Fatigue ------
(deffacts test-rule-U2C
   (well-being
      (user-id 1002)
      (fatigue-level high))
   (fatigue-confidence
      (user-id 1002)
      (value 0.85))
   (practice-habits
      (user-id 1002)
      (practice-streak 5)
      (average-session-duration 45))
)

; Deterministic Rule 3: Motivation Recovery Revision 

; ------ Uncertain Rule U3A: Low Motivation + High Fatigue ------
(deffacts test-rule-U3A
   (well-being
      (user-id 1003)
      (motivation-level low)
      (fatigue-level high))
   (motivation-confidence
      (user-id 1003)
      (value 0.7))
   (fatigue-confidence
      (user-id 1003)
      (value 0.8))
)

; ------ Uncertain Rule U3B: Low Motivation + Short Streak ------
(deffacts test-rule-U3B
   (well-being
      (user-id 1004)
      (motivation-level low))
   (motivation-confidence
      (user-id 1004)
      (value 0.75))
   (practice-habits
      (user-id 1004)
      (practice-streak 2))
    (consistency-confidence
      (user-id 1004)
      (value 0.6))
)