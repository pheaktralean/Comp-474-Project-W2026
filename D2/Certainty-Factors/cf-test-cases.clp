; -------------------------------------------------------------------
; ------------------- Certainty Factor Rules Test Cases -------------
; -------------------------------------------------------------------

; --------------------------------------------------------------------
; Deterministic Rule 2 Extension (Uncertainty Modeling with CF)
; Original: Fatigue-Based Practice Adjustment
; --------------------------------------------------------------------

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
      (value 0.7))
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

; --------------------------------------------------------------------
; Deterministic Rule 3 Extension (Uncertainty Modeling with CF)
; Original: Motivation Recovery 
; --------------------------------------------------------------------

; ------ Uncertain Rule U3A: Low Motivation + High Fatigue ------
(deffacts test-rule-U3A
   (well-being
      (user-id 1003)
      (motivation-level low)
      (fatigue-level high))
   (motivation-confidence
      (user-id 1003)
      (value 0.28))
   (fatigue-confidence
      (user-id 1003)
      (value 0.6))
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

; --------------------------------------------------------------------
; Deterministic Rule 6 Extension (Uncertainty Modeling with CF)
; Original: Reduce Problem Difficulty for High Failure Rate
; --------------------------------------------------------------------

; -- Test case U6: Reduce Difficulty After Failure --
(deffacts test-rule-U6
   (leetcode-performance
      (user-id 1006)
      (recent-failure-rate high))
   (failure-confidence
      (user-id 1006)
      (value 0.85))
   (leetcode-skill
      (user-id 1006)
      (current-problem-difficulty medium))
)

; --------------------------------------------------------------------
; Deterministic Rule 7 Extension (Uncertainty Modeling with CF)
; Original: Increase Difficulty After Success
; --------------------------------------------------------------------

; -- Test case U7: Increase Difficulty After Success --
(deffacts test-rule-U7
   (leetcode-performance
      (user-id 1007)
      (recent-success-rate high))
   (success-confidence
      (user-id 1007)
      (value 0.9))
   (leetcode-skill
      (user-id 1007)
      (current-problem-difficulty easy))
)

; --------------------------------------------------------------------
; Deterministic Rule 8 Extension (Uncertainty Modeling with CF)
; Original: Switch from Hard After Low Success
; --------------------------------------------------------------------

; -- Test case U8: Switch from Hard After Low Success --
(deffacts test-rule-U8
   (leetcode-performance
      (user-id 1008)
      (recent-success-rate low))
   (success-confidence
      (user-id 1008)
      (value 0.85))
   (leetcode-skill
      (user-id 1008)
      (current-problem-difficulty hard))
)

; --------------------------------------------------------------------
; Deterministic Rule 10 Extension (Uncertainty Modeling with CF)
; Original: Allow Harder Problems for Intermediate
; --------------------------------------------------------------------

; -- Test case U10: Intermediate Advancement with Certainty Factors --
(deffacts test-rule-U10
   (leetcode-skill
      (user-id 1005)
      (leetcode-experience-level intermediate)
      (current-problem-difficulty medium))
   (leetcode-performance
      (user-id 1005)
      (recent-success-rate high))
   (success-confidence
      (user-id 1005)
      (value 0.8))
   (practice-habits
      (user-id 1005)
      (practice-regularity consistent))
   (consistency-confidence
      (user-id 1005)
      (value 0.9))
)

; --------------------------------------------------------------------
; Deterministic Rule 12 Extension (Uncertainty Modeling with CF)
; Original: Mock Interview Urgency
; --------------------------------------------------------------------

; -- Test case U12A: Mock Interview Urgency --
(deffacts test-rule-U12A
   (practice-habits
      (user-id 1011)
      (days-until-interview 5))
   (user-profile
      (user-id 1011)
      (career-goal internship))
   (leetcode-performance
      (user-id 1011)
      (mock-interviews-completed 1))
   (readiness-confidence
      (user-id 1011)
      (value 0.85))
)

; -- Test case U12B: Interview Readiness for Medium-Level Problems --
(deffacts test-rule-U12B
   (practice-habits
      (user-id 1012)
      (days-until-interview 7))
   (user-profile
      (user-id 1012)
      (career-goal internship))
   (leetcode-skill
      (user-id 1012)
      (problems-solved-count 60))
   (leetcode-performance
      (user-id 1012)
      (recent-success-rate high))
   (readiness-confidence
      (user-id 1012)
      (value 0.9))
)

; -- Test case U12C: Strengthen Fundamentals --
(deffacts test-rule-U12C
   (practice-habits
      (user-id 1013)
      (days-until-interview 6))
   (user-profile
      (user-id 1013)
      (career-goal internship))
   (leetcode-skill
      (user-id 1013)
      (problems-solved-count 35))
   (readiness-confidence
      (user-id 1013)
      (value 0.8))
)
