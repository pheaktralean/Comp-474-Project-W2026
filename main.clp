; --- to run use (batch "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/main.clp")  ---

(clear)
(unwatch rules)
(unwatch facts)
(unwatch activations)


(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/facts.clp")
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/rules.clp")
(load "/Users/sopheaktralean/Downloads/SCHOOL/Winter 2026/Comp 474/Comp-474-Project-W2026/test-cases.clp")

; Debugging tools

(reset)

(assert (user-profile
            (user-id 100)
            (has-dsa-knowledge no)
            (career-goal internship)
            (employment-status unemployed)
            (weekly-working-hours 10)))
(assert (well-being
            (user-id 100)
            (fatigue-level high)
            (motivation-level moderate)))
(assert (practice-habits
            (user-id 100)
            (practice-streak 2)
            (average-session-duration 120)
            (days-until-interview 10)
            (practice-regularity inconsistent)
            (practice-days-per-week 2)))
(assert (leetcode-skill
            (user-id 100)
            (leetcode-experience-level beginner)
            (problems-solved-count 20)
            (current-problem-difficulty medium)
            (average-time-per-problem 50)))
(assert (leetcode-performance
            (user-id 100)
            (recent-failure-rate high)
            (recent-success-rate low)
            (post-problem-review no)))

(run)


