ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PublicDocs.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PublicDocs.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PublicDocs.Repo)

