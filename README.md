Bootcamp Prático - Analista Linux Júnior (HDI)
Este repositório documenta o estudo prático e os scripts que criei em preparação para o processo seletivo de Analista Linux Jr. (HDI/Tech for It).

O objetivo foi simular, em uma VM Linux (Ubuntu), os 3 projetos da "Ficha de Skills".

Módulo 1 e 2: Servidor Web (Apache) e Health Check
  Objetivo: Instalar um servidor web e monitorá-lo.
  
  Ações:

    1. Instalei o Apache (sudo apt install apache2).

    2. Gerenciei o serviço com systemctl status/start/stop.

    3. Chequei os logs em tempo real com tail -f /var/log/apache2/access.log.

    4.  Criei o script health_check.sh (veja o arquivo no repo) para checar disco (df -h), memória (free -m) e o status do serviço.

    5. Dei permissão com chmod 755.

Módulo 3: Backup Automatizado com Shell Script + AWS S3
  Objetivo: Criar um backup automático da pasta do site e enviá-lo para a nuvem (AWS S3).

  Ações:

    1. AWS: Criei um Bucket S3 e um usuário IAM com permissão AmazonS3FullAccess.

    2. VM Linux: Instalei o aws-cli (sudo snap install aws-cli --classic).

    3. VM Linux: Configurei as chaves (que vazaram e foram recriadas) com aws configure.

    4. Script: Criei o backup_s3.sh (veja o arquivo no repo) que usa rsync para o backup local e aws s3 sync para enviar à nuvem.

    5. Automação: Agendei o script no crontab -e para rodar todo dia às 3h da manhã (0 3 * * * ...).

Módulo 4: Kubernetes (Minikube)
  Objetivo: Provar o conhecimento conceitual ("<1 Ano (Estudo)") na prática.

  Ações:

    1. Instalei o kubectl (via snap), o docker.io (via apt) e o minikube (via binário).

    2. Iniciei o cluster local: minikube start --driver=docker.

    3. Criei um Deployment Nginx: kubectl create deployment meu-site-hdi --image=nginx.

    4. Chequei o Pod (kubectl get pods) e vi o status "Running".

    5. Criei um Service para expor o app: kubectl expose deployment meu-site-hdi --type=NodePort --port=80.

    6. Acesse o app na minha máquina local via minikube service meu-site-hdi --url.



Módulo 5: Automação com Ansible (Conceitual)

  Objetivo: Entender o próximo passo da automação (além do Shell Script).
  Conceito: A vaga pede conhecimento em **Ansible AAP**. Meu conhecimento em Ansible é conceitual: entendo que ele usa **Playbooks** (em formato YAML) para garantir o "estado desejado" de múltiplos servidores ao mesmo tempo.
  Minha Ponte: Meu ponto forte é a lógica de automação. Eu já faço isso há anos com Shell Script (Projeto 2) e PowerShell. Para mim, aprender a *sintaxe* (YAML) do Ansible é a parte mais fácil, pois a mentalidade de automação eu já tenho.

Módulo 6: Ferramentas de CI/CD (Conceitual)

  Objetivo: Entender como a infraestrutura dá suporte ao desenvolvimento.
  Conceito: A vaga pede experiência em ferramentas de **CI/CD** (como Jenkins, GitLab CI). Meu conhecimento aqui é conceitual.
  Minha Ponte:** Eu entendo o que é o pipeline:
    
    1.  **CI (Continuous Integration):** A prática de automatizar o "build" (construção) e o "teste" do código toda vez que um desenvolvedor faz um *commit*. O objetivo é achar *bugs* o mais rápido possível.

    2.  **CD (Continuous Deployment):** O próximo passo. Depois que o código passa nos testes do CI, o pipeline automaticamente "deploya" (envia) a nova versão para o ambiente (ex: para o **Kubernetes**).

  Meu Papel: Entendo que meu papel na infraestrutura é dar suporte a essa esteira, garantindo que o **Kubernetes** esteja saudável para receber os *deploys* e que os *scripts* de automação (como Ansible) funcionem corretamente.
