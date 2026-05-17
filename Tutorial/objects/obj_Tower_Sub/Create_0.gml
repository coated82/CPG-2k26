// 1. Herda as variáveis do Pai (isso vai configurar o sistema de níveis base)
event_inherited(); 

// 2. Defina as variáveis de IDENTIDADE antes de tudo
name = "Subtrator";
cost = 80; // Custo de compra da torre

// 3. Ajuste de Escala Visual
image_xscale = 0.18;
image_yscale = 0.18;

// 4. Dados de Funcionamento (Sincronizados com o Script de Upgrade)
level = 0;              // Começa no nível 0 (pode upar 5 vezes)
bullet_damage = 2;      // Dano inicial
damage = bullet_damage; // Mantém a variável 'damage' do pai sincronizada

range = 200;            // O script usa 'range', não 'radius'
upgrade_cost = 100;     // O script usa 'upgrade_cost', não 'upgrade_price'

fire_rate = 45;         // O script usa 'fire_rate' (60 frames = 1 seg). 
                        // 45 frames é aprox. 0.75s de intervalo.

// 5. Variáveis de Controle
can_shoot = true;
target = noone;

// Descrição para o Painel
description = "SUBTRATOR:\nReduz o valor dos inimigos.\nEvolua para aumentar o dano e alcance.";