suggest_statistical_test <- function(hypothesis_type, var_scale, dependent_var = NULL) {
  # Convert hypothesis type and var_scale to lower case
  hypothesis_type <- tolower(hypothesis_type)
  var_scale <- tolower(var_scale)

  # Check the type of hypothesis and variable scale
  if (hypothesis_type == "difference") {
    if (var_scale == "interval" || var_scale == "ratio") {
      test <- "Two-sample t-test"
    } else if (var_scale == "ordinal" || var_scale == "nominal") {
      test <- "Mann-Whitney U test"
    } else if (var_scale == "binary") {
      test <- "Two-sample proportion test"
    } else {
      stop("Variable scale not recognized. Choose from 'interval', 'ratio', 'ordinal', 'nominal', or 'binary'.")
    }
  } else if (hypothesis_type == "relationship") {
    if (var_scale == "interval" || var_scale == "ratio") {
      test <- "Pearson correlation"
    } else if (var_scale == "ordinal" || var_scale == "nominal") {
      test <- "Chi-squared test"
    } else if (var_scale == "binary") {
      test <- "Two-sample proportion test"
    } else {
      stop("Variable scale not recognized. Choose from 'interval', 'ratio', 'ordinal', 'nominal', or 'binary'.")
    }
  } else if (hypothesis_type == "regression") {
    if (dependent_var == NULL) {
      stop("Dependent variable scale not provided. Please specify if the dependent variable is on an 'interval' or 'ratio' scale.")
    } else if (var_scale != "interval" && var_scale != "ratio") {
      stop("Independent variable scale not recognized. Choose from 'interval' or 'ratio'.")
    } else if (dependent_var != "interval" && dependent_var != "ratio") {
      stop("Dependent variable scale not recognized. Choose from 'interval' or 'ratio'.")
    } else {
      test <- "Linear regression"
    }
  } else if (hypothesis_type == "proportional frequency") {
    if (var_scale == "nominal") {
      test <- "Chi-squared test for goodness of fit"
    } else if (var_scale == "binary") {
      test <- "One-sample proportion test"
    } else {
      stop("Variable scale not recognized. Choose from 'nominal' or 'binary'.")
    }
  } else if (hypothesis_type == "variance") {
    if (var_scale != "interval" && var_scale != "ratio") {
      stop("Variable scale not recognized. Choose from 'interval' or 'ratio'.")
    } else {
      test <- "One-way ANOVA"
    }
  } else {
    stop("Hypothesis type not recognized. Choose from 'difference', 'relationship', 'regression', 'proportional frequency', or 'variance'.")
  }

  return(test)
}
