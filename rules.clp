; -- User Background knowledge with DSA rules --
(defrule no-dsa-knowledge-advice
    (user-background
        (user-id ?id)
        (has-dsa-knowledge no))
=>
    (printout t
        "User " ?id
        ": It appears you lack foundational DSA knowledge. Consider starting with basic data structures and algorithms before tackling complex problems."
        crlf)
)

; --- User well-being and fatigue rules ---

(defrule high-fatigue-advice
   (user-fatigue
      (user-id ?id)
      (fatigue-level high))
    (not
      (consistency
         (user-id ?id)
         (practice-streak long)))
=>
   (printout t
      "User " ?id ": Light practice or rest is recommended." crlf)
)

(defrule fatigue-and-low-motivation
   (user-fatigue
      (user-id ?id)
      (fatigue-level high))
   (motivation
      (user-id ?id)
      (motivation-level low))
=>
    (printout t
         "User " ?id ": High fatigue and low motivation detected. Recovery is recommended before increasing workload." crlf)
)

(defrule planned-recovery-break
   (consistency
      (user-id ?id)
      (practice-streak long))
   (user-fatigue
      (user-id ?id)
      (fatigue-level high))
=>
   (printout t
      "User " ?id
      ": You have maintained a long practice streak but are showing high fatigue. A planned recovery break is recommended to prevent burnout."
      crlf)
)


; -- LeetCode experience-based advice rules --

(defrule beginner-avoid-medium-hard
   (leetcode-experience
      (user-id ?id)
      (leetcode-experience-level beginner)
      (problems-solved-count low)
      (current-problem-difficulty ?difficulty&:(or (eq ?difficulty medium)
                                                   (eq ?difficulty hard))))
=>
   (printout t
      "User " ?id
      ": As a beginner with low experience, focus on easy problems to build confidence."
      crlf)
)

(defrule reduce-difficulty-after-failure
   (performance
      (user-id ?id)
      (recent-failure-rate high))
   (leetcode-experience
      (user-id ?id)
      (current-problem-difficulty medium))
=>
   (printout t
      "User " ?id
      ": High failure rate on medium problems. Reduce difficulty to easy to rebuild understanding."
      crlf)
)

(defrule increase-difficulty-after-success
   (performance
      (user-id ?id)
      (recent-success-rate high))
   (leetcode-experience
      (user-id ?id)
      (current-problem-difficulty easy))
=>
   (printout t
      "User " ?id
      ": Strong performance on easy problems. Consider moving up to medium difficulty."
      crlf)
)

(defrule switch-from-hard-after-low-success
   (performance
      (user-id ?id)
      (recent-success-rate low))
   (leetcode-experience
      (user-id ?id)
      (current-problem-difficulty hard))
=>
   (printout t
      "User " ?id
      ": Low success rate on hard problems. Switch to easier problems and review fundamentals."
      crlf)
)

; -- Experience Progression Rules --

(defrule maintain-difficulty-for-stable-beginner
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
        ": You are making steady progress as a beginner. Maintain your current difficulty."
        crlf)
)

(defrule allow-harder-problems-for-intermediate
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
        ":Strong performance detected. As an intermediate learner, you may try occasional harder problems beyond your current difficulty level."crlf)

)

; -- Practice Frequency Rules --

(defrule low-practie-days-per-week
      (availability
         (user-id ?id)
         (practice-days-per-week low)) 
=>
      (printout t
         "User " ?id
         ": Increasing practice days per week can enhance learning consistency." crlf)

)

(defrule increase-practice-schedule
      (employment
         (user-id ?id)
         (employment-status unemployed)
         (weekly-working-hours low))
=>
      (printout t
         "User " ?id
         ": With more available time, consider increasing your practice schedule for better results." crlf)
)

(defrule flexible-schedule-for-employed
      (employment
         (user-id ?id)
         (employment-status employed)
         (weekly-working-hours high))
=>
      (printout t
         "User " ?id
         ": Balancing work and practice is key. Consider shorter, focused sessions to fit your busy schedule." crlf)
)

; -- Time constraint rules --
(defrule prioritize-interview-style-problem
      (availability
         (user-id ?id)
         (days-until-interview limited))
      (career-goals
         (user-id ?id)
         (career-goal internship))
=>
      (printout t
         "User " ?id
         ": With limited time until your internship interview, prioritize practicing interview-style problems." crlf)
)

(defrule balanced-practice-for-far-interview
      (availability
         (user-id ?id)
         (days-until-interview low)
         (practice-days-per-week low))
=>    
      (printout t
         "User " ?id
         ": With ample time before your interview, focus on balanced practice to build overall skills." crlf)
)

(defrule slow-skill-Progression
      (availability
         (user-id ?id)
         (days-until-interview far))
=>  
      (printout t
         "User " ?id
         ": With plenty of time before your interview, adopt a gradual skill progression strategy for deep learning." crlf)
)

; -- Consistency and Habit rules --
(defrule achieve-small-goals
      (consistency
         (user-id ?id)
         (practice-streak short))
      (motivation
         (user-id ?id)
         (motivation-level low))
=>
      (printout t
         "User " ?id
         ": To boost motivation, set small, achievable practice goals to build consistency." crlf)
)  

(defrule reinforce-consistent-practice
      (consistency
         (user-id ?id)
         (practice-streak long))
=>
      (printout t
         "User " ?id
         ": You are maintaining a consistent practice schedule. Keep it up!" crlf)
)  

; -- Session Duration Rules --
(defrule short-session-for-high-fatigue
      (user-fatigue
         (user-id ?id)
         (fatigue-level high))
      (availability
         (user-id ?id)
         (average-session-duration long))
=>
      (printout t
         "User " ?id 
         ": Consider shortening your practice sessions to manage high fatigue levels." crlf)
)  

(defrule longer-sessions-for-low-fatigue
      (user-fatigue
         (user-id ?id)
         (fatigue-level low))
      (availability
         (user-id ?id)
         (average-session-duration short))
=>
      (printout t 
         "User " ?id 
         ": With low fatigue levels, you can consider extending your practice session durations for deeper focus." crlf)
)


