; --- to run use (batch "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/main.clp")  ---

(clear)

(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/facts.clp")
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/rules.clp")

(reset)

; -- Dynamic User Data for Testing --
(assert 
   (user-background
      (user-id 20)
      (has-dsa-knowledge no))
)
(assert
   (user-fatigue
      (user-id 20)
      (fatigue-level high))
)
(assert
   (motivation
      (user-id 20)
      (motivation-level low))
)   
(assert
   (consistency
      (user-id 20)
      (practice-streak long))
)


; -- Reading command --
(printout t "Enter user id: ")
(bind ?uid (read))

(printout t "Enter fatigue level (low moderate high): ")
(bind ?fatigue (read))

(printout t "Enter motivation level (low moderate high): ")
(bind ?motivation (read))

(assert
   (user-fatigue
      (user-id ?uid)
      (fatigue-level ?fatigue))
)

(assert
   (motivation
      (user-id ?uid)
      (motivation-level ?motivation))
)


(run)

