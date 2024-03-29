
<h3 align="center">Livebook Plug</h3>

<br>

<div align="center">
  <img alt="logo" src="https://d33wubrfki0l68.cloudfront.net/b431fdd2eb368c890c2627d0f19a44c1bd2d5967/7f1fe/_astro/logo.d45aaa96_z5fotv.svg" style="width: 15%; margin: 10px;" />
</div>
<br>

The elixir ecosystem for documentation is pretty good (ex_doc), but often you want to see the pipeline or data workflows of your application happening while you execute or create documentation for a real use case for your app, with this in mind, I use in this project the livebook for automate code and data workflows with interactive notebooks but with little bit difference in your approach default, here i connect the node of livebook container in other node of elixir application with this, I can execute and build my livebooks with struct, schemas, database of an external application.


## Getting started

Inside an script:

```bash
  export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}')
```

```docker
  docker compose run broker mix deps.get
  docker compose run broker mix ecto.create
  docker compose run broker mix ecto.migrate
  docker exec -it broker iex --name broker@broker --cookie leruaite_secret -S mix
```

or

```
docker compose run broker mix deps.get docker compose run broker mix ecto.create && docker compose run broker mix ecto.migrate && docker compose up --build -d && docker exec -it broker iex --name broker@broker --cookie leruaite_secret -S mix
```

This idea can be more explained in this [livebook](https://github.com/ricardopadua/livebook_plug/blob/main/livebook/data/leruaite.livemd).

![Peek 2023-10-25 15-42](https://github.com/ricardopadua/livebook_plug/assets/10750353/9fc00e45-1c02-4905-95cc-5e1c219e7ed1)

Still don't know livebook ? read about [here](https://livebook.dev/).
<br>
Still don't know exdoc ? read about [here](https://hexdocs.pm/ex_doc/0.18.4/readme.html).
