# Essentially this solves a probability for a flipped known.
# @begin solve_decision_tree
solve_decision_tree <- function(probability_a, probability_b, probability_c) {
  (probability_a * probability_b) + ((probability_a + probability_b) * probability_c)
}
# @end solve_decision_tree
solve_decision_tree(0.05, 0.7, 0.1)


# Independence Rule
# If there are different events make sure right one is flipped.
# @return What is probability of independent events with two outcomes?
# @param List[Vector[Numeric, Numeric]] probability pairs, where
#        first number is 0 if NOT and 1 otherwise.
# @begin what_is_probability_of_sequence
what_is_probability_of_sequence <- function(sequence) {
  counter = 1
  for(s in sequence) {
    if(s[1] == 0) {
      s = 1 - s[2]
    } else {
      s = s[2]
    }
    counter = counter * s
  }
  counter
}
# @end what_is_probability_of_sequence
what_is_probability_of_sequence(
  list(
    c(1, 0.8),
    c(1, 0.8),
    c(1, 0.2)
  )
)

# @return What is stacked probability of an outcome?
#         i.e., dependent probability.
# @param List[Vector] probability pairs
# @begin what_is_stacked_probability_outcome
what_is_stacked_probability_outcome <- function(probabilities) {
  counter = 0
  for(p in probabilities) {
    counter = counter + (p[1] * p[2])
  }
  counter
}
# @end what_is_stacked_probability_outcome
what_is_stacked_probability_outcome(
  list(
    c(0.9, 0.55),
    c(0.08, 0.45),
    c(0.02, 0.15)
  )
)

# @return What is stacked probability of an outcome with not?
# @param List[Vector] probability pairs
# @begin what_is_stacked_probability_outcome
what_is_stacked_probability_outcome_with_not <- function(probabilities) {
  counter = 0
  for(p in probabilities) {
    counter = counter + (p[1] * (1 - p[2]))
  }
  counter
}
# @end what_is_stacked_probability_outcome
what_is_stacked_probability_outcome_with_not(
  list(
    c(0.1, 0.9),
    c(0.9, 0.1),
    c(0.2, 0.8)
  )
)

what_is_stacked_probability_outcome(list(
  # supra-attribute, sub-attribute
  c(0.9, 0.6),
  # supra-attribute, sub-attribute
  c(0.08, 0.75),
  # supra-attribute, sub-attribute
  c(0.02, 0.60)
))


# @return What the probability of two mutually exclusive events
# @param Probability of event A
# @param Probability of event B
# @begin what_is_probability_of_two_mutually_exclusive_events_combined
what_is_probability_of_two_mutually_exclusive_events_combined <- function(A, B) {
  A+B
}
what_is_probability_of_two_mutually_exclusive_events_combined(0.1, 0.1)
# @end what_is_probability_of_two_mutually_exclusive_events_combined

# Given I have probability of two events
# And I have probability of an event Given another event
# Then return probability of one event, separate from other.
# @param probability_of_both Two events
# @param given_that Given that A then B == .
# @begin what_is_probability_of_two_events_given_relation
what_is_probability_of_two_events_given_relation <- function(probability_of_both = 0, given_that = 0) {
  outcome = probability_of_both / given_that
  print(outcome)
  print(fractions(outcome))
}
what_is_probability_of_two_events_given_relation(
  probability_of_both = 0.03,
  given_that = 0.36
)
# @end what_is_probability_of_two_events_given_relation

# @return What the probability of two dependent events is.
#         i.e.:
#           a. ((A), (B)) -> (A & B) [Given a and b what is probability of both?]
#           b. Given probability of A and a dependent B
#              What is probability of A and B?
# @param Probability of event A
# @param Probability of event B
# @begin what_is_probability_of_two_dependent_events
what_is_probability_of_two_dependent_events <- function(A, B) {
  outcome = A * B
  print(outcome)
  print(fractions(outcome))
}
what_is_probability_of_two_dependent_events(0.08, 0.37)
# @end what_is_probability_of_two_events

# @param Probability of an event.
# @param How many times to multiply the event.
# @return Likelihood of n events in a row.
# @begin what_is_probability_of_three_events
what_is_probability_of_n_events <- function(probability, number_of_events) {
  probability * number_of_events
}
what_is_probability_of_n_events((1-0.65), 2)
# @end what_is_probability_of_three_events

# @return What the probability of two independent events is.
# @param Probability of event A
# @param Probability of event B
# @param Probability of event C
# usage: whatIsProbabilityOfTwoEventsAndCombinedEvent(0.273, 0.403, 0.176)
what_is_probability_of_two_independent_events <- function(A, B, C) {
  (A+B-C)
}
what_is_probability_of_two_independent_events(0.273, 0.403, 0.176)

# @return Probability of Not
# @begin what_is_probability_that_this_and_not_that
what_is_probability_that_this_and_not_that <- function(a_what=0, both=0) {
  a_what - both
}
what_is_probability_that_this_and_not_that(a_what=0.7, both=0.2)
# @end what_is_probability_that_this_and_not_that

# @return Probability of Neither.
# @begin what_is_probability_that_neither
what_is_probability_that_neither <- function(a=0, b=0, both=0) {
  1 - ((a + b) - both)
}
what_is_probability_that_neither(a=0.6, b=0.5, both=0.4)
# @end what_is_probability_that_neither

# @return Probability of Either.
# @begin what_is_probability_that_either
what_is_probability_that_either <- function(a=0, b=0, both=0) {
  (a + (b) - both) 
}
what_is_probability_that_either(a=0.6, b=0.5, both=0.4)
# @end what_is_probability_that_either

# Conditional Probability Formula.
# GIVEN THAT.
# @param probability_of_both First dependent event
# @param given_what second dependent event
# @return probability of something given another thing
# @begin what_is_probability_given_that 
what_is_probability_given_that <- function(probability_of_both, probability_of_whats_given) {
  probability_of_both / probability_of_whats_given
}
# @end what_is_probability_given_that
what_is_probability_given_that(0.02, 0.05)


###################################
#            Tests                #
###################################
test_probability_that_neither <- function() {
  all.equal(what_is_probability_that_neither(0.6, 0.3, 0.2), 0.3)
}
test_probability_that_neither()

# So, what is probability of N events happening in a row?
test_what_is_probability_of_n_events <- function() {
  all.equal(what_is_probability_of_n_events(0.92, 3), 0.779)
}
test_what_is_probability_of_n_events()

test_what_is_probability_of_n_given_z <- function() {
  all.equal(what_is_probability_given_that(0.17, 0.3), 0.567)
}
test_what_is_probability_of_n_given_z()