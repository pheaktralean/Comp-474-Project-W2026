; -- 1. User Background (DSA knowledge) --
(deftemplate user-background
   (slot user-id)
   (slot has-dsa-knowledge)  ; yes | no
)

; --- 2. User Well-being ---
(deftemplate user-fatigue
   (slot user-id)
   (slot fatigue-level)   ; low | moderate | high
)

(deftemplate motivation
    (slot user-id)
    (slot motivation-level) ; low | moderate | high
)

; -- 3. Employment Status --
(deftemplate employment
   (slot user-id)
   (slot employment-status)  ; employed | unemployed | student
   (slot weekly-working-hours)  ; low | moderate | high
)

; -- 4. Career Goals --
(deftemplate career-goals
   (slot user-id)
   (slot career-goal)  ; internship | full-time | skill-development
)

; -- 5. LeetCode Experience --
(deftemplate leetcode-experience
   (slot user-id)
   (slot leetcode-experience-level)  ; beginner | intermediate | advanced
   (slot problems-solved-count)  ; low | medium | high
   (slot current-problem-difficulty)  ; easy | medium | hard
)

; -- 6. Performance --
(deftemplate performance
   (slot user-id)
   (slot recent-success-rate)  ; low | moderate | high
   (slot recent-failure-rate)  ; low | high
   (slot topic-coverage)  ; narrow | balanced | broad
)

; -- 7. Availability and Scheduling --
(deftemplate availability
   (slot user-id)
   (slot practice-days-per-week)  ; low | moderate | high
   (slot average-session-duration)  ; short | medium | long
   (slot days-until-interview)  ; far | moderate | limited
)

; -- 8. Consistency and Practice Habits --
(deftemplate consistency
    (slot user-id)
    (slot practice-streak)  ; short | moderate | long
    (slot practice-regularity)  ; inconsistent | consistent
)

; -- Present users / test cases --

; -- Test case 1: rule 1 --
(deffacts test-rule-1
   (user-background
      (user-id 1)
      (has-dsa-knowledge no))
)

; -- Test case 2: rule 2 --
(deffacts test-rule-2
   (user-fatigue
      (user-id 2)
      (fatigue-level high))
)

; -- Test case 3: rule 3 --
(deffacts test-rule-3
   (user-fatigue
      (user-id 3)
      (fatigue-level high))
   (motivation
      (user-id 3)
      (motivation-level low))
)  

; -- Test case 4: rule 4 --
(deffacts test-rule-4
   (user-fatigue
      (user-id 4)
      (fatigue-level high))   
   (consistency   
      (user-id 4)
      (practice-streak long))
)

; -- Test case 5: rule 5 --
(deffacts test-rule-5
   (leetcode-experience
      (user-id 5)
      (leetcode-experience-level beginner)
      (current-problem-difficulty medium)
      (problems-solved-count low))
)

; -- Test case 6: rule 6 --
(deffacts test-rule-6
   (performance
      (user-id 6)
      (recent-success-rate low)
      (recent-failure-rate high))
   (leetcode-experience
      (user-id 6)
      (current-problem-difficulty medium))
)

; -- Test case 7: rule 7 --
(deffacts test-rule-7
   (performance
      (user-id 7)
      (recent-success-rate high)
      (recent-failure-rate low))
   (leetcode-experience
      (user-id 7)
      (current-problem-difficulty easy))
) 

; -- Test case 8: rule 8 --
(deffacts test-rule-8
   (performance
      (user-id 8)
      (recent-success-rate low)
      (recent-failure-rate high))
   (leetcode-experience
      (user-id 8)
      (current-problem-difficulty hard))
)

; -- Test case 9: rule 9 --
(deffacts test-rule-9
   (leetcode-experience
      (user-id 9)
      (leetcode-experience-level beginner))
   (performance
      (user-id 9)
      (recent-success-rate moderate))
   (consistency
      (user-id 9)
      (practice-streak moderate))    
)

; -- Test case 10: rule 10 --
(deffacts test-rule-10
   (leetcode-experience
      (user-id 10)
      (leetcode-experience-level intermediate)
      (current-problem-difficulty medium))
   (performance      
      (user-id 10)
      (recent-success-rate high))
   (consistency
      (user-id 10)      
      (practice-regularity consistent))
)

; -- Test case 11: rule 11 --
(deffacts test-rule-11
   (availability 
      (user-id 11)
      (practice-days-per-week low))
)

; -- Test case 12: rule 12 --
(deffacts test-rule-12
   (employment 
      (user-id 12)
      (employment-status unemployed)
      (weekly-working-hours low))
)

; -- Test case 13: rule 13 --
(deffacts test-rule-13
   (employment 
      (user-id 13)
      (employment-status employed)
      (weekly-working-hours high))
)

; -- Test case 14: rule 14 --
(deffacts test-rule-14
   (career-goals
      (user-id 14)
      (career-goal internship))
   (availability
      (user-id 14)
      (days-until-interview limited))
)

; -- Test case 15: rule 15 --
(deffacts test-rule-15
   (availability
      (user-id 15)
      (days-until-interview far))
)

; -- Test case 16: rule 16 --
(deffacts test-rule-16
   (consistency
      (user-id 16)
      (practice-streak short))
   (motivation
      (user-id 16)
      (motivation-level low))
)

; -- Test case 17: rule 17 --
(deffacts test-rule-17
   (consistency
      (user-id 17)
      (practice-streak long))
   (user-fatigue
      (user-id 17)
      (fatigue-level low))
)

; -- Test case 18: rule 18 --
(deffacts test-rule-18
   (user-fatigue
      (user-id 18)
      (fatigue-level high))
   (consistency
      (user-id 18)
      (average-session-duration long))
)

; -- Test case 19: rule 19 --
(deffacts test-rule-19
   (user-fatigue
      (user-id 19)
      (fatigue-level low))
   (availability
      (user-id 19)
      (average-session-duration short))
)

; -- Test case 20: rule 20 --
(deffacts test-rule-20
   (employment
      (user-id 20)
      (employment-status student)
      (weekly-working-hours moderate))
   (consistency
      (user-id 20)
      (practice-streak long))
)


     


