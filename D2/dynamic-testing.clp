; --- to run use (batch "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/D2/dynamic-testing.clp")  ---

(clear)

(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/D2/Deterministic/facts.clp")
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/D2/Deterministic/rules.clp")

(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/D2/Certainty-Factors/cf-facts.clp")   
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/D2/Certainty-Factors/cf-rules.clp")

(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/D2/Fuzzy-Logic/fuzzy-facts.clp")
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/D2/Fuzzy-Logic/fuzzy-rules.clp")

; --- Start fact (ordered fact) ---
(deffacts initial
   (start))

; --- Rule with dynamic input ---
(defrule collect-person-info
   ?s <- (start)
=>
   (printout t "Enter your ID: ")
   (bind ?id (read))

   (printout t "Enter your fatigue level (very-low/low/moderate/high/very-high): ")
   (bind ?fatigue (read))

    (printout t "Enter your consistency level (very-low/low/moderate/high/very-high): ")
   (bind ?consistency (read))

   (printout t "Enter the number of days until your interview: ")
   (bind ?interview (read))

   (printout t "Enter your career goals: ")
    (bind ?goals (read))

    (printout t "Enter the number of mocks interviews completed: ")
    (bind ?mocks (read))

    (printout t "Enter your readiness confidence [0-1]: ")
    (bind ?confidence (read))

    (assert (user-profile
      (user-id ?id)
      (career-goal ?goals)))
   (assert (fatigue-fuzzy
      (user-id ?id)
      (level ?fatigue)))
    (assert (consistency-fuzzy
      (user-id ?id)
      (level ?consistency)))
   (assert (practice-habits
      (user-id ?id)
      (days-until-interview ?interview)))
   (assert (leetcode-performance
      (user-id ?id)
      (mock-interviews-completed ?mocks)))
    (assert (readiness-confidence
      (user-id ?id)
      (value ?confidence)))
    
   (retract ?s)
)

; --- Run automatically ---
(reset)
(run)
