COMP 474 Project Winter 2026 \
Group option: 1 \
Student Name: Sopheaktra Lean 

# Project Overview
This project implements a rule-based expert system in CLIPS that generates personalized and explainable LeetCode practice plans for computer science students preparing for technical interviews. 

The system does not solve algorithmic problems. Instead, it focuses on:
- Difficulty selection strategies
- Practice structure and time allocation
- Performance-based adjustments
- Interview timeline adaptation
- Burnout and inefficiency detection

The knowledge is represented using IF–THEN production rules and structured fact templates.

--------

## Project Goal
The goal of the system is to provide:
- Personalized recommendations based on user practice history and performance
- Explainable reasoning through rule activation
- Structured practice planning within short-term interview preparation windows

The system uses heuristic-based reasoning inspired by common technical interview preparation strategies.

--------

## Knowledge Structure
The knowledge base contains:
- 20 production rules
- Organized into 6 categories:
    1. Fundamental Knowledge Rules
    2. Well-being Management Rules
    3. Difficulty Selection Rules
    4. Interview Strategy Rules
    5. Practice Structure and Time Allocation Rules
    6. Practice Inefficiency Rules

Each rule generates structured recommendation facts with:
1. rule-id
2. category
3. advice
4. reasoning explanation

------

## File Structure
``` facts.clp ```

Contains:
- Fact templates
- Slot definitions
- Input constraints (types and bounds)

Defines structured user data including:
- Practice frequency
- Session duration
- Performance metrics
- Topic coverage
- Interview timeline
- Fatigue indicators

```rules.clp```

Contains:
- All 20 production rules
- Categorized by domain logic
- Rule-based reasoning for recommendations
Each rule asserts a ```recommendation``` fact when triggered.

``` main.clp ```

Main execution file:
- Loads facts and rules
- Initializes environment
- Runs inference engine

``` test-caes.clp ```

Contains:
- Predefined test scenarios
- Static fact assertions for rule validation
- Used to verify rule correctness and coverage

``` dynamic-test.clp ```

Used for:
- Interactive user prompting
- Dynamic fact insertion
- Real-time testing of rule activation

-----

## How to Run the System
1. Open CLIPS
2. Load files in this order:
```
(load "facts.clp")
(load "rules.clp")
(load "main.clp")
```

For static testing:
```
(load "test-cases.clp")
(reset)
(run)
```

For dynamic testing:
```
(load "dynamic-test.clp")
(reset)
(run)
```

Optional Debugging Tools:
```
(watch rules)
(watch facts)
(watch activations)
```

-----

