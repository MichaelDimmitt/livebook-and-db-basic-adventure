## Livebook-and-db-basic-adventure-also flame integration
Someone gave me a quick challenge. Challenges are gifts!

## goals
1. livebook up
2. db up
3. interaction happening
4. flame integration

## Links:
https://github.com/livebook-dev/livebook/blob/main/docs/use_cases.md
https://github.com/phoenixframework/flame
https://fly.io/blog/livebook-for-app-documentation
https://github.com/DockYard-Academy/curriculum/wiki/Troubleshooting

Listening to sql
https://news.ycombinator.com/item?id=36323058
https://gist.github.com/ColinChartier/59633c1006407478168b52e2318da8e8

https://github.com/elixir-ecto/postgrex/issues/28

Use Notify with psql:
https://elixirforum.com/t/what-happens-if-an-external-source-changes-the-database/1587
https://www.postgresql.org/docs/9.5/sql-notify.html

Socket scaffold example from 8 years ago.
https://github.com/bredikhin/phoenix-postgresql-notify-listen-example

Simpler, setup basic pubsub that I used in elixir radio
https://github.com/MichaelDimmitt/Elixir-Radio-via-Pid

## Commands
asdf plugin list  

mix phx.new <project name>
mix deps.get
mix ecto.create
mix ecto.setup

~/.mix/escripts/livebook server
PATH=$PATH:~/.mix/escripts


## Plan
1. you can also directly run Livebook within the context of your existing application with the help of Mix.install/2
2. add to a phoenix app...

1. you can also directly run Livebook within the context of your existing application with the help of Mix.install/2
2. add to a mix new project
 
