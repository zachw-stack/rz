library(methods)

# @begin Proportion
proportion <- setRefClass("Proportion",
                       fields=list(
                         p_hat="numeric",
                         sample_size="numeric",
                         p_prime="numeric",
                         proportion="numeric",
                         margin_of_error="numeric",
                         critical_value="numeric",
                         q_hat="numeric",
                         population_size="numeric",
                         confidence_level="numeric",
                         lower_bound="numeric",
                         upper_bound="numeric"
                       ),
                       methods=list(
                         init_p_hat = function(){
                           p_hat <<- (sample_size/population_size)
                           p_prime <<- p_hat
                           proportion <<- p_hat
                           q_hat <<- (1 - p_hat)
                         },
                         init_df = function(){
                           sample_size <- length(sample)
                           degrees_of_freedom <<- sample_size - 1
                         },
                         init_sample_size = function(){
                           sample_size <<- length(sample)
                         },
                         init_z_score = function(){
                           (p_hat - p)/(sqrt((p_hat * q_hat)/sample_size))
                         },
                         init_alpha = function() {
                           alpha <<- 1 - confidence_level
                         },
                         init_critical_value = function() {
                           init_alpha()
                           critical_value <<- alpha/2
                         },
                         init_margin_of_error = function(){
                           init_critical_value()
                           margin_of_error <<- (critical_value) * (sqrt((p_hat*(1-p_hat))/sample_size))
                         },
                         init_standard_deviation = function() {
                           init_p_hat
                           sqrt((p_hat * (1-p_hat))/sample_size)
                         },
                         # Works
                         init_upper_and_lower_bound = function() {
                           init_critical_value()
                           init_p_hat()
                           lower_bound <<- qnorm(
                             critical_value, p_hat, sqrt(p_hat*(1-p_hat)/population_size)
                           )
                           upper_bound <<- qnorm(
                             (1-critical_value), p_hat, sqrt(p_hat*(1-p_hat)/population_size)
                           )
                         },
                         init_optimal_sample_size = function() {
                           init_margin_of_error()
                           init_p_hat()
                           (((critical_value) ^ 2)*(p_hat * q_hat))/(margin_of_error ^ 2)
                         }
                       )
)
# @end Proportion

#########################
#       Tests           #
#########################

# Given A list of people at an Ice Chalet, 
# Find proportion of girls 8-12 in class,
# With a 92% confidence interval.
p <- proportion(
  population_size = 80,
  sample_size = 64,
  confidence_level=0.92
)

# Given A list of babies with chemicals, find mean range for given confidence interval
p <- proportion(
  population_size = 200,
  sample_size = 14,
  confidence_level=0.95
)

# Given students, find percentage who are registered voters.
# Do this with a 90% confidence interval.
p <- proportion(
  population_size = 500,
  sample_size = 300,
  confidence_level=0.90
)
