; -- Recommendation Template -- 
(deftemplate recommendation
   (slot user-id)
   (slot rule-id)
   (slot category)
   (slot advice)
   (slot reason)
)

; -- 1. User Profile (Background and Career) --
(deftemplate user-profile
   (slot user-id)
   (slot has-dsa-knowledge) ; yes |no
   (slot career-goal)  ; internship | full-time | skill-development
   (slot employment-status)  ; employed | unemployed | student
   (slot weekly-working-hours (type INTEGER))  ; integer (0-19 | 20-39 | 40+)
)

; -- 2. User Well-being and Motivation --
(deftemplate well-being
   (slot user-id)
   (slot fatigue-level)  ; low | moderate | high
   (slot motivation-level)  ; low | moderate | high
   (slot average-sleep-hours (type INTEGER))  ; integer
)

; -- 3. Practice and Availability --
(deftemplate practice-habits
   (slot user-id)
   (slot practice-days-per-week (type INTEGER))  ; integer (0-3 | 4-5 | 6-7)
   (slot average-session-duration (type INTEGER))  ; integer (minutes)
   (slot weekly-practice-minutes (type INTEGER))  ; integer (0-149 | 150-299 | 300+)
   (slot practice-streak (type INTEGER))  ; integer (number of consecutive days) (long > 7, moderate 3-7, short <3)
   (slot practice-regularity)  ; inconsistent | consistent
   (slot days-until-interview (type INTEGER))  ; integer (0-7 | 8-30 | 31+)
)

; -- 4. LeetCode Skill and Experience --
(deftemplate leetcode-skill
   (slot user-id)
   (slot leetcode-experience-level)  ; beginner | intermediate | advanced
   (slot problems-solved-count (type INTEGER))  ; integer ( <50 | 50-200 | >200)
   (slot current-problem-difficulty)  ; easy | medium | hard
   (slot average-time-per-problem (type INTEGER))  ; integer (minutes)
   (slot common-stumbling-blocks)  ; syntax | algorithms | optimization | debugging 
)

; -- 5. Performance and Outcomes --
(deftemplate leetcode-performance
   (slot user-id)
   (slot recent-success-rate)  ; low | moderate | high
   (slot recent-failure-rate)  ; low | moderate | high
   (slot topic-coverage)  ; narrow | balanced | broad
   (slot mock-interviews-completed (type INTEGER))  ; integer (0-2 | 3-5 | 6+)
   (slot mock-interview-performance)  ; low | moderate | high
   (slot post-problem-review) ; yes | no
)