# Article Summarizer
> Article Summarizer is an asynchronous RESTful API built with Python and FastAPI. It utilizes Newspaper3k to provide real-time text summarization from a given URL. 

![CI/CD][gh-actions-image]

## Development setup

First, install the system dependencies:
* [docker](https://docs.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [git](https://git-scm.com/)
* [make](https://www.gnu.org/software/make/)

Second, download the source code
```sh
git clone https://github.com/sbathgate/fastapi-tdd-docker.git
cd fastapi-tdd-docker/
```

Third, build the project image. 
```sh
make build
```

## Technologies
* Python 3.8
* FastAPI 
* PostgreSQL
* Heroku
* Gunicorn 
* Tortoise-ORM 
* Newspaper3k
* Pytest
* Black 
* Flake8
* iSort

## File Structure
### Within the download you'll find the following directories and files:
```
├── .github
│   └── workflows
│       └── main.yml
├── .gitignore
├── README.md
├── docker-compose.yml
├── makefile
├── project
│   ├── .coverage
│   ├── .coveragerc
│   ├── .dockerignore
│   ├── Dockerfile
│   ├── Dockerfile.prod
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
│   │   ├── models
│   │   │   ├── __init__.py
│   │   │   ├── pydantic.py
│   │   │   └── tortoise.py
│   │   └── summarizer.py
│   ├── db
│   │   ├── Dockerfile
│   │   └── create.sql
│   ├── entrypoint.sh
│   ├── htmlcov
│   ├── requirements-dev.txt
│   ├── requirements.txt
│   ├── setup.cfg
│   └── tests
│       ├── __init__.py
│       ├── conftest.py
│       ├── test_ping.py
│       ├── test_summaries.py
│       └── test_summaries_unit.py
└── release.sh
```

## Release History

* 0.1.0
    * Initial release

## Acknowledgements
This project wouldn't have been possible without the excellent [Test-Driven Development with FastAPI and Docker course](https://testdriven.io/courses/tdd-fastapi/) developed by [Michael Herman](https://mherman.org/) on [testdriven.io](https://testdriven.io). You can also find a free tutorial on their blog [Developing and Testing an Asynchronous API with FastAPI and Pytest](https://testdriven.io/blog/fastapi-crud/).

## Contributing

1. Fork it (<https://github.com/sbathgate/article-summarizer/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[gh-actions-image]: https://github.com/sbathgate/fastapi-tdd-docker/workflows/CI/badge.svg?branch=master
