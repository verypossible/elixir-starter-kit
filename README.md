# Phoenix Booster Kit

The Phoenix Booster kit is a starting point for an umbrella app with web
delivery performed by the Phoenix Framework. The booster kit is meant to be a
stand alone json api.

## Development

This booster kit has been setup with docker so the only development dependencies
are Docker and Docker Compose. However, we also understand that everyone does
not like to use Docker. If you wish to manage your dependencies manually, a
brief list of dependencies is included.

### Usage

If you do wish to use Docker and Docker Compose, here are some commands you will
find helpful.

#### Running the API

The API can be started with the standard Docker Compose `up` command. This will
ensure that Postgresql and the Phoenix server have started. You can still access
the api at `http://localhost:4000/api`.

```bash
$ docker-compose up
```

#### Running the Tests

It is highly recommended the `MIX_ENV` is set to `test` when executing the test
suite. You can do so with the `-e` option before specifying the Docker Compose
service you wish to run.

```bash
$ docker-compose run -e MIX_ENV=test web mix test
```

#### Running the Tests with Coverage

The `MIX_ENV` must be set to `test` in order to generate a coverage report.
Also, since this is an umbrella app, the `--umbrella` flag also needs to be
specified.

```bash
$ docker-compose run -e MIX_ENV=test web mix coveralls --umbrella
```

#### Running the Tests with HTML Coverage

In addition to generating a coverage report, a detailed HTML report is generated
for more in depth analysis and stored at `cover/excoveralls.html`.

```bash
$ docker-compose run -e MIX_ENV=test web mix coveralls.html --umbrella
```

#### Running a Bash Prompt

If you don't feel like typing any of those commands, you can start a bash prompt
and run everything like normal.

```bash
$ docker-compose run web bash
```

## Dependencies

- Erlang (latest)
- Elixir (latest)
- Hex
- Rebar
- Phoenix
- Postgresql
