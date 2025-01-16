## Livebook-and-db-basic-adventure-also flame integration
Someone gave me a quick challenge. Challenges are gifts!

#### The challenge:

1. Make a program that monitors changes to a database and reports what is happening in real time.
2. add Flame integration in some capacity.

## Goals
1. spin up a liveview phx server ✅
2. spin up a livebook in a phoenix project context ✅
3. add data to database ✅
4. all tabs should be able to recieve data without refresh ✅
5. broadcast events from psql ✅
6. listen to events in psql ✅
7. use postgrex + liveview to listen to psql notify events. ✅
8. add a database trigger for table change: insert, update, delete, select
9. add a database trigger for any table change
10. flame integration

## Links:
#### Simple, basic pubsub mix application:
https://github.com/MichaelDimmitt/Elixir-Radio-via-Pid

#### Using sockets to update all sessions viewing a page in elixir.
https://www.phoenixframework.org/blog/build-a-real-time-twitter-clone-in-15-minutes-with-live-view-and-phoenix-1-5  
https://www.youtube.com/watch?v=MZvmYaFkNJI  
#### Commit:
https://github.com/MichaelDimmitt/livebook-and-db-basic-adventure/commit/e24face8515dec95bafddd7aa8dc28cc3f606e02  

#### Use Notify with psql:
https://elixirforum.com/t/what-happens-if-an-external-source-changes-the-database/1587  
https://www.postgresql.org/docs/9.5/sql-notify.html  

#### Socket scaffold example from 8 years ago
https://github.com/bredikhin/phoenix-postgresql-notify-listen-example  

#### Simple Notification Example  
https://github.com/bredikhin/phoenix-postgresql-notify-listen-example/blob/master/lib/pgsub/application.ex

#### Other links
https://github.com/livebook-dev/livebook/blob/main/docs/use_cases.md  
https://github.com/phoenixframework/flame  
https://fly.io/blog/livebook-for-app-documentation  
https://github.com/DockYard-Academy/curriculum/wiki/Troubleshooting  
https://news.ycombinator.com/item?id=36323058  
https://gist.github.com/ColinChartier/59633c1006407478168b52e2318da8e8    

#### Ideas for listening to a database: boltun, Postgrex, and walex, those libraries are listed here:
https://github.com/h4cc/awesome-elixir?tab=readme-ov-file#orm-and-datamapping

## Commands
```bash
asdf plugin list  

mix phx.new <project name>
mix deps.get
mix ecto.create
mix ecto.setup
iex -S mix phx.server
mix ecto.drop

~/.mix/escripts/livebook server
PATH=$PATH:~/.mix/escripts
```

## Emplacements and tools for utilizing their full capabilities
Due to liveview, the following exists out of the box.
Another title for this section could be playing with <Emplacement/Tool> ... playing with Sockets in elixir

| Technology  | Tools  |          |          |             |             | 
| ---         | ---    | ---      | ---      |  ---        |  ---        |
| Sockets     | PubSub | Presence |          |             |             |
| Database    | Ecto   | Postgres | Postgrex | psql Notify | psql Listen |
