; -- Display recommendations based on user facts --
(defrule display-recommendations
   (recommendation
      (user-id ?id)
      (rule-id ?rule)
      (category ?cat)
      (advice ?adv)
      (reason ?why))
=>
   (printout t
      crlf
      "--------------------------------------------------" crlf
      "User ID: " ?id crlf
      "Rule ID: " ?rule crlf
      "Recommendation Category: " ?cat crlf
      "Advice: " ?adv crlf
      "Reason: " ?why crlf
      "--------------------------------------------------" crlf)
)

;------------------------------------------------------------
; ------------ Category 1: Fundamental Knowledge ------------
;------------------------------------------------------------

; -- Rule 1: No DSA Knowledge --
(defrule rule-1-no-dsa-knowledge
    (user-profile
        (user-id ?id)
        (has-dsa-knowledge no))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "1")
      (category "foundation-knowledge")
      (advice "Start with basic data structures and algorithms.")
      (reason "no-dsa-knowledge")))
)

;------------------------------------------------------------
; --------------- Category 2: Well-being Management ---------
;------------------------------------------------------------

; -- Rule 2: Fatigue-Based Practice Adjustment --
(defrule rule-2-fatigue-adjustment
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak)
      (average-session-duration ?duration))
=>
   (if (> ?duration 90)
      then
         (assert (recommendation
            (user-id ?id)
            (rule-id "2")
            (category "well-being-management")
            (advice "Shorten practice sessions to manage fatigue.")
            (reason "high-fatigue-long-sessions")))
   else
      (if (> ?streak 7)
         then
            (assert (recommendation
               (user-id ?id)
               (rule-id "2")
               (category "well-being-management")
               (advice "Consider taking a break to prevent burnout.")
               (reason "high-fatigue-long-streak")))
         else
            (assert (recommendation
               (user-id ?id)
               (rule-id "2")
               (category "well-being-management")
               (advice "Reduce practice intensity and focus on lighter problems.")
               (reason "general-high-fatigue")))))
)

; -- Rule 3: Motivation Recovery Rule --
(defrule rule-3-motivation-recovery
   (well-being
      (user-id ?id)
      (motivation-level low)
      (fatigue-level ?fatigue))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak))
   (or
      (test (eq ?fatigue high))
      (test (< ?streak 3)))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "3")
      (category "well-being-management")
      (advice "Set small, achievable goals to rebuild momentum.")
      (reason "low-motivation-fatigue-or-short-streak")))
)

; -- Rule 4: Consistency and Burnout Balance --
(defrule rule-4-consistency-balance
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(> ?streak 7)))
   (user-profile
      (user-id ?id)
      (weekly-working-hours ?hours))
=>
   (if (>= ?hours 40)
      then
         (assert (recommendation
            (user-id ?id)
            (rule-id "4")
            (category "well-being-management")
            (advice "Maintain consistency but incorporate rest days to prevent burnout.")
            (reason "long-streak-overworked")))
      else
         (assert (recommendation
            (user-id ?id)
            (rule-id "4")
            (category "consistency-reinforcement")
            (advice "Keep up the great consistency!")
            (reason "long-practice-streak"))))
)

;------------------------------------------------------------
; ----------- Category 3: Difficulty Selection --------------
;------------------------------------------------------------


; -- Rule 5: Beginner Avoid Medium or Hard --
(defrule rule-5-beginner-avoid-medium-hard
   (leetcode-skill
      (user-id ?id)
      (leetcode-experience-level beginner)
      (problems-solved-count ?count&:(< ?count 50))
      (current-problem-difficulty ?difficulty&:(or (eq ?difficulty medium)
                                                   (eq ?difficulty hard))))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "5")
      (category "difficulty-selection")
      (advice "Focus on easy problems to build confidence and skills.")
      (reason "beginner-with-low-problem-exposure")))
)

; -- Rule 6: Reduce Difficulty After Failures --
(defrule rule-6-reduce-difficulty-after-failure
   (leetcode-performance
      (user-id ?id)
      (recent-failure-rate high))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty medium))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "6")
      (category "difficulty-selection")
      (advice "Reduce difficulty to easy.")
      (reason "high-failure-rate-medium-difficulty")))
)

; -- Rule 7: Increase Difficulty After Success --
(defrule rule-7-increase-difficulty-after-success
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate high))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty easy))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "7")
      (category "difficulty-selection")
      (advice "Consider trying medium difficulty problems.")
      (reason "high-success-rate-easy-difficulty")))
)

; -- Rule 8: Switch from Hard After Low Success --
(defrule rule-8-switch-from-hard
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate low))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty hard))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "8")
      (category "difficulty-selection")
      (advice "Consider switching to medium difficulty problems.")
      (reason "low-success-rate-hard-difficulty")))
)

; -- Rule 9: Maintain Difficulty for Stable Beginner --
(defrule rule-9-stable-beginner
    (leetcode-skill
        (user-id ?id)
        (leetcode-experience-level beginner))

    (leetcode-performance
        (user-id ?id)
        (recent-success-rate moderate))

    (practice-habits
        (user-id ?id)
        (practice-streak ?days&:(and (>= ?days 3)
                                     (<= ?days 7))))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "9")
         (category "difficulty-selection")
         (advice "Maintain your current difficulty level.")
         (reason "steady-progress-stable-beginner")))
)


; -- Rule 10: Allow Harder Problems for Intermediate --
(defrule rule-10-intermediate-advance
    (leetcode-skill
        (user-id ?id)
        (leetcode-experience-level intermediate)
        (current-problem-difficulty ?difficulty&:(or (eq ?difficulty easy)
                                                   (eq ?difficulty medium))))
    (leetcode-performance
        (user-id ?id)
        (recent-success-rate high))
    (practice-habits
        (user-id ?id)
        (practice-regularity consistent))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "10")
         (category "difficulty-selection")
         (advice "You may attempt harder problems to further enhance your skills.")
         (reason "consistent-high-performance")))
)

;------------------------------------------------------------
;-------------- Category 4: Interview Strategy --------------
;------------------------------------------------------------

; -- Rule 11: Gradual Progress with Plenty of Time
(defrule rule-11-slow-skill-progression
   (practice-habits
      (user-id ?id)
      (days-until-interview ?days&:(> ?days 31)))
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate low))
=>  
   (assert (recommendation
      (user-id ?id)
      (rule-id "11")
      (category "skill-progression")
      (advice "Adopt a gradual skill progression.")
      (reason "plenty-of-time-before-interview")))
)

; -- Rule 12: Prioritize Interview Problems --
(defrule rule-12-interview-strategy
   (practice-habits
      (user-id ?id)
      (days-until-interview ?days&:(<= ?days 14)))

   (user-profile
      (user-id ?id)
      (career-goal internship))

   (leetcode-skill
      (user-id ?id)
      (problems-solved-count ?count))

   (leetcode-performance
      (user-id ?id)
      (recent-success-rate ?rate)
      (mock-interviews-completed ?mock-count))

=>
   (if (< ?mock-count 3)
      then
         (assert
            (recommendation
               (user-id ?id)
               (rule-id "12")
               (category "interview-preparation")
               (advice "Prioritize mock interviews immediately.")
               (reason "interview-soon-low-mock-exposure"))))

   (if (and (>= ?count 50)
            (or (eq ?rate moderate)
                (eq ?rate high)))
      then
         (assert
            (recommendation
               (user-id ?id)
               (rule-id "12")
               (category "interview-preparation")
               (advice "Focus on medium-level interview problems.")
               (reason "interview-soon-ready-for-advancement"))))

   (if (< ?count 50)
      then
         (assert
            (recommendation
               (user-id ?id)
               (rule-id "12")
               (category "interview-preparation")
               (advice "Strengthen fundamentals before advancing.")
               (reason "interview-soon-low-exposure"))))
)

;------------------------------------------------------------
; ----- Category 5: Practice Structure and Time Allocation --
;------------------------------------------------------------

; -- Rule 13: Energy Optimization --
(defrule rule-13-energy-optimization
   (well-being
      (user-id ?id)
      (fatigue-level low))
   (practice-habits
      (user-id ?id)
      (average-session-duration ?duration&:(< ?duration 30)))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "13")
      (category "practice-optimization")
      (advice "Consider slightly extending practice sessions to take advantage of your low fatigue levels.")
      (reason "low-fatigue-short-sessions")))
)
 

; -- Rule 14: Low Practice Frequency --
(defrule rule-14-inconsistent-practice
   (practice-habits
      (user-id ?id)
      (practice-days-per-week ?days&:(and (> ?days 0) (< ?days 4)))
      (practice-regularity inconsistent))
   (not (well-being
      (user-id ?id)
      (fatigue-level high)))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "14")
         (category "practice-frequency")
         (advice "Aim for a more consistent weekly schedule instead of sporadic sessions.")
         (reason "inconsistent-practice-pattern")))
)


; -- Rule 15: Increase Practicfe for Unemployed Users--
(defrule rule-15-unemployed-increase-practice
      (user-profile
         (user-id ?id)
         (employment-status unemployed)
         (weekly-working-hours ?hours&:(and (>= ?hours 0) (<= ?hours 19))))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "15")
      (category "practice-frequency")
      (advice "Consider increasing practice time.")
      (reason "unemployed-low-working-hours")))
)

; -- Rule 16: Flexible Schedule for Employed Users --
(defrule rule-16-flexible-schedule
      (user-profile
         (user-id ?id)
         (employment-status employed)
         (weekly-working-hours ?hours&:(>= ?hours 40)))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "16")
      (category "practice-frequency")
      (advice "Focus on quality practice sessions and consider a flexible schedule.")
      (reason "employed-high-working-hours")))
)

;------------------------------------------------------------
;-------------- Category 6: Practice Efficiency -------------
;------------------------------------------------------------

; -- Rule 17: Inefficient Practice --
(defrule rule-17-inefficient-practice
   (practice-habits
      (user-id ?id)
      (weekly-practice-minutes ?minutes&:(>= ?minutes 300)))  ; 5+ hours/week
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate low))
   (leetcode-skill
      (user-id ?id)
      (average-time-per-problem ?t&:(>= ?t 45)))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "17")
         (category "practice-efficiency")
         (advice "Review patterns and fundamentals to improve efficiency.")
         (reason "high-effort-low-success-indicates-inefficiency")))
)

; -- Rule 18: No Review Habit --
(defrule rule-18-no-review-habit
   (leetcode-performance
      (user-id ?id)
      (post-problem-review no)
      (recent-failure-rate high))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "18")
         (category "practice-efficiency")
         (advice "Develop a habit of reviewing problems after solving them.")
         (reason "no-post-problem-review-habit")))
)

; -- Rule 19: Performance Plateau Detection --
(defrule rule-19-performance-plateau
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak&:(>= ?streak 10))
      (weekly-practice-minutes ?minutes&:(>= ?minutes 240)))
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate moderate))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "19")
         (category "practice-efficiency")
         (advice "Introduce new problem patterns or time-based challenges to overcome performance plateau.")
         (reason "sustained-effort-moderate-performance-plateau")))
)

; -- Rule 20: Avoid Overtraining --
(defrule rule-20-avoid-overtraining
   (practice-habits
      (user-id ?id)
      (weekly-practice-minutes ?minutes&:(>= ?minutes 300))
      (days-until-interview ?days&:(> ?days 30)))
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate high))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "20")
         (category "practice-optimization")
         (advice "Shift focus toward depth and reflection rather than increasing volume.")
         (reason "high-volume-no-urgent-need")))
)
