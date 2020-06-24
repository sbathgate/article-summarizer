# Test-Driven Development with FastAPI and Docker

![CI/CD](https://github.com/sbathgate/fastapi-tdd-docker/workflows/Continuous%20Integration%20and%20Delivery/badge.svg?branch=master)

## Quick start
* Clone GitLab Repo: `$ git clone https://github.com/sbathgate/fastapi-tdd-docker.git`
* Switch to project root: `$ cd fastapi-tdd-docker/`
* Build the images: `$ docker-compose build`
* Run the containers: `$ docker-compose up -d`
* Run the tests: `$ docker-compose exec web python pytest`

## File Structure
### Within the download you'll find the following directories and files:
```
├── .gitignore
├── docker-compose.yml
├── makefile
├── README.md
├── project
│   ├── .dockerignore
│   ├── Dockerfile
│   ├── app
│   │   ├── __init__.py
│   │   ├── api
│   │   │   ├── __init__.py
│   │   │   ├── crud.py
│   │   │   ├── ping.py
│   │   │   └── summaries.py
│   │   ├── config.py
│   │   ├── db.py
│   │   ├── main.py
│   │   └── models
│   │       ├── __init__.py
│   │       ├── pydantic.py
│   │       └── tortoise.py
│   ├── db
│   │   ├── Dockerfile
│   │   └── create.sql
│   ├── entrypoint.sh
│   ├── requirements.txt
│   └── tests
│       ├── __init__.py
│       ├── conftest.py
│       ├── test_ping.py
│       └── test_summaries.py
└── README.md
```
## Common Commands
### Docker Compose

#### Build the images:
```$ docker-compose build```

#### Build and spin up the new containers:
```$ docker-compose up -d --build```

#### To stop the containers:
```$ docker-compose stop```

#### To bring down the containers:
```$ docker-compose down```

### Tests
#### Run the tests with warnings:
```$ docker-compose exec web python -m pytest "project/tests"```

#### Run the tests without warnings:
```$ docker-compose exec web python -m pytest "project/tests" -p no:warnings```

#### Run the tests with coverage:
```$ docker-compose exec web python -m pytest "project/tests" -p no:warnings --cov="project"```

#### Run only the last failed tests
```$ docker-compose exec web python -m pytest --lf```

#### Run only the tests with names that match the string expression
```$ docker-compose exec web python -m pytest -k "summary and not test_read_summary"```

#### Stop the test session after the first failure
```$ docker-compose exec web python -m pytest -x```

#### Enter PDB after first failure then end the test session
```$ docker-compose exec web python -m pytest -x --pdb```

#### Stop the test run after two failures
```$ docker-compose exec web python -m pytest --maxfail=2```

#### Show local variables in tracebacks
```$ docker-compose exec web python -m pytest -l```

#### List the 2 slowest tests
```$ docker-compose exec web python -m pytest --durations=2```

### Postgres
#### Want to access the database via psql?
```$ docker-compose exec web-db psql -U postgres```

##### Then, you can connect to the database and run SQL queries. For example:
```# \c web_dev```
```# select * from web;```
```# \dt ```

### Other Commands
#### Want to force a build?
```$ docker-compose build --no-cache```

#### Remove images:
```$ docker rmi $(docker images -q)```