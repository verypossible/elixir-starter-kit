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

- Use `===` unless you actually need `==`. Use `!==` unless you actually need `!=`.

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

- If you can fit each clause in an anonymous function or `case` statement on one line, do so.

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

- Start pipelines with bare values or variables.

    # bad
    Integer.to_string(integer, 36) |> String.capitalize()

    # good
    integer
    |> Integer.to_string(36)
    |> String.capitalize()
    ```

- Prefer string interpolation to concatenation. Prefer IO lists to string interpolation.

- Use list comprehensions over Enum functions (or recursive iterators), when possible.
