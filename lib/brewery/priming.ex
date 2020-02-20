defmodule Atomic.Priming do
  @ml_per_gram 1.71

  def grams_per_bottle(size_ml, grams_per_liter), do: (size_ml * grams_per_liter) / 1000

  def priming_for(num_of_bottles, grams_per_liter, bottle_size) do
    sugar_per_bottle = grams_per_bottle(bottle_size, grams_per_liter)
    total_sugar = num_of_bottles * sugar_per_bottle
    priming_solution = total_sugar * @ml_per_gram

    solution_per_bottle = priming_solution / num_of_bottles

    %{
      priming_solution: round(priming_solution),
      total_sugar: round(total_sugar),
      solution_per_bottle: Float.round(solution_per_bottle, 1),
      sugar_per_bottle: sugar_per_bottle
    }
  end
end
