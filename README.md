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
