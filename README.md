# EctoPoc

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ecto_poc` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecto_poc, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ecto_poc](https://hexdocs.pm/ecto_poc).

## Setting database

```
mix ecto.drop
mix ecto.create
mix ecto.migrate
```

## Use

```elixir
> person = %EctoPoc.Person{age: 28}
%EctoPoc.Person{
  __meta__: #Ecto.Schema.Metadata<:built, "people">,
  age: 28,
  first_name: nil,
  id: nil,
  last_name: nil
}

> EctoPoc.Repo.insert(person)
13:02:39.724 [debug] QUERY OK db=46.1ms decode=1.5ms queue=1.4ms idle=9458.0ms
INSERT INTO "people" ("age") VALUES ($1) RETURNING "id" [28]
{:ok,
 %EctoPoc.Person{
   __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
   age: 28,
   first_name: nil,
   id: 1,
   last_name: nil
 }}

> EctoPoc.Person |> Ecto.Query.first |> EctoPoc.Repo.one
13:05:37.944 [debug] QUERY OK source="people" db=1.2ms queue=4.2ms idle=9725.3ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 ORDER BY p0."id" LIMIT 1 []
%EctoPoc.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 28,
  first_name: nil,
  id: 1,
  last_name: nil
}

> EctoPoc.Person |> EctoPoc.Repo.all
13:06:40.269 [debug] QUERY OK source="people" db=1.7ms queue=2.5ms idle=9050.6ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 []
[
  %EctoPoc.Person{
    __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
    age: 28,
    first_name: nil,
    id: 1,
    last_name: nil
  }
]

> changeset = EctoPoc.Person.changeset(person, %{first_name: "たろう", last_name: "佐藤"})
#Ecto.Changeset<
  action: nil,
  changes: %{first_name: "たろう", last_name: "佐藤"},
  errors: [],
  data: #EctoPoc.Person<>,
  valid?: true

> EctoPoc.Repo.insert(changeset)
13:14:06.030 [debug] QUERY OK db=40.7ms decode=1.4ms queue=1.3ms idle=9151.0ms
INSERT INTO "people" ("first_name","last_name") VALUES ($1,$2) RETURNING "id" ["たろう", "佐藤"]
{:ok,
 %EctoPoc.Person{
   __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
   age: nil,
   first_name: "たろう",
   id: 2,
   last_name: "佐藤"
 }}
```
