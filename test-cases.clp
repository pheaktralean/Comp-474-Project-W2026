; -- Present users / Test cases --

;------------------------------------------------------------
; ------------ Category 1: Fundamental Knowledge ------------
;------------------------------------------------------------

; -- Test case 1: Rule 1 --
(deffacts test-rule-1
   (user-profile
      (user-id 1)
      (has-dsa-knowledge no))
)

;------------------------------------------------------------
; --------------- Category 2: Well-being Management ---------
;------------------------------------------------------------

; -- Test case 2: Rule 2 --
(deffacts test-rule-2
   (well-being
      (user-id 2)
      (fatigue-level high))
   (practice-habits
      (user-id 2)
      (practice-streak 6))
)

; -- Test case 3: rule 3 --
(deffacts test-rule-3
   (well-being
      (user-id 3)
      (motivation-level low))   
   (practice-habits
      (user-id 3)
      (practice-streak 2))
)

; -- Test case 4.1: rule 4 --
(deffacts test-rule-4
   (user-profile
      (user-id 4)
      (weekly-working-hours 20))
   (practice-habits
      (user-id 4)
      (practice-streak 10))
)

; -- Test case 4.2: rule 4 --
;(deffacts test-rule-4
;  (user-profile
;      (user-id 4)
;      (weekly-working-hours 50))
;   (practice-habits
;      (user-id 4)
;      (practice-streak 10))
;)

;------------------------------------------------------------
;------------- Category 3: Difficulty Selection -------------
;------------------------------------------------------------

; -- Test case 5: rule 5 --
(deffacts test-rule-5
   (leetcode-skill
      (user-id 5)
      (current-problem-difficulty hard)
      (leetcode-experience-level beginner)
      (problems-solved-count 20))
)

; -- Test case 6: rule 6 --
(deffacts test-rule-6
   (leetcode-skill
      (user-id 6)
      (current-problem-difficulty medium))
   (leetcode-performance      
      (user-id 6)
      (recent-failure-rate high))
)

; -- Test case 7: rule 7 --
(deffacts test-rule-7
   (leetcode-performance
      (user-id 7)
      (recent-success-rate high))
   (leetcode-skill
      (user-id 7)
      (current-problem-difficulty easy))
)

; -- Test case 8: rule 8 --
(deffacts test-rule-8
   (leetcode-performance
      (user-id 8)
      (recent-success-rate low))
   (leetcode-skill
      (user-id 8)
      (current-problem-difficulty hard))  
)

; -- Test case 9: rule 9 --
(deffacts test-rule-9
   (leetcode-skill
      (user-id 9)
      (leetcode-experience-level beginner))
   (leetcode-performance
      (user-id 9)
      (recent-success-rate moderate))
   (practice-habits
      (user-id 9)
      (practice-streak 5))
)

; -- Test case 10: rule 10 --
(deffacts test-rule-10
   (leetcode-skill
      (user-id 10)
      (leetcode-experience-level intermediate)
      (current-problem-difficulty medium))
   (leetcode-performance
      (user-id 10)
      (recent-success-rate high))
   (practice-habits
      (user-id 10)
      (practice-regularity consistent))
)

;------------------------------------------------------------
;------------ Category 4: Interview Strategy ----------------
;------------------------------------------------------------

; -- Test case 11: rule 11 --
(deffacts test-rule-11
   (practice-habits
      (user-id 11)
      (days-until-interview 45))
   (leetcode-performance
      (recent-success-rate low))
)

; -- Test case 12: rule 12 --
(deffacts test-rule-12
   (user-profile
      (user-id 12)
      (career-goal internship))
   (practice-habits
      (user-id 12)
      (days-until-interview 3))
   (leetcode-skill
      (user-id 12)
      (problems-solved-count 60))
   (leetcode-performance
      (user-id 12)
      (recent-success-rate moderate)
      (mock-interviews-completed 5))
)

;------------------------------------------------------------
; ----- Category 5: Practice Structure and Time Allocation --
;------------------------------------------------------------

; -- Test case 13: rule 13 --
(deffacts test-rule-13
   (well-being
      (user-id 13)
      (fatigue-level low))
   (practice-habits
      (user-id 13)
      (average-session-duration 25))
)

; -- Test case 14: rule 14 --
(deffacts test-rule-14
   (practice-habits
      (user-id 14)
      (practice-days-per-week 3)
      (practice-regularity inconsistent))
)

; -- Test case 15: rule 15 --
(deffacts test-rule-15
   (user-profile
      (user-id 15)
      (employment-status unemployed)
      (weekly-working-hours 0))
)

; -- Test case 16: rule 16 --
(deffacts test-rule-16
   (user-profile
      (user-id 16)
      (employment-status employed)
      (weekly-working-hours 50))
)

;------------------------------------------------------------
;-------------- Category 6: Practice Efficiency -------------
;------------------------------------------------------------

; -- Test case 17: rule 17 --
(deffacts test-rule-17
   (practice-habits
      (user-id 17)
      (weekly-practice-minutes 320))
   (leetcode-performance
      (user-id 17)
      (recent-success-rate low))
   (leetcode-skill
      (user-id 17)
      (average-time-per-problem 60))
)

; -- Test case 18: rule 18 --
(deffacts test-rule-18
   (leetcode-performance
      (user-id 18)
      (recent-failure-rate high)
      (post-problem-review no))
)

; -- Test case 19: rule 19 --
(deffacts test-rule-19
   (practice-habits
      (user-id 19)
      (practice-streak 10)
      (weekly-practice-minutes 250))
   (leetcode-performance
      (user-id 19)
      (recent-success-rate moderate))
)

; -- Test case 20: rule 20 --
(deffacts test-rule-20
   (practice-habits
      (user-id 20)
      (weekly-practice-minutes 350)
      (days-until-interview 40))
   (leetcode-performance
      (user-id 20)
      (recent-success-rate high))
)
     



