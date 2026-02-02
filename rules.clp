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
