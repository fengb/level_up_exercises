####I'm going to need a few tools for this challenge:
  - Parser
  - some way to break down visits (either make an object for each visit, or treat the whole visitation recording as a big stream)
  - some calculation system for the statistics portion?

#####Inputs:
  - a huge JSON file with:
    - date
    - cohort
    - result

#####Expected Outputs:
- Total Sample Size of "Conversions" for each cohort
  - (WHAT IS A CONVERSION? HOW DO YOU CALCULATE?)
- Conversion *rate*
  - Includes "error bars" (not sure what these are) for each cohort with a 95% confidence
  - how to determine 95% confidence?
- Confidence levels:
  - Current leader better than random
  - Use Chi-squared [test](http://www.usereffect.com/split-test-calculator)
  - Use gems if you want

#####Important Formulas:

- There is a concept called standard error, which tells how much deviation from average conversion rate (p) can be expected if this experiment is repeated multiple times.
  - Smaller the deviation, more confident you can be about estimating true conversion rate.
  - For a given conversion rate (p) and number of trials (n), standard error is calculated as:

  `Standard Error (SE) = Square root of (p * (1-p) / n)`

####How to go about solving this challenge:
Method #1
  - Parse JSON (learn about JSON module for Ruby)
  - Create "Visitor" class that JSON parses down to objects of visitors
  - Decide where to keep logic for referencing information from "Visits" class

Method #2
  - Parse JSON (learn about JSON module for Ruby)
  - Create a class that encapsulates *all* visits (kind of like a "race" or a "flight" in your previous apps)
  - that Visits class could hold a bunch of self-referencing...
