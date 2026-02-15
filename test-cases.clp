; -- Present users / test cases --

; -- Test case 1: Rule 1 --
(deffacts test-rule-1
   (user-profile
      (user-id 1)
      (has-dsa-knowledge no))
)

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
      (fatigue-level high)
      (motivation-level low))
)  

; -- Test case 4: rule 4 --
(deffacts test-rule-4
   (well-being
      (user-id 4)
      (motivation-level low))   
   (practice-habits
      (user-id 4)
      (practice-streak 2))
)

; -- Test case 5: rule 5 --
(deffacts test-rule-5
   (practice-habits
      (user-id 5)
      (practice-streak 10))
)


; -- Test case 6: rule 6 --
(deffacts test-rule-6
   (well-being
      (user-id 6)
      (fatigue-level high))
   (practice-habits
      (user-id 6)
      (average-session-duration 100))
)


; -- Test case 7: rule 7 --
(deffacts test-rule-7
   (well-being
      (user-id 7)
      (fatigue-level low))
   (practice-habits
      (user-id 7)
      (average-session-duration 20))
) 

; -- Test case 8: rule 8 --
(deffacts test-rule-8
   (user-profile
      (user-id 8)
      (weekly-working-hours 50))
   (practice-habits
      (user-id 8)
      (practice-streak 10))
)

; -- Test case 9: rule 9 --
(deffacts test-rule-9
   (leetcode-skill
      (user-id 9)
      (current-problem-difficulty hard)
      (leetcode-experience-level beginner)
      (problems-solved-count 20))
)

; -- Test case 10: rule 10 --
(deffacts test-rule-10
   (leetcode-skill
      (user-id 10)
      (current-problem-difficulty medium))
   (leetcode-performance      
      (user-id 10)
      (recent-failure-rate high))
)

; -- Test case 11: rule 11 --
(deffacts test-rule-11
   (leetcode-performance
      (user-id 11)
      (recent-success-rate high))
   (leetcode-skill
      (user-id 11)
      (current-problem-difficulty easy))
)

; -- Test case 12: rule 12 --
(deffacts test-rule-12
   (leetcode-performance
      (user-id 12)
      (recent-success-rate low))
   (leetcode-skill
      (user-id 12)
      (current-problem-difficulty hard))  
)

; -- Test case 13: rule 13 --
(deffacts test-rule-13
   (leetcode-skill
      (user-id 13)
      (leetcode-experience-level beginner))
   (leetcode-performance
      (user-id 13)
      (recent-success-rate moderate))
   (practice-habits
      (user-id 13)
      (practice-streak 5))
)

; -- Test case 14: rule 14 --
(deffacts test-rule-14
   (leetcode-skill
      (user-id 14)
      (leetcode-experience-level intermediate)
      (current-problem-difficulty medium))
   (leetcode-performance
      (user-id 14)
      (recent-success-rate high))
   (practice-habits
      (user-id 14)
      (practice-regularity consistent))
)

; -- Test case 15: rule 15 --
(deffacts test-rule-15
   (practice-habits
      (user-id 15)
      (days-until-interview 45))
)

; -- Test case 16: rule 16 --
(deffacts test-rule-16
   (practice-habits
      (user-id 16)
      (practice-days-per-week 3)
      (practice-regularity inconsistent))
)

; -- Test case 17: rule 17 --
(deffacts test-rule-17
   (user-profile
      (user-id 17)
      (employment-status unemployed)
      (weekly-working-hours 0))
)

; -- Test case 18: rule 18 --
(deffacts test-rule-18
   (user-profile
      (user-id 18)
      (employment-status employed)
      (weekly-working-hours 50))
)

; -- Test case 19: rule 19 --
(deffacts test-rule-19
   (user-profile
      (user-id 19)
      (career-goal internship))
   (practice-habits
      (user-id 19)
      (days-until-interview 3))
   (leetcode-skill
      (user-id 19)
      (problems-solved-count 60))
   (leetcode-performance
      (user-id 19)
      (recent-success-rate moderate)
      (mock-interviews-completed 5))
)

; -- Test case 20: rule 20 --
(deffacts test-rule-20
   (practice-habits
      (user-id 20)
      (weekly-practice-minutes 320))
   (leetcode-performance
      (user-id 20)
      (recent-success-rate low))
   (leetcode-skill
      (user-id 20)
      (average-time-per-problem 60))
)

; -- Test case 21: rule 21 --
(deffacts test-rule-21
   (leetcode-performance
      (user-id 21)
      (recent-failure-rate high)
      (post-problem-review no))
)

     



