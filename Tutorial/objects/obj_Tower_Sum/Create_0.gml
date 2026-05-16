event_inherited(); // Mantém o comportamento do Pai

// Dados de Identidade
name = "Somadora";
level = 1;
upgrade_price = 100;

// Lógica Matemática:
// No código da bala (valor -= damage), se usarmos -2, vira valor + 2.
bullet_damage = -2; 

// Funcionamento (Pode ajustar para ser diferente do subtrator)
radius = 200;
rate_of_fire = 20; 
can_shoot = true;

// Registrador de Alvo
target = noone;