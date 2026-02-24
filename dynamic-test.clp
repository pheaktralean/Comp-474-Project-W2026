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
    (printout t"Enter your ID: ")
    (bind ?id (read))

   (printout t "Enter your fatigue level (low/high): ")
   (bind ?fatigue (read))

   (printout t "Enter your practice streak (days): ")
   (bind ?days (read))

   (printout t "Enter your average session (minutes): ")
   (bind ?duration (read))


   (assert (well-being
      (user-id ?id)
      (fatigue-level ?fatigue)))
   (assert (practice-habits
      (user-id ?id)
      (practice-streak ?days)
      (average-session-duration ?duration)))
   (retract ?s)
)

; --- Run automatically ---
(reset)
(run)
