// Evento de Colisão
if (instance_exists(other)) {
    // Chama a função hurt do seu inimigo passando o dano e a fonte
    other.hurt(damage, "Subtratora");
    
    // Destrói o tiro após o impacto
    instance_destroy();
}