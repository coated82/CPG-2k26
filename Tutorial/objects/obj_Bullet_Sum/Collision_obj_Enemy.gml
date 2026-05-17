if (instance_exists(other)) {
    // Passamos o dano (que a torre definiu) e o nome da fonte
    other.hurt(damage, "Somadora"); 
    
    // Destrói o tiro
    instance_destroy();
}