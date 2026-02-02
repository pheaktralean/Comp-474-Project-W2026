; --- User well-being and fatigue facts ---

(deftemplate user-fatigue
   (slot user-id)
   (slot fatigue-level)   ; low | moderate | high
)

(deftemplate motivation
    (slot user-id)
    (slot motivation-level) ; low | moderate | high
)

; -- LeetCode experience facts --

(deftemplate leetcode-experience
   (slot user-id)
   (slot leetcode-experience-level)  ; beginner | intermediate | advanced
   (slot problems-solved-count)  ; low | medium | high
   (slot current-problem-difficulty)  ; easy | medium | hard
)

; -- Performance facts --

(deftemplate performance
   (slot user-id)
   (slot recent-success-rate)  ; low | moderate | high
   (slot recent-failure-rate)  ; low | high
   (slot topic-coverage)  ; narrow | balanced | broad
)

; --Availability and Scheduling facts --

(deftemplate availability
   (slot user-id)
   (slot practice-days-per-week)  ; low | moderate | high
   (slot average-session-duration)  ; short | medium | long
   (slot days-until-interview)  ; far | moderate | limited
)

(deftemplate consistency
    (slot user-id)
    (slot practice-streak)  ; short | moderate | long
    (slot practice-regularity)  ; inconsistent | consistent
)
