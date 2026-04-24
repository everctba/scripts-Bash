#!/bin/bash

# Configurações
MAX=3
historico=()
total_acoes=0

registrar_acao() {
    local acao=$1
    # O operador % garante que o índice fique entre 0 e (MAX-1)
    local slot=$(( total_acoes % MAX ))
    
    historico[$slot]=$acao
    ((total_acoes++))
    
    echo "Registrado: '$acao' no slot $slot"
}

# Simulando ações
registrar_acao "Deletar foto.jpg"
registrar_acao "Mover texto.txt"
registrar_acao "Renomear pasta_aula"

echo "--- Status do Array: (${historico[*]}) ---"

# O 4º item vai sobrescrever o 1º (índice 0)
registrar_acao "Deletar video.mp4"

echo "--- Status após 4ª ação: (${historico[*]}) ---"
echo "Note que 'Deletar foto.jpg' sumiu!"

echo "--- Histórico em ordem correta ---"
echo "--- --------------------------- ---"
if (( total_acoes < MAX )); then
    # Ainda não encheu
    for ((i=0; i<total_acoes; i++)); do
        echo "${historico[i]}"
    done
else
    # Buffer cheio → começa do mais antigo
    start=$(( total_acoes % MAX ))
    
    for ((i=0; i<MAX; i++)); do
        idx=$(( (start + i) % MAX ))
        echo "${historico[idx]}"
    done
fi