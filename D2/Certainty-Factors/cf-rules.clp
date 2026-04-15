; --------------------------------------------------------------------
; ------------------------ Uncertain Rules  --------------------------
; --------------------------------------------------------------------

; --------------------------------------------------------------------
; Deterministic Rule 2 Extension (Uncertainty Modeling with CF)
; Original: Fatigue-Based Practice Adjustment
; --------------------------------------------------------------------

; ------ Uncertain Rule U2A: High Fatigue + Long Session ------
(defrule rule-U2A-fatigue-long-sessions
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (fatigue-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
   (practice-habits
      (user-id ?id)
      (average-session-duration ?duration&:(> ?duration 90)))
=>
   (bind ?rule-cf 0.90)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U2A")
         (category "well-being-management")
         (advice "Shorten practice sessions to manage fatigue.")
         (reason "high-fatigue-long-sessions")
         (confidence ?final-cf)))
)

; ------ Uncertain Rule U2B: High Fatigue + Long Streak ------
(defrule rule-U2B-fatigue-long-streak
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (fatigue-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(> ?streak 7))
      (average-session-duration ?duration&:(<= ?duration 90)))
=> 
   (bind ?rule-cf 0.80)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U2B")
         (category "well-being-management")
         (advice "Consider taking a break to prevent burnout.")
         (reason "high-fatigue-long-streak")
         (confidence ?final-cf)))
)

; ------ Uncertain Rule U2C: General High Fatigue ------
(defrule rule-U2C-general-high-fatigue
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (fatigue-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(<= ?streak 7))
      (average-session-duration ?duration&:(<= ?duration 90)))
=>
   (bind ?rule-cf 0.70)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U2C")
         (category "well-being-management")
         (advice "Reduce practice intensity and focus on lighter problems.")
         (reason "general-high-fatigue")
         (confidence ?final-cf)))
)

; --------------------------------------------------------------------
; Deterministic Rule 3 Extension (Uncertainty Modeling with CF)
; Original: Motivation Recovery 
; --------------------------------------------------------------------

; ------ Uncertain Rule U3A: Low Motivation + High Fatigue ------
(defrule rule-U3A-low-motivation-high-fatigue
   (well-being
      (user-id ?id)
      (motivation-level low)
      (fatigue-level high))
   (motivation-confidence
      (user-id ?id)
      (value ?cf1&:(< ?cf1 0.3))) ; Low motivation confidence
   (fatigue-confidence
      (user-id ?id)
      (value ?cf2&:(> ?cf2 0.5))) ; High fatigue confidence
=>
   (bind ?evidence-cf (min ?cf1 ?cf2))
   (bind ?rule-cf 0.80)
   (bind ?final-cf (* ?evidence-cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U3A")
         (category "well-being-management")
         (advice "Set small, achievable goals to rebuild momentum.")
         (reason "low-motivation-high-fatigue")
         (confidence ?final-cf)))
)

; ------ Uncertain Rule U3B: Low Motivation + Short Streak ------
(defrule rule-U3B-low-motivation-short-streak
   (well-being
      (user-id ?id)
      (motivation-level low))
   (motivation-confidence
      (user-id ?id)
      (value ?cf1&:(> ?cf1 0.5)))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(< ?streak 3)))
   (consistency-confidence
      (user-id ?id)
      (value ?cf2&:(> ?cf2 0.5)))
=>
   (bind ?evidence-cf (* ?cf1 ?cf2))
   (bind ?rule-cf 0.70)
   (bind ?final-cf (* ?evidence-cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U3B")
         (category "well-being-management")
         (advice "Set small, achievable goals to rebuild momentum.")
         (reason "low-motivation-short-streak")
         (confidence ?final-cf)))
)

; --------------------------------------------------------------------
; Deterministic Rule 6 Extension (Uncertainty Modeling with CF)
; Original: Reduce Problem Difficulty for High Failure Rate
; --------------------------------------------------------------------

; --------- Uncertain Rule U6: High Failure Rate -----------
(defrule rule-U6-reduce-difficulty-after-failure
   (leetcode-performance
      (user-id ?id)
      (recent-failure-rate high))
   (failure-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty medium))
=>
   (bind ?rule-cf 0.75)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U6")
         (category "difficulty-selection")
         (advice "Reduce difficulty to easy.")
         (reason "high-failure-rate-medium-difficulty")
         (confidence ?final-cf)))
) 

; --------------------------------------------------------------------
; Deterministic Rule 7 Extension (Uncertainty Modeling with CF)
; Original: Increase Difficulty After Success
; --------------------------------------------------------------------

; ------ Uncertain Rule U7: High Success Rate ------
(defrule rule-U7-increase-difficulty-after-success
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate high))
   (success-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty easy))
=>
   (bind ?rule-cf 0.80)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U7")
         (category "difficulty-selection")
         (advice "Consider trying medium difficulty problems.")
         (reason "high-success-rate-easy-difficulty")
         (confidence ?final-cf)))
)

; --------------------------------------------------------------------
; Deterministic Rule 8 Extension (Uncertainty Modeling with CF)
; Original: Switch from Hard After Low Success
; --------------------------------------------------------------------

; ------ Uncertain Rule U8: Low Success Rate ------
(defrule rule-U8-switch-from-hard
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate low))
   (success-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty hard))
=>
   (bind ?rule-cf 0.85)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U8")
         (category "difficulty-selection")
         (advice "Consider switching to medium difficulty problems.")
         (reason "low-success-rate-hard-difficulty")
         (confidence ?final-cf)))
)

; --------------------------------------------------------------------
; Deterministic Rule 10 Extension (Uncertainty Modeling with CF)
; Original: Allow Harder Problems for Intermediate
; --------------------------------------------------------------------

; ------ Uncertain Rule U10: Intermediate Advancement ------
(defrule rule-U10-intermediate-advance
   (leetcode-skill
      (user-id ?id)
      (leetcode-experience-level intermediate)
      (current-problem-difficulty ?difficulty&:(or (eq ?difficulty easy)
                                                   (eq ?difficulty medium))))
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate high))
   (success-confidence
      (user-id ?id)
      (value ?cf1&:(> ?cf1 0.5)))
   (practice-habits
      (user-id ?id)
      (practice-regularity consistent))
   (consistency-confidence
      (user-id ?id)
      (value ?cf2&:(> ?cf2 0.5)))
=>
   (bind ?evidence-cf (min ?cf1 ?cf2))
   (bind ?rule-cf 0.85)
   (bind ?final-cf (* ?evidence-cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U10")
         (category "difficulty-selection")
         (advice "You may attempt harder problems to further enhance your skills.")
         (reason "consistent-high-performance")
         (confidence ?final-cf)))
)

; --------------------------------------------------------------------
; Deterministic Rule 12 Extension (Uncertainty Modeling with CF)
; Original: Mock Interview Urgency
; --------------------------------------------------------------------

; ------ Uncertain Rule U12A: High Urgency for Mock Interview ------
(defrule rule-U12A-mock-interview-urgency
   (practice-habits
      (user-id ?id)
      (days-until-interview ?days&:(<= ?days 14)))
   (user-profile
      (user-id ?id)
      (career-goal internship))
   (leetcode-performance
      (user-id ?id)
      (mock-interviews-completed ?mock-count&:(< ?mock-count 3)))
   (readiness-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
=>
   (bind ?rule-cf 0.95)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U12A")
         (category "interview-preparation")
         (advice "Prioritize mock interviews immediately.")
         (reason "interview-soon-low-mock-exposure")
         (confidence ?final-cf)))
)

; ------ Uncertain Rule U12B: Medium Interview Focus -------
(defrule rule-U12B-medium-interview-focus
   (practice-habits
      (user-id ?id)
      (days-until-interview ?days&:(<= ?days 14)))
   (user-profile
      (user-id ?id)
      (career-goal internship))
   (leetcode-skill
      (user-id ?id)
      (problems-solved-count ?count&:(>= ?count 50)))
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate ?rate&:(or (eq ?rate moderate)
                                      (eq ?rate high))))
   (readiness-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
=>
   (bind ?rule-cf 0.85)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U12B")
         (category "interview-preparation")
         (advice "Focus on medium-level interview problems.")
         (reason "interview-soon-ready-for-advancement")
         (confidence ?final-cf)))
)

; ------ Uncertain Rule U12C: Strengthen Fundamentals -------
(defrule rule-U12C-strengthen-fundamentals
   (practice-habits
      (user-id ?id)
      (days-until-interview ?days&:(<= ?days 14)))
   (user-profile
      (user-id ?id)
      (career-goal internship))
   (leetcode-skill
      (user-id ?id)
      (problems-solved-count ?count&:(< ?count 50)))
   (readiness-confidence
      (user-id ?id)
      (value ?cf&:(> ?cf 0.5)))
=>
   (bind ?rule-cf 0.75)
   (bind ?final-cf (* ?cf ?rule-cf))
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "U12C")
         (category "interview-preparation")
         (advice "Strengthen fundamentals before advancing.")
         (reason "interview-soon-low-exposure")
         (confidence ?final-cf)))
)