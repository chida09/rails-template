# README

https://zenn.dev/wakkunn/articles/33c84147608078

## DB

```
dc run --rm web rails db:create
dc exec db mysql -h db -u root -ppassword
```

## model

```
dc run --rm web rails g model Book inout:integer category:string year:integer
```

