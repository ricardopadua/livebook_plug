
<h3 align="center">Livebook Plug</h3>

<div align="center">
  <img alt="logo" src="https://d33wubrfki0l68.cloudfront.net/b431fdd2eb368c890c2627d0f19a44c1bd2d5967/7f1fe/_astro/logo.d45aaa96_z5fotv.svg" style="width: 15%; margin: 10px;" />
</div>



The elixir ecosystem for documentation is pretty good (ex_doc), but often you want to see the pipeline or data workflows of your application happening while you execute or create documentation for a real use case for your app, with this in mind, I use in this project the livebook for automate code and data workflows with interactive notebooks but with little bit difference in your approach default, here i connect the node of livebook container in other node of elixir application with this, I can execute and build my livebooks with struct, schemas, database of an external application.


```
export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}')
```

```
docker-compose run broker mix ecto.create
```

```
docker-compose run broker mix ecto.migrate
```


```
docker-compose up --build -d
```
```
docker exec -it broker iex --name broker@broker --cookie leruaite_secret -S mix
```

or

```
docker-compose run broker mix ecto.create && docker-compose run broker mix ecto.migrate && docker-compose up --build -d && docker exec -it broker iex --name broker@broker --cookie leruaite_secret -S mix
```
