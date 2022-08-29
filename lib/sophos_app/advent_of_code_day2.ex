defmodule SophosApp.AdventOfCode.Day2 do

  def exec_part1(cadena) do
    String.split(cadena,"\n")
    |>Enum.map(fn x -> String.split(x, "x") end)
    |>Enum.filter(fn x -> x != [""] end)
    |>Enum.map(fn x -> Enum.map(x, fn x -> String.to_integer(x) end)end)
    |>Enum.map(fn x -> areaSuperficial(x) end)
    |>Enum.sum()
  end


  defp area_superficial([l,w,h]) do
    areas = [l * w , w * h , l * h]
    # min = Enum.min(areas)
    # Enum.sum(areas)*2 + min
    areas
    |> Enum.sum()
    |> kernel.*(2)
    |> kernel.+(Enum.min(areas))
  end

  def exec_part2(cadena) do
    String.split(cadena,"\n")
    |> Enum.map(fn x -> String.split(x, "x") end)
    |> Enum.filter(fn x -> x != [""] end)
    |> Enum.map(fn x -> Enum.map(x, fn x -> String.to_integer(x) end)end)
    |> Enum.map(fn x -> largoListon(x) end)
    |> Enum.sum()
  end

  defp largo_liston([_l , _w, _h] = dimensions) do
    [min, min2, tail] = dimensions |> Enum.sort()
    bow = min * min2 * tail
    length = min * 2 + min2 * 2
    bow + length
  end

end
