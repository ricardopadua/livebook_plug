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