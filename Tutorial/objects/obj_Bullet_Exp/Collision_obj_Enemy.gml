if (instance_exists(other)) {
    if (other.is_imaginary) {
        // 1. APENAS desliga o imaginário (O HP continua o que era no Spawner)
        other.is_imaginary = false; 
        
        // 2. Sincroniza o visual (O "i" some e o "-" aparece se o HP for < 0)
        other.change_num();
        
        // Feedback visual
        effect_create_above(ef_spark, other.x, other.y, 1, c_purple);
    }
}
instance_destroy();