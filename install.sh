#!/data/data/com.termux/files/usr/bin/bash

# Cores ANSI para o estilo Hacker
VERDE='\033[0;32m'
VERDE_BRILHANTE='\033[1;32m'
CIANO='\033[1;36m'
BRANCO='\033[1;37m'
RESET='\033[0m'

clear
# Banner de Boas-Vindas Estilizado
echo -e "${VERDE_BRILHANTE}=========================================${RESET}"
echo -e "${CIANO}          WELCOME TO SKINTOOL 4.4        ${RESET}"
echo -e "${VERDE_BRILHANTE}=========================================${RESET}"
echo -e "${VERDE} [+] Status:${BRANCO} Inicializando instalador seguro...${RESET}"
sleep 1

# 1. Verificando e Instalando Módulos Essenciais do Termux
echo -e "\n${CIANO}[*] Verificando dependências do sistema...${RESET}"

# Atualiza os repositórios em segundo plano com um indicador visual
echo -e "${VERDE} [+] Atualizando pacotes (Aguarde)...${RESET}"
apt update -y && apt upgrade -y -o Dpkg::Options::="--force-confold"

# Lista de pacotes necessários (adicione mais aqui se seu ELF precisar de outros)
PACOTES=(curl python clang libffi)

for pkg in "${PACOTES[@]}"; do
    if dpkg -s "$pkg" >/dev/null 2>&1; then
        echo -e "${VERDE}  [✔] Módulo $pkg já está instalado.${RESET}"
    else
        echo -e "${BRANCO}  [+] Instalando módulo essencial: $pkg...${RESET}"
        apt install "$pkg" -y
    fi
done

# 2. Download e Execução Segura da Ferramenta
echo -e "\n${CIANO}[*] Baixando a versão mais recente do servidor...${RESET}"

# Remove versão antiga para não dar conflito se o cliente rodar de novo
rm -f erosskin

# Faz o download mostrando barra de progresso hacker
curl -L -o erosskin "https://github.com/ErosGamerMod/UNPACK-REPACK/raw/refs/heads/main/eros"

if [ -f "eros" ]; then
    chmod +x erosskin
    echo -e "${VERDE_BRILHANTE}\n [✔] TUDO PRONTO! INICIANDO FERRAMENTA...${RESET}"
    echo -e "${VERDE_BRILHANTE}=========================================${RESET}"
    sleep 1.5
    clear
    ./erosskin
else
    echo -e "\n\033[1;31m [✘] ERRO: Falha ao baixar o arquivo do servidor. Verifique sua conexão.\033[0m"
fi
