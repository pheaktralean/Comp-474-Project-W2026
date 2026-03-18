(clear)

(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/facts.clp")
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/rules.clp")

; --- Start fact (ordered fact) ---
(deffacts initial
   (start))

; --- Rule with dynamic input ---
(defrule collect-person-info
   ?s <- (start)
=>
   (printout t "Enter your ID: ")
   (bind ?id (read))

   (printout t "Enter your fatigue level (low/high): ")
   (bind ?fatigue (read))

   (printout t "Enter your practice streak (days): ")
   (bind ?days (read))

   (printout t "Enter your average session (minutes): ")
   (bind ?duration (read))

   (printout t "Enter your weekly practice (minutes): ")
   (bind ?weekly (read))

   (printout t "Enter your current problem difficulty (easy/medium/hard): ")
   (bind ?difficulty (read))

   (printout t "Enter your recent success rate (low/moderate/high): ")
   (bind ?success (read))

   (printout t "Enter the number of days until your interview: ")
   (bind ?interview (read))

   (assert (well-being
      (user-id ?id)
      (fatigue-level ?fatigue)))
   (assert (practice-habits
      (user-id ?id)
      (practice-streak ?days)
      (average-session-duration ?duration)
      (days-until-interview ?interview)
      (weekly-practice-minutes ?weekly)))
   (assert (leetcode-skill
      (user-id ?id)
      (current-problem-difficulty ?difficulty)))
   (assert (leetcode-performance
      (user-id ?id)
      (recent-success-rate ?success)))
   (retract ?s)
)

; --- Run automatically ---
(reset)
(run)
