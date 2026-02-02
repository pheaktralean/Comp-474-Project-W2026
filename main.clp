; --- to run use (batch "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/main.clp")  ---

(clear)

(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/facts.clp")
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/rules.clp")

(reset)

; --- Sample user for demonstration ---
(assert (user-fatigue (user-id 3) (fatigue-level high)))
(assert (motivation (user-id 3) (motivation-level low)))
(assert
   (leetcode-experience
      (user-id 4)
      (leetcode-experience-level beginner)
      (problems-solved-count medium)
      (current-problem-difficulty easy)))

(assert
   (consistency
      (user-id 4)
      (practice-streak moderate)
      (practice-regularity consistent)))

(assert
   (performance
      (user-id 4)
      (recent-success-rate moderate)
      (recent-failure-rate low)
      (topic-coverage balanced)))

(assert
   (leetcode-experience
      (user-id 5)
      (leetcode-experience-level intermediate)
      (problems-solved-count high)
      (current-problem-difficulty medium)))

(assert
   (performance
      (user-id 5)
      (recent-success-rate high)
      (recent-failure-rate low)
      (topic-coverage broad)))

(assert
   (consistency
      (user-id 5)
      (practice-streak moderate)
      (practice-regularity consistent)))

(assert
    (user-fatigue
        (user-id 6)
        (fatigue-level high)))

(assert
    (consistency
        (user-id 6)
        (practice-streak long)))

(run)

