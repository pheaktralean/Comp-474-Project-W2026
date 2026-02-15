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

; -- Category 1: Fundamental Knowledge --

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

; -- Category 2: Well-being Management --

; -- Rule 2: High Fatigue 
(defrule rule-2-high-fatigue-general
   (well-being
      (user-id ?id)
      (fatigue-level high))
   (practice-habits
      (user-id ?id)
      (practice-streak ?streak))
   (not (practice-habits
        (user-id ?id)
        (average-session-duration ?d&:(> ?d 90))))

=>
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
         (advice "Take a break or reduce practice intensity.")
         (reason "high-fatigue-short-streak")))
   )
)

; -- Rule 3: High Fatigue + Low motivation --
(defrule rule-3-fatigue-low-motivation
   (well-being
      (user-id ?id)
      (fatigue-level high)
      (motivation-level low))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "3")
      (category "well-being-management")
      (advice "Take a break or reduce practice intensity.")
      (reason "high-fatigue-low-motivation")))
)

; -- Rule 4: Small Goals for Low Motivation --
(defrule rule-4-achieve-small-goals
   (practice-habits
      (user-id ?id)
      (practice-streak ?days&:(< ?days 3)))
   (well-being
      (user-id ?id)
      (motivation-level low))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "4")
      (category "motivation-boost")
      (advice "Set small, achievable goals to build momentum.")
      (reason "low-motivation-short-streak")))
)  

; -- Rule 5: Reinforce Long Consistency --
(defrule rule-5-reinforce-consistency
   (practice-habits
      (user-id ?id)
      (practice-streak ?days&:(> ?days 7)))
   (not (well-being
      (user-id ?id)
      (fatigue-level high)))
   (not (user-profile
      (user-id ?id)
      (weekly-working-hours ?hours&:(and (>= ?hours 40) (< ?hours 60)))))

=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "5")
      (category "consistency-reinforcement")
      (advice "Keep up the great consistency!")
      (reason "long-practice-streak")))
)

; -- Rule 6: Shorter Sessions for High Fatigue --
(defrule rule-6-shorten-sessions
      (well-being
         (user-id ?id)
         (fatigue-level high))
      (practice-habits
         (user-id ?id)
         (average-session-duration ?duration&:(> ?duration 90)))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "6")
      (category "well-being-management")
      (advice "Shorten practice sessions to manage fatigue.")
      (reason "high-fatigue-long-sessions")))
)  

; -- Rule 7: Longer Sessions for Low Fatigue --
(defrule rule-7-extend-sessions
      (well-being
         (user-id ?id)
         (fatigue-level low))
      (practice-habits
         (user-id ?id)
          (average-session-duration ?duration&:(< ?duration 30)))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "7")
      (category "well-being-management")
      (advice "Extend practice sessions to take advantage of low fatigue levels.")
      (reason "low-fatigue-short-sessions")))
)

; -- Rule 8: Burnout Prevention for overworked but consistent users --
(defrule rule-8-burnout-prevention
      (user-profile
         (user-id ?id)
          (weekly-working-hours ?hours&:(and (>= ?hours 40) (< ?hours 60))))
      (practice-habits
         (user-id ?id)
         (practice-streak ?streak&:(> ?streak 7)))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "8")
      (category "well-being-management")
      (advice "Be mindful of burnout and consider incorporating rest days.")
      (reason "overworked-consistent-user")))
)     


; -- Category 3: Difficulty Selection --

; -- Rule 9: Beginner Avoid Medium or Hard --
(defrule rule-9-beginner-avoid-medium-hard
   (leetcode-skill
      (user-id ?id)
      (leetcode-experience-level beginner)
      (problems-solved-count ?count&:(< ?count 50))
      (current-problem-difficulty ?difficulty&:(or (eq ?difficulty medium)
                                                   (eq ?difficulty hard))))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "9")
      (category "difficulty-selection")
      (advice "Focus on easy problems to build confidence and skills.")
      (reason "beginner-with-low-problem-exposure")))
)

; -- Rule 10: Reduce Difficulty After Failures --
(defrule rule-10-reduce-difficulty-after-failure
   (leetcode-performance
      (user-id ?id)
      (recent-failure-rate high))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty medium))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "10")
      (category "difficulty-selection")
      (advice "Reduce difficulty to easy.")
      (reason "high-failure-rate-medium-difficulty")))
)

; -- Rule 11: Increase Difficulty After Success --
(defrule rule-11-increase-difficulty-after-success
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate high))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty easy))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "11")
      (category "difficulty-selection")
      (advice "Consider trying medium difficulty problems.")
      (reason "high-success-rate-easy-difficulty")))
)

; -- Rule 12: Switch from Hard After Low Success --
(defrule rule-12-switch-from-hard
   (leetcode-performance
      (user-id ?id)
      (recent-success-rate low))
   (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty hard))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "12")
      (category "difficulty-selection")
      (advice "Consider switching to medium difficulty problems.")
      (reason "low-success-rate-hard-difficulty")))
)

; -- Rule 13: Maintain Difficulty for Stable Beginner --
(defrule rule-13-stable-beginner
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
         (rule-id "13")
         (category "difficulty-selection")
         (advice "Maintain your current difficulty level.")
         (reason "steady-progress-stable-beginner")))
)


; -- Rule 14: Allow Harder Problems for Intermediate --
(defrule rule-14-intermediate-advance
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
         (rule-id "14")
         (category "difficulty-selection")
         (advice "You may attempt harder problems to further enhance your skills.")
         (reason "consistent-high-performance")))
)

; -- Rule 15: Gradual Progress with Plenty of Time
(defrule rule-15-slow-skill-progression
   (practice-habits
      (user-id ?id)
      (days-until-interview ?days&:(> ?days 31)))
=>  
   (assert (recommendation
      (user-id ?id)
      (rule-id "15")
      (category "skill-progression")
      (advice "Adopt a gradual skill progression.")
      (reason "plenty-of-time-before-interview")))
)

; -- Category 4: Practice Frequency --

; -- Rule 16: Low Practice Frequency --
(defrule rule-16-inconsistent-practice
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
         (rule-id "16")
         (category "practice-frequency")
         (advice "Aim for a more consistent weekly schedule instead of sporadic sessions.")
         (reason "inconsistent-practice-pattern")))
)


; -- Rule 17: Increase Practicfe for Unemployed Users--
(defrule rule-17-unemployed-increase-practice
      (user-profile
         (user-id ?id)
         (employment-status unemployed)
         (weekly-working-hours ?hours&:(and (>= ?hours 0) (<= ?hours 19))))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "17")
      (category "practice-frequency")
      (advice "Consider increasing practice time.")
      (reason "unemployed-low-working-hours")))
)

; -- Rule 18: Flexible Schedule for Employed Users --
(defrule rule-18-flexible-schedule
      (user-profile
         (user-id ?id)
         (employment-status employed)
         (weekly-working-hours ?hours&:(>= ?hours 40)))
=>
   (assert (recommendation
      (user-id ?id)
      (rule-id "18")
      (category "practice-frequency")
      (advice "Focus on quality practice sessions and consider a flexible schedule.")
      (reason "employed-high-working-hours")))
)

; -- Rule 19: Prioritize Interview Problems --
(defrule rule-19-interview-strategy
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
               (rule-id "19")
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
               (rule-id "19")
               (category "interview-preparation")
               (advice "Focus on medium-level interview problems.")
               (reason "interview-soon-ready-for-advancement"))))

   (if (< ?count 50)
      then
         (assert
            (recommendation
               (user-id ?id)
               (rule-id "19")
               (category "interview-preparation")
               (advice "Strengthen fundamentals before advancing.")
               (reason "interview-soon-low-exposure"))))
)

; -- Category 5: Practice Efficiency --

; -- Rule 20: Inefficient Practice --
(defrule rule-20-inefficient-practice
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
         (rule-id "20")
         (category "practice-efficiency")
         (advice "Review patterns and fundamentals to improve efficiency.")
         (reason "high-effort-low-success-indicates-inefficiency")))
)

; -- Rule 21: No Review Habit --
(defrule rule-21-no-review-habit
   (leetcode-performance
      (user-id ?id)
      (post-problem-review no)
      (recent-failure-rate high))
=>
   (assert
      (recommendation
         (user-id ?id)
         (rule-id "21")
         (category "practice-efficiency")
         (advice "Develop a habit of reviewing problems after solving them.")
         (reason "no-post-problem-review-habit")))
)