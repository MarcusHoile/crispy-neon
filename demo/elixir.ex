defmodule Test do
  @moduledoc """
  Syntax coloring test
  """

  defstruct name: "John", age: 27

  import Ecto.Multi

  @name "syntax test"

  @doc """
  Dummy function.
  """
  def one_liner(xs, list) when is_list(list), do: length(list)

  def typical_function(attrs \\ %{}, _ignore) do
    Multi.new()
    |> Multi.update(:user, User.changeset(user, attrs))
    |> Multi.update(:credential, Credential.changeset(creds, %{email: "my@email.com"}))
    |> Multi.delete_all(:personal_info, Ecto.assoc(user, :profile))
    |> Repo.transaction()
    |> case do
      {:ok, results} ->
        do_more_things(results)
      _ ->
        {:error, "oops"}
    end
  end

  def selected_function(attrs) do
    # everything is highlighted!
  end

  def silly_function do
    four = 2 + 2
    "some string"
    'binary'
    ~r/^(group)*[class]+.?(?!abc)\w$/
    ~w(some string list)
    ~c(a b c)
    ~N[2017-02-09]
    y = xs |> Enum.map(&String.upcase(&1))
    y = xs |> Enum.map(fn x -> String.upcase(x) end)
    # this code makes no sense
    case y do
      nil ->
        nil

      [] ->
        []

      [z | zs] ->
        %{"some" => :map}
    end

    :atom
    [key: :word, list: :abc]
    user = %Test{name: "Michael"}
    IO.puts("Name: #{user.name}")
    !(true || (false && true))
    not (true or (false and true))
  end
end
