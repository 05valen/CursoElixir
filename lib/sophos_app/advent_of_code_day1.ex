defmodule SophosApp.AdventOfCode.Day1 do
 # alias SophosApp.MyList
  import String, only: [split: 3]

  def sum(list) do
    sum(list, 0)
  end

  defp sum([], n), do: n
  defp sum([h | t], n), do: sum(t, n + h)

  def filter_current_files() do
    "."
    |> Path.join("**/*.ex")
    |> Path.wildcard()
    |> Enum.filter(fn f ->
      String.contains?(Path.basename(f), "application")
    end)
  end

  def generate(n) when n > 0 do
    generate(n, [])
  end

  defp generate(0, list), do: list
  defp generate(n, list), do: generate(n - 1, [n | list])



  def deliver(instructions) do
    instructions
    |> split("", trim: true)
    |> evaluate(0)
  end

  def deliver_2(instructions) do
    instructions
    |> split("", trim: true)
    |> transform([])
    |> sum()
  end

  defp evaluate([], floor), do: floor

  defp evaluate([h | t], floor) do
    evaluate(t, walk(floor, h))
  end

  defp walk(floor, "("), do: floor + 1
  defp walk(floor, ")"), do: floor - 1

  defp transform([], list), do: list

  defp transform(["(" | t], list) do
    transform(t, [1 | list])
  end

  defp transform([")" | t], list) do
    transform(t, [-1 | list])
  end
end
