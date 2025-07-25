# DemoDay Project

## Visão Geral
Este projeto é uma aplicação demo construída com **FastAPI** e implantada utilizando **Docker**, **Ansible** e **Terraform**. Os componentes do projeto incluem:
- API com endpoints para "Hello, World!", métricas e verificação de saúde.
- Pipeline de CI/CD configurado via GitHub Actions.
- Provisionamento de infraestrutura com Terraform.
- Deploy da aplicação com Ansible e Docker.

## Estrutura do Projeto
```
demo_day_project/
├── app/                  # Código fonte da aplicação (FastAPI)
│   └── main.py
├── Dockerfile            # Dockerfile para build da imagem da aplicação
├── pyproject.toml        # Configuração do projeto Python e dependências
├── uv.lock               # Lock file das dependências
├── ansible/              # Playbook Ansible para deploy da aplicação
│   └── playbook.yml
├── terraform/            # Arquivos do Terraform para provisionamento da infraestrutura
│   ├── variables.tf
│   └── ... (outros arquivos .tf)
└── README.md             # Este arquivo
```

## Requisitos
- Python 3.12
- Docker
- Ansible
- Terraform
- Conta no Docker Hub (para push da imagem, se necessário)

## Como Rodar o Projeto

### 1. Desenvolvimento Local
1. **Instale as dependências:**
   ```bash
   cd demo_day_project
   pip install --upgrade pip
   pip install -e .
   ```
2. **Inicie a aplicação:**
   ```bash
   uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
   ```
3. **Acesse a aplicação:**
   - [http://localhost:8000](http://localhost:8000)
   - Verificação de saúde: [http://localhost:8000/health](http://localhost:8000/health)

### 2. Executando com Docker
1. **Construa a imagem Docker:**
   ```bash
   docker build -t demo-day-app .
   ```
2. **Rode o container:**
   ```bash
   docker run -d --name demo-day-app -p 8000:8000 demo-day-app
   ```
3. **Verifique se o container está rodando:**
   ```bash
   docker ps
   ```
4. **Acesse a aplicação via navegador ou curl:**
   - [http://localhost:8000/health](http://localhost:8000/health)

### 3. Deploy com Ansible
1. **Instale o Ansible (se ainda não tiver):**
   ```bash
   pip install ansible
   ```
2. **Configure o arquivo de inventário** (por exemplo, `inventory.ini`) com os detalhes da sua instância EC2.
3. **Execute o playbook:**
   ```bash
   ansible-playbook -i inventory.ini ansible/playbook.yml
   ```
   O playbook instalará o Docker, copiará os arquivos do projeto, fará o build da imagem e rodará o container na instância EC2.

### 4. Provisionamento com Terraform
1. **Navegue até a pasta do Terraform:**
   ```bash
   cd demo_day_project/terraform
   ```
2. **Inicialize o Terraform:**
   ```bash
   terraform init
   ```
3. **Verifique o plano de execução:**
   ```bash
   terraform plan
   ```
4. **Aplique as configurações:**
   ```bash
   terraform apply
   ```

### 5. Pipeline CI/CD (GitHub Actions)
O arquivo de pipeline localizado em `.github/workflows/ci.yaml` executa as seguintes etapas:
- **build-and-test:** Instala dependências via pip, executa lint com ruff e testes com pytest.
- **build-docker:** Constrói a imagem Docker, faz login e envia a imagem para o Docker Hub.
- **ansible-check:** Valida a sintaxe do playbook Ansible.
- **terraform-plan:** Executa `terraform init` e `terraform plan` para validar a infraestrutura.
- **smoke-test:** Inicia um container temporário e verifica o endpoint `/health`.

**Observação:** Para que o CI/CD funcione corretamente, você deve configurar os seguintes secrets no repositório do GitHub:
- `DOCKER_USER`
- `DOCKER_PASS`

## Solução de Problemas
- **Verificar logs do container:**
  ```bash
  docker logs demo-day-app
  ```
- **Problemas de deploy com Ansible:**  
  Certifique-se de que o arquivo de inventário esteja configurado corretamente e que a instância EC2 esteja acessível.
- **Infraestrutura com Terraform:**  
  Confira se as variáveis (como `meu_ip_publico`) estão corretas e atualizadas.

---

Com estas instruções, você conseguirá rodar e fazer o deploy do projeto utilizando as diversas ferramentas disponíveis (pip, Docker, Ansible
