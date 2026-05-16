// Evento de Colisão com obj_Enemy

if (instance_exists(other)) {
    // Só processa se o inimigo ainda for imaginário
    if (other.is_imaginary) {
        
        // --- A TRANSFORMAÇÃO MATEMÁTICA ---
        other.is_imaginary = false; // Remove o "i"
        
        // Se era 3i, vira -3. Se era -3i, vira 3 (ou você pode forçar sempre negativo)
        // Vamos seguir a regra i^2 = -1:
        other.hit_points *= -1; 
        
        // Atualiza a ALU visual (remove o "i" e coloca o sinal de "-")
        other.change_num();
    }
}

instance_destroy(); // Destrói a bala