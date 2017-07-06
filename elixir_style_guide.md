## Module Structure

- If a private function is used by only one public function, place it directly below that function. If a private function is used by multiple public functions, place it below the the last function that uses it.

    ```elixir
    def foo, do: do_foo + something

    defp do_foo, do: 1

    def bar, do: do_bar + something

    defp do_bar, do: 2

    defp something, do: 100

    ```

- Do not put blank lines between different definitions for the same function (where name and arity match).

    ```elixir
    def foo(0), do: 0
    def foo(x), do: x + 1

    def foo(x, y), do: x * y
    ```

- Identify callback implementations with `@impl SomeModule`, replacing `SomeModule` with the name of the module that defines the callback.

- Alias other modules directly under your app's namespace that are referenced within your module.

    ```elixir
    alias MyApp.{Alpha, Bravo}

    def foo, do: Alpha.foo + Bravo.foo
    ```

- List directives in the following order:

    ```elixir
    use Application
    doctest MyApp

    alias MyApp.{Alpha, Bravo}
    import Something, only: [foo: 1]
    require SomethingElse
    ```

- Avoid importing whole modules; import only the functions you need using the `only:` option. You can make an exception for `Ecto.Changeset`.

    ```elixir
    import Ecto.Changeset
    import Something, only: [foo: 0, foo: 1, bar: 1]
    ```

## Syntax

- Limit length to 80, except for function signatures and test descriptions.

- Use `===` unless you actually need `==`. Use `!==` unless you actually need `!=`.

- Put spaces after commas.

- Put spaces around binary operators.

- Do not pad matched pairs with spaces.

    ```elixir
    # bad
    << "foo" >>
    %{ a: "alpha", b: "bravo" }
    { :ok, 42 }
    [ 1, 2, 3 ]

    # good
    <<"foo">>
    %{a: "alpha", b: "bravo"}
    {:ok, 42}
    [1, 2, 3]
    ```

- When a keyword list, list, or map spans multiple lines, place the delimiters on separate lines from the items. Do not omit the comma from the final item.

    ```elixir
    # bad
    [a: "alpha",
     b: "bravo",
     c: "charlie",
     d: "delta",
     e: "echo",
     f: "foxtrot",
     g: "golf"]

    # good
    [
      a: "alpha",
      b: "bravo",
      c: "charlie",
      d: "delta",
      e: "echo",
      f: "foxtrot",
      g: "golf",
    ]
    ```

    ```elixir
    # bad
    %{a: "alpha",
      b: "bravo",
      c: "charlie",
      d: "delta",
      e: "echo",
      f: "foxtrot",
      g: "golf"}

    # good
    %{
      a: "alpha",
      b: "bravo",
      c: "charlie",
      d: "delta",
      e: "echo",
      f: "foxtrot",
      g: "golf",
    }

    ```

    ```elixir
    # bad
    ["alpha",
     "bravo",
     "charlie",
     "delta",
     "echo",
     "foxtrot",
     "golf",
     "hotel",
     "india"]

    # good
    [
      "alpha",
      "bravo",
      "charlie",
      "delta",
      "echo",
      "foxtrot",
      "golf",
      "hotel",
      "india",
    ]
    ```

- If a call ends in a keyword list, omit the square brackets.

    ```elixir
    # bad
    foo(42, [with: 1, and: 2])

    # good
    foo(42, with: 1, and: 2)
    ```

- If you can fit a function definition or `if` statement on one line, do so.

    ```elixir
    # bad
    def foo do
      42
    end

    # good
    def foo, do: 42
    ```

    ```elixir
    # bad
    if year > 2016 do
      42
    else
      3
    end

    # good
    if year > 2016, do: 42, else: 3
    ```

- If, and only if, you can fit **each and every** clause and body in an anonymous function or `case` statement on one line, do so.

    ```elixir
    # bad
    foo = fn
      nil ->
        :error
      _ ->
        :ok
    end

    # good
    foo = fn
      nil -> :error
      _ -> :ok
    end
    ```

    ```elixir
    # bad
    case foo.(x) do
      :ok ->
        42
      :error ->
        3
    end

    # good
    case foo.(x) do
      :ok -> 42
      :error -> 3
    end
    ```

    ```elixir
    # bad
    bar = fn
      nil ->
        IO.puts("ERROR")
        :error
      _ -> :ok
    end

    # good
    bar = fn
      nil ->
        IO.puts("ERROR")
        :error
      _ ->
        :ok
    end
    ```

    ```elixir
    # bad
    case bar.(x) do
      :ok -> 7
      x ->
        x
        |> inspect()
        |> raise()
    end

    # good
    case bar.(x) do
      :ok ->
        7
      x ->
        x
        |> inspect()
        |> raise()
    end
    ```

- Omit the parentheses from macro calls.

- If a function call fits on one line, use parentheses. If it spans multiple lines and ends in a keyword list or anonymous function, omit the parentheses.

    ```elixir
    # bad
    String.split string, "-", parts: 2

    # good
    String.split(string, "-", parts: 2)
    ```

    ```elixir
    # bad
    Enum.all? list, fn x -> String.valid?(x) and String.ends_with?(x, "s") end

    # good
    Enum.all?(list, fn x -> String.valid?(x) and String.ends_with?(x, "s") end)
    ```

    ```elixir
    # bad
    IO.inspect(some_data_structure,
      pretty: true,
      structs: false,
      binaries: :as_strings,
      charlists: :as_charlists,
      base: :binary)

    # good
    IO.inspect some_data_structure,
      pretty: true,
      structs: false,
      binaries: :as_strings,
      charlists: :as_charlists,
      base: :binary
    ```

    ```elixir
    # bad
    Enumerable.reduce(transactions, {:cont, 0}, fn t, acc ->
      if t.date.year > 2001, do: {:halt, acc}, else: {:cont, acc + t.amount}
    end)

    # good
    Enumerable.reduce transactions, {:cont, 0}, fn t, acc ->
      if t.date.year > 2001, do: {:halt, acc}, else: {:cont, acc + t.amount}
    end
    ```

- Start pipelines with bare values or variables. Pipelines with a single pipe can be put on a single line. Pipelines with more than one pipe should span multiple lines. All calls, even unary calls, in a pipeline should include parentheses. Pipelines spanning multiple lines should be followed by an empty line, `else`, or `end`.

    ```elixir
    # good
    String.capitalize(name)

    # also good
    name |> String.capitalize()
    ```

    ```elixir
    # bad
    integer |> Integer.to_string(36) |> String.capitalize()

    # also bad
    Integer.to_string(integer, 36)
    |> String.capitalize()

    # also bad
    integer
    |> Integer.to_string(36)
    |> String.capitalize

    # good
    integer
    |> Integer.to_string(36)
    |> String.capitalize()
    ```

- Follow multiline calls without a closing parenthesis, square bracket, or curly brace with an empty line, `else`, or `end`.

- Prefer string interpolation to concatenation.

- Use list comprehensions over Enum functions (or recursive iterators), when possible.
