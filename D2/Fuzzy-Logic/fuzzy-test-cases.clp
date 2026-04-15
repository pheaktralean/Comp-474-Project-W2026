; --------------------------------------------------------------------
; --------------------- Fuzzy Rules Test Cases -----------------------
; --------------------------------------------------------------------

; --------------------------------------------------------------------
; Deterministic Rule 2 Extension (Fuzzy Logic for Modeling)
; Original: Fatigue-Based Practice Adjustment
; --------------------------------------------------------------------

; ------ Fuzzy Rule F2A Test Case: High Fatigue + Low Consistency ----
(deffacts test-fuzzy-F2A
    (fatigue-fuzzy
        (user-id 2000)
        (level high))
    (consistency-fuzzy
        (user-id 2000)
        (level low))
)

; ------ Fuzzy Rule F2B Test Case: Very High Fatigue ----------------
(deffacts test-fuzzy-F2B
    (fatigue-fuzzy
        (user-id 2001)
        (level very-high))
)   

; ------ Fuzzy Rule F2C Test Case: Moderate Fatigue + Moderate Motivation ----
(deffacts test-fuzzy-F2C
    (fatigue-fuzzy
        (user-id 2002)
        (level moderate))
    (motivation-fuzzy
        (user-id 2002)  
        (level moderate))
)

; --------------------------------------------------------------------
; Deterministic Rule 3 Extension (Fuzzy Logic for Modeling)
; Original: Motivation Recovery 
; --------------------------------------------------------------------

; ------ Fuzzy Rule F3A Test Case: Low Motivation + High Fatigue ------
(deffacts test-fuzzy-F3A
    (motivation-fuzzy
        (user-id 2003)
        (level low))
    (fatigue-fuzzy
        (user-id 2003)
        (level high))
)

; ------ Fuzzy Rule F3B Test Case: Low Motivation + Low Consistency ------
(deffacts test-fuzzy-F3B
    (motivation-fuzzy
        (user-id 2004)
        (level very-low))
    (consistency-fuzzy
        (user-id 2004)
        (level low))
)

; --------------------------------------------------------------------
; Deterministic Rule 6 Extension (Fuzzy Logic for Modeling)
; Original: Reduce Difficulty After Failures
; --------------------------------------------------------------------

; ------- Fuzzy Rule F6 Test Case: Low Performance --------------------
(deffacts test-fuzzy-F6
    (performance-fuzzy
        (user-id 2005)
        (level low))
)

; --------------------------------------------------------------------
; Deterministic Rule 7 Extension (Fuzzy Logic for Modeling)
; Original: Increase Difficulty After Success
; --------------------------------------------------------------------

; ------ Fuzzy Rule F7: High Performance -----------------------------
(deffacts test-fuzzy-F7
    (performance-fuzzy
        (user-id 2006)
        (level high))
    (readiness-fuzzy
        (user-id 2006)
        (level high))
)


; --------------------------------------------------------------------
; Deterministic Rule 8 Extension (Fuzzy Logic for Modeling)
; Original: Switch from Hard After Low Success
; --------------------------------------------------------------------

; ------ Fuzzy Rule F8 Test case: Low Performance + High Fatigue -------------
(deffacts test-fuzzy-F8
    (performance-fuzzy
        (user-id 2007)
        (level low))
    (fatigue-fuzzy
        (user-id 2007)
        (level high))
)

; --------------------------------------------------------------------
; Deterministic Rule 10 Extension (Fuzzy Logic for Modeling)
; Original: Allow harder problems for intermediate users
; --------------------------------------------------------------------

; ------ Fuzzy Rule F10 Test Case: High Performance + High Consistency ------
(deffacts test-fuzzy-F10
   (performance-fuzzy
      (user-id 2008)
      (level high))
   (consistency-fuzzy
      (user-id 2008)
      (level high))
   (readiness-fuzzy
      (user-id 2008)
      (level moderate))
)


; --------------------------------------------------------------------
; Deterministic Rule 12 Extension (Uncertainty Modeling with CF)
; Original: Mock Interview Urgency
; --------------------------------------------------------------------

; ------- Fuzzy Rule F12A Test Case: Low Readiness -------------------
(deffacts test-fuzzy-F12A
    (readiness-fuzzy
        (user-id 2009)
        (level low))
)

; ------- Fuzzy Rule F12B Test Case: High Readiness + High Performance --------
(deffacts test-fuzzy-F12B
    (readiness-fuzzy
        (user-id 2010)
        (level high))
    (performance-fuzzy
        (user-id 2010)
        (level high))
)
