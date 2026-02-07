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


