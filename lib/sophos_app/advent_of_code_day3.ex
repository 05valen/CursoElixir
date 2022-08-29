defmodule SophosApp.AdventOfCodeDay3 do

  def execPart1(route) do
    route
    |> String.split("")
    |> IO,inspect()
    |> Enum.map(&rules/1)
    |> IO,inspect()
    |> move()
    |> IO,inspect()
    |> Enum.uniq()
    |> IO,inspect()
    |> Enum.count()
  end

  defp move(route) do
    Enum.scan(route, fn
      ([i , j ],[ ip ,jp ]) -> [ i + ip , j + jp ]
    end)
  end

  def execPart2(route) do
    String.split(route,"")
    Enum.map(&rules/1)
    |>  moveTwoSantas()
  end

  defp rules ("") , do: [0 , 0]
  defp rules ("<") , do: [0 , 1]
  defp rules (">") , do: [0 , -1]
  defp rules ("^") , do: [1 , 0]
  defp rules ("v") , do: [-1 , 0]


  defp moveTwoSantas(route) do
    santaRoute =
      route
      |> Enum.with_index()
      |> Enum.map(&(validate_even_odd(&1, 1)))
      |> Enum.filter(fn x -> x != "" end)


    roboSantaRoute =
      route
      |> Enum.with_index()
      |> Enum.map(&(validate_even_odd(&1, 0)))
      |> Enum.filter(fn x -> x != "" end)


    santaMove = move(santaRoute)
    roboSantaMove = move(roboSantaRoute)

    Enum.concat(santaMove,roboSantaMove)
    |>Enum.uniq()
    |>Enum.count()

  end

  defp validate_even_odd({num, index},1) when rem(index, 2) == 1, do: num
  defp validate_even_odd({num, index},0) when rem(index, 2) == 0, do: num
  defp validate_even_odd(_), do: ""

end
