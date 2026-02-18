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

   (printout t "Enter your dsa knowledge (yes/no): ")
   (bind ?dsa (read))

   (assert (user-profile
      (user-id ?id)
      (has-dsa-knowledge ?dsa)))

   (retract ?s)
)

; --- Run automatically ---
(reset)
(run)
