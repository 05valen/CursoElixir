defmodule Hola do
  def saluda(nombre \\ "tu") do
     "Hola #{nombre} !!!"
  end
end

IO.puts(Hola.saluda("juan"))
