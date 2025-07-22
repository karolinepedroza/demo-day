# Demo Day Project

Este projeto é uma API FastAPI com métricas de sistema e endpoint de health check, pronta para desenvolvimento, testes e execução em ambiente local ou containerizado.

## Pré-requisitos

- Python 3.11+
- [uv](https://github.com/astral-sh/uv) instalado (`pip install uv` ou veja a documentação oficial)
- Docker (opcional, para rodar em container)

## Instalação

Clone o repositório e acesse a pasta do projeto:
```sh
git clone git@github.com:lele-sf/devops_bootcamp.git
cd demo_day_project
```

Instale as dependências  (cria `.venv` automaticamente):
```sh
uv sync
```

## Execução

Para rodar a aplicação, utilize o seguinte comando:
```sh
uv run fastapi dev
```

A aplicação estará disponível em `http://localhost:8000`. Você pode acessar a documentação da API em `http://localhost:8000/docs`.

## Rodando com Docker

Para rodar a aplicação em um container Docker:

```sh
docker build -t demo_day_project .
docker run -p 8000:80 demo_day_project
```

Acesse em: [http://localhost:8000](http://localhost:8000)

## Testes e Linter

Para rodar os testes, utilize o seguinte comando:
```sh
uv run pytest
```

Para verificar o código com o linter, utilize:
```sh
uv run ruff check
```

## Endpoints

- `GET /`: Mensagem de boas-vindas.
- `GET /metrics`: Métricas de uptime, memória, CPU, sistema e timestamp.
- `GET /health`: Health check da aplicação.