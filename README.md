# Phoenix Booster Kit

The Phoenix Booster kit is a starting point for an umbrella app with web
delivery performed by the Phoenix Framework. The booster kit is meant to be a
stand alone json api.

* [Development](#development)
  * [Usage](#usage)
    * [Installing Dependencies](#installing-dependencies)
    * [Environment Files](#environment-files)
    * [Running the API](#running-the-api)
    * [Running the Tests](#running-the-tests)
    * [Running the Tests with Coverage](#running-the-tests-with-coverage)
    * [Running the Tests with HTML Coverage](#running-the-tests-with-html-coverage)
    * [Running Linters](#running-linters)
    * [Running Static Code Analysis](#running-static-code-analysis)
    * [Running a Bash Prompt](#running-a-bash-prompt)
* [Deployment](#deployment)
* [Production](#production)
  * [Exception Tracking](#exception-tracking)
  * [Log Capturing](#log-capturing)
  * [Alternate Production Environments](#alternate-production-environments)
* [Dependencies](#dependencies)


## Development

This booster kit has been set up with docker so the only development
dependencies are Docker and Docker Compose. However, we also understand that not
everyone likes to use Docker. If you wish to manage your dependencies manually,
a brief list of dependencies is included.

### Usage

If you do wish to use Docker and Docker Compose, here are some commands you will
find helpful.

#### Installing Dependencies

Installing dependencies can be performed in a one step command.

```bash
$ docker-compose run web mix do deps.get, deps.compile
```

#### Environment Files

The docker compose definition is configured to reference environment variables
from an `.envrc` file. A sample file is stored at `.envrc.sample` and the
environment file is gitignored.

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

#### Running Linters

For the Phoenix Booster Kit we are using
[credo](https://github.com/rrrene/credo) to check the codebase for consistency.
All of the CLI options for credo are available to you as well.

```bash
$ docker-compose run web mix credo
```

#### Running Static Code Analysis

The Phoenix Booster Kit is using
[dialyxir](https://github.com/jeremyjh/dialyxir) for static code analysis. All
of the CLI options for dialyzer are available to you.

```bash
$ docker-compose run web mix dialyzer
```

#### Running a Bash Prompt

If you don't feel like typing any of those commands, you can start a bash prompt
and run everything like normal.

```bash
$ docker-compose run web bash
```

## Deployment

The Phoenix Booster Kit can be deployed to heroku relatively easily. You should
install the [heroku cli](https://devcenter.heroku.com/articles/heroku-cli), once
you have done so, create a project with:

```bash
$ heroku create #{PROJECT_NAME} --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
$ heroku config:set SECRET_KEY_BASE=$(mix phoenix.gen.secret) HOST_NAME=#{PROJECT_NAME} MIX_ENV=prod
```

The Phoenix build pack is not needed since the project was instantiated with
`--no-brunch`. Deployment can be configured from CircleCI or automatically with
GitHub. We recommend deploying from CircleCI since you will have more fine
grained control of your deployments.

## Production

When running in production, it is crucial the appropriate monitoring tools are
configured to ensure issues can be easily found and quickly remedied. Below are
some tools that are commonly used and included in the Phoenix Booster Kit and
how to configure them specifically for your project.

### Exception Tracking

Our exception tracking tool of choice is [Rollbar](https://rollbar.com). The
[rollbax](https://github.com/elixir-addicts/rollbax) hex package is included and
configured to capture errors **only in the production environment**. To complete
the Rollbar configuration, you will need to create a project in Rollbar, and add
the access token to the production environment variables. On Heroku, you can do
this with the following command:

```bash
$ heroku config:set ROLLBAR_ACCESS_TOKEN=#{access token copied from Rollbar}
```

Once the environment variable is in place and the Rollbar project is set up,
Rollbar notifications can be created for the primary production environment
with:

```bash
$ heroku addons:create deployhooks:http --url="https://api.rollbar.com/api/1/deploy/?access_token=#{access token copied from Rollbar}&environment=prod
```

### Log Capturing

Heroku doesn't keep logs around forever and they aren't exactly easy to search
either. However, they do allow you to set up a log drain so the logs can be
stored in another place for easier searching and better persistence. Spartan has
a loggly account for persisting server logs. In order to set up a log drain you
will need to obtain the `CUSTOMER TOKEN`. This can be obtained from the loggly
portal. Once you have the `CUSTOMER TOKEN` you can create a log drain with the
following command:

```bash
$ heroku drains:add https://logs.loggly.com/inputs/#{CUSTOMER_TOKEN}/tag/prod,#{PROJECT_NAME},elixir --app #{PROJECT_NAME}
```

This will tag all of the logs for the project with `prod`, `elixir`, and the
name of the project. This will allow you to more easily filter out the logs from
other projects.

### Alternate Production Environments

If you are deploying to an alternate production environment (e.g., staging), you
will want to set a deploy tag to differentiate errors that occurred in the the
alternate environment from those that occurred in the primary production
environment. You can set the deploy tag on Heroku using the following command:

```bash
$ heroku config:set DEPLOY_TAG=#{deploy tag, to identify alternate production environment}
```

Rollbar notifications can be created for the alternate production environment
with:

```bash
$ heroku addons:create deployhooks:http --url="https://api.rollbar.com/api/1/deploy/?access_token=#{access token copied from Rollbar}&environment=#{deploy tag}"
```

## Dependencies

- Erlang (latest)
- Elixir (latest)
- Hex
- Rebar
- Phoenix
- Postgresql
