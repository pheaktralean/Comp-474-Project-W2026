; -- Rule 1: No DSA Knowledge --
(defrule rule-1-no-dsa-knowledge
    (user-background
        (user-id ?id)
        (has-dsa-knowledge no))
=>
    (printout t
        "User " ?id
        ": It appears you lack foundational DSA knowledge. Start with basic data structures and algorithms."
        crlf)
)

; -- Rule 2: High Fatigue 
(defrule rule-2-high-fatigue-general
   (user-fatigue
      (user-id ?id)
      (fatigue-level high))
   (not (consistency
      (user-id ?id)
      (practice-streak long)))
   (not (motivation
      (user-id ?id)
      (motivation-level low)))
=>
   (printout t
      "User " ?id
      ": Light practice or rest is recommended."
      crlf)
)

; -- Rule 3: High Fatigue + Low motivation --
(defrule rule-3-fatigue-low-motivation
   (user-fatigue
      (user-id ?id)
      (fatigue-level high))
   (motivation
      (user-id ?id)
      (motivation-level low))
=>
    (printout t
         "User " ?id ": High fatigue and low motivation detected. Recovery is recommended." crlf)
)

; -- Rule 4: High Fatigue + Long Streak --
(defrule rule-4-planned-recovery
   (consistency
      (user-id ?id)
      (practice-streak long))
   (user-fatigue
      (user-id ?id)
      (fatigue-level high))
=>
   (printout t
      "User " ?id
      ": Long practice streak with high fatigue detected. Take a planned recovery break."
      crlf)
)

; -- Rule 5: Beginner Avoid Medium or Hard --
(defrule rule-5-beginner-avoid-medium-hard
   (leetcode-experience
      (user-id ?id)
      (leetcode-experience-level beginner)
      (problems-solved-count low)
      (current-problem-difficulty ?difficulty&:(or (eq ?difficulty medium)
                                                   (eq ?difficulty hard))))
=>
   (printout t
      "User " ?id
      ": Focus on easy problems to build confidence."
      crlf)
)

; -- Rule 6: Reduce Difficulty After Failures --
(defrule rule-6-reduce-difficulty-after-failure
   (performance
      (user-id ?id)
      (recent-failure-rate high))
   (leetcode-experience
      (user-id ?id)
      (current-problem-difficulty medium))
=>
   (printout t
      "User " ?id
      ": High failure rate detected. Reduce difficulty to easy."
      crlf)
)

; -- Rule 7: Increase Difficulty After Success --
(defrule rule-7-increase-difficulty-after-success
   (performance
      (user-id ?id)
      (recent-success-rate high))
   (leetcode-experience
      (user-id ?id)
      (current-problem-difficulty easy))
=>
   (printout t
      "User " ?id
      ": Strong performance. Try medium difficulty problems."
      crlf)
)

; -- Rule 8: Switch from Hard After Low Success --
(defrule rule-8-switch-from-hard
   (performance
      (user-id ?id)
      (recent-success-rate low))
   (leetcode-experience
      (user-id ?id)
      (current-problem-difficulty hard))
=>
   (printout t
      "User " ?id
      ": Low success on hard problems. Switch to easier ones."
      crlf)
)

; -- Rule 9: Maintain Difficulty for Stable Beginner --
(defrule rule-9-stable-beginner
    (leetcode-experience
        (user-id ?id)
        (leetcode-experience-level beginner))
    (performance
        (user-id ?id)
        (recent-success-rate moderate))
    (consistency
        (user-id ?id)
        (practice-streak moderate))
=>
    (printout t
        "User " ?id
        ": Steady progress detected. Maintain current difficulty."
        crlf)
)

; -- Rule 10: Allow Harder Problems for Intermediate --
(defrule rule-10-intermediate-advance
    (leetcode-experience
        (user-id ?id)
        (leetcode-experience-level intermediate)
        (current-problem-difficulty ?difficulty&:(or (eq ?difficulty easy)
                                                   (eq ?difficulty medium))))
    (performance
        (user-id ?id)
        (recent-success-rate high))
    (consistency
        (user-id ?id)
        (practice-regularity consistent))
=>
    (printout t
        "User " ?id
        ":Strong performance detected. You may attempt occasional harder problems."crlf)

)

; -- Rule 11: Low Practice Frequency --
(defrule rule-11-low-practice-frequency
      (availability
         (user-id ?id)
         (practice-days-per-week low)) 
=>
      (printout t
         "User " ?id
         ": Increase weekly practice frequency for better consistency." crlf)

)

; -- Rule 12: Increase Practicfe for Unemployed Users--
(defrule rule-12-unemployed-increase-practice
      (employment
         (user-id ?id)
         (employment-status unemployed)
         (weekly-working-hours low))
=>
      (printout t
         "User " ?id
         ": Consider increasing practice time." crlf)
)

; -- Rule 13: Flexible Schedule for Employed Users --
(defrule rule-13-flexible-schedule
      (employment
         (user-id ?id)
         (employment-status employed)
         (weekly-working-hours high))
=>
      (printout t
         "User " ?id
         ": Use short, focused practice sessions." crlf)
)

; -- Rule 14: Prioritize Interview Problems --
(defrule rule-14-prioritize-interview
      (availability
         (user-id ?id)
         (days-until-interview limited))
      (career-goals
         (user-id ?id)
         (career-goal internship))
=>
      (printout t
         "User " ?id
         ": Prioritize practicing interview-style problems." crlf)
)

; -- Rule 15: Gradual Progress with Plenty of Time
(defrule rule-15-slow-skill-progression
      (availability
         (user-id ?id)
         (days-until-interview far))
=>  
      (printout t
         "User " ?id
         ": Adopt a gradual skill progression." crlf)
)

; -- Rule 16: Small Goals for Low Motivation --
(defrule rule-16-achieve-small-goals
      (consistency
         (user-id ?id)
         (practice-streak short))
      (motivation
         (user-id ?id)
         (motivation-level low))
=>
      (printout t
         "User " ?id
         ": Set small achievable goals to build motivation and consistency." crlf)
)  

; -- Rule 17: Reinforce Long Consistency --
(defrule rule-17-reinforce-consistency
      (consistency
         (user-id ?id)
         (practice-streak long))
      (not (user-fatigue
         (user-id ?id)
         (fatigue-level high)))
=>
      (printout t
         "User " ?id
         ": Great job maintaining consistent practice." crlf)
)  

; -- Rule 18: Shorter Sessions for High Fatigue --
(defrule rule-18-shorten-sessions
      (user-fatigue
         (user-id ?id)
         (fatigue-level high))
      (availability
         (user-id ?id)
         (average-session-duration long))
=>
      (printout t
         "User " ?id 
         ": Shorten sessions to manage fatigue." crlf)
)  

; -- Rule 19: Longer Sessions for Low Fatigue --
(defrule rule-19-extend-sessions
      (user-fatigue
         (user-id ?id)
         (fatigue-level low))
      (availability
         (user-id ?id)
         (average-session-duration short))
=>
      (printout t 
         "User " ?id 
         ": Extend sessions to take advantage of low fatigue levels." crlf)
)

; -- Rule 20: Burnout Prevention for overworked but consistent users --
(defrule rule-20-burnout-prevention
      (employment
         (user-id ?id)
         (weekly-working-hours high))
      (consistency
         (user-id ?id)
         (practice-streak long))
=>
      (printout t
         "User " ?id
         ": Consider taking a break to prevent burnout." crlf)
)  



