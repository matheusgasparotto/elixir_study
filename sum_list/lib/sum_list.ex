defmodule SumList do
  def call(list), do: sum(list, 0)

  defp sum([], acc) do
    acc
  end

  defp sum([head | tail], acc) do
    acc = acc + 1
    sum(tail, acc)
  end
end

defmodule FilterList do
  import Integer

  def filter([], acc) do
    acc
  end

  def filter(list, acc) do
    [head | tail] = list

    parsed_number = fn
      {number, ""} -> number
      :error -> nil
    end

    number = parsed_number.(Integer.parse(head))

    is_even = Integer.is_odd(number)

    acc =
      if is_even do
        acc + 1
      else
        acc
      end

    filter(tail, acc)
  end
end
