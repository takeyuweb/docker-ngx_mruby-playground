ngx_mruby 実験用
==

```bash
$ docker-compose up -d
$ docker-compose exec nginx auto-reload-nginx.sh
```

## conf.d

Docker コンテナ内にマウントされるので、ここで設定ファイルを書き換えて遊ぶことができます。

`auto-reload-nginx.sh` がファイルの変更を検知すると nginx を reload するので、コンテナの再起動は不要です。

```bash
$ vim conf.d/nginx.conf
```

## Samples

### backquote

http://127.0.0.1:8080/backquote

### Redis

http://127.0.0.1:8080/redis/set?key=hoge&value=fuga

http://127.0.0.1:8080/redis/get?key=hoge

http://127.0.0.1:8080/redis/set?key=dummy

### Background

http://127.0.0.1:8080/background

### access

http://127.0.0.1:8080/access/allow

http://127.0.0.1:8080/access/deny

### Rewrite

http://127.0.0.1:8080/rewrite/hogehoge/test.txt


