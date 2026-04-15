; --------------------------------------------------------------------
; ------------------------ Fuzzy Rules  ------------------------------
; --------------------------------------------------------------------

; --------------------------------------------------------------------
; Deterministic Rule 2 Extension (Fuzzy Logic for Modeling)
; Original: Fatigue-Based Practice Adjustment
; --------------------------------------------------------------------

; ------- Fuzzy Rule F2A: High Fatigue + Low/Moderate Consistency ----
(defrule rule-F2A-fatigue-consistency-adjustment
    (fatigue-fuzzy
        (user-id ?id)
        (level high))
    (consistency-fuzzy
        (user-id ?id)
        (level high))
    (practice-habits
      (user-id ?id)
      (average-session-duration ?duration&:(> ?duration 90)))
=>
    (assert
        (recommendation
            (user-id ?id)
            (rule-id "F2A")
            (category "well-being-management")
            (advice "Reduce practice intensity and focus on lighter problems.")
            (reason "high-fatigue-low-or-moderate-consistency")))
)

; ------- Fuzzy Rule F2B: Very High Fatigue --------------------------
(defrule rule-F2B-very-high-fatigue
    (fatigue-fuzzy
        (user-id ?id)
        (level very-high))
    (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty hard))
=>
    (assert
        (recommendation
            (user-id ?id)
            (rule-id "F2B")
            (category "well-being-management")
            (advice "Switch to easier problems and take rest days to recover.")
            (reason "very-high-fatigue")))
)

; --------- Fuzzy Rule F2C: Moderate Fatique + Moderate Motivation ------
(defrule rule-F2C-moderate-fatigue-motivation
   (fatigue-fuzzy
      (user-id ?id)
      (level moderate))
   (motivation-fuzzy
      (user-id ?id)
      (level moderate))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "F2C")
         (category "well-being-management")
         (advice "Shorten practice sessions to maintain productivity.")
         (reason "moderate-fatigue-moderate-motivation")))
)

; --------------------------------------------------------------------
; Deterministic Rule 3 Extension (Fuzzy Logic for Modeling)
; Original: Motivation Recovery 
; --------------------------------------------------------------------

; ------- Fuzzy Rule F3A: Low Motivation + High Fatigue ----------------
(defrule rule-F3A-low-motivation-high-fatigue
    (motivation-fuzzy
        (user-id ?id)
        (level low))
    (fatigue-fuzzy
        (user-id ?id)
        (level high))
    (practice-habits
        (user-id ?id)
        (practice-streak ?streak&:(< ?streak 3)))
=>
    (assert
        (recommendation
            (user-id ?id)
            (rule-id "F3A")
            (category "well-being-management")
            (advice "Set small, achievable goals to rebuild momentum.")
            (reason "low-motivation-high-fatigue")))
)

; ------- Fuzzy Rule F3B: Very Low Motivation + Low Consistency ------
(defrule rule-F3B-very-low-motivation-low-consistency
    (motivation-fuzzy
        (user-id ?id)
        (level very-low))
    (consistency-fuzzy
        (user-id ?id)
        (level low))
=>
    (assert
        (recommendation
            (user-id ?id)
            (rule-id "F3B")
            (category "well-being-management")
            (advice "Restart with short, manageable sessions to rebuild routine.")
            (reason "very-low-motivation-low-consistency")))
)

; --------------------------------------------------------------------
; Deterministic Rule 6 Extension (Fuzzy Logic for Modeling)
; Original: Reduce Difficulty After Failures
; --------------------------------------------------------------------

; ------- Fuzzy Rule F6: Low Performance ------------------------------
(defrule rule-F6-low-performance-reduce-difficulty
   (performance-fuzzy
      (user-id ?id)
      (level low))
    (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty ?diff&:(or (eq ?diff medium) (eq ?diff hard)))
      (problems-solved-count ?count&:(< ?count 50)))
    
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "F6")
         (category "difficulty-selection")
         (advice "Reduce difficulty to easier problems and rebuild confidence.")
         (reason "low-performance")))
)

; --------------------------------------------------------------------
; Deterministic Rule 7 Extension (Fuzzy Logic for Modeling)
; Original: Increase Difficulty After Success
; --------------------------------------------------------------------

; ------ Fuzzy Rule F7: High Performance -----------------------------
(defrule rule-F7-high-performance-increase-difficulty
    (performance-fuzzy
        (user-id ?id)
        (level high))
    (readiness-fuzzy
        (user-id ?id)
        (level ?r&:(or (eq ?r moderate) (eq ?r high))))
=>
    (assert
        (recommendation
            (user-id ?id)
            (rule-id "F7")
            (category "difficulty-selection")
            (advice "Increase difficulty to medium or hard problems.")
            (reason "high-performance-moderate-or-high-readiness")))
)

; --------------------------------------------------------------------
; Deterministic Rule 8 Extension (Fuzzy Logic for Modeling)
; Original: Switch from Hard After Low Success
; --------------------------------------------------------------------

; ------ Fuzzy Rule F8: Low Performance + High Fatigue -------------
(defrule rule-F8-low-performance-high-fatigue
    (performance-fuzzy
        (user-id ?id)
        (level low))
    (fatigue-fuzzy
        (user-id ?id)
        (level high))
=>
    (assert
        (recommendation
            (user-id ?id)
            (rule-id "F8")
            (category "difficulty-selection")
            (advice "Switch to easier problems to prevent burnout.")
            (reason "low-performance-high-fatigue")))
)

; --------------------------------------------------------------------
; Deterministic Rule 10 Extension (Fuzzy Logic for Modeling)
; Original: Allow harder problems for intermediate users
; --------------------------------------------------------------------

; ------ Fuzzy Rule F10: High Performance + High Consistency --------
(defrule rule-F10-high-performance-high-consistency
   (performance-fuzzy
      (user-id ?id)
      (level high))
   (consistency-fuzzy
      (user-id ?id)
      (level high))
   (readiness-fuzzy
      (user-id ?id)
      (level ?r&:(or (eq ?r moderate) (eq ?r high))))
    (leetcode-skill
        (user-id ?id)
        (leetcode-experience-level intermediate))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "F10")
         (category "difficulty-selection")
         (advice "You may attempt harder problems to further enhance your skills.")
         (reason "high-performance-high-consistency-readiness")))
)

; --------------------------------------------------------------------
; Deterministic Rule 12 Extension (Fuzzy Logic for Modeling)
; Original: Mock Interview Urgency
; --------------------------------------------------------------------

; ------- Fuzzy Rule F12A: Low Readiness -------------------------------
(defrule rule-F12A-low-readiness
   (readiness-fuzzy
      (user-id ?id)
      (level low))
    (practice-habits
        (user-id ?id)
        (days-until-interview ?days&:(< ?days 14))))
    (leetcode-performance
        (user-id ?id)
        (topic-coverage narrow))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "F12A")
         (category "interview-preparation")
         (advice "Focus on fundamentals and basic problem-solving before advancing.")
         (reason "low-readiness")))
)

; ------- Fuzzy Rule F12B: High Readiness + High Performance --------
(defrule rule-F12B-high-readiness-high-performance
   (readiness-fuzzy
      (user-id ?id)
      (level high))
   (performance-fuzzy
      (user-id ?id)
      (level high))
    (leetcode-performance
        (user-id ?id)
        (mocks-interview-completed ?mocks&:(> ?mocks 10)))
=>
   (assert
        (recommendation
        (user-id ?id)
        (rule-id "F12B")
         (category "interview-preparation")
         (advice "Focus on medium-level interview problems and timed practice.")
         (reason "high-readiness-high-performance")))
)