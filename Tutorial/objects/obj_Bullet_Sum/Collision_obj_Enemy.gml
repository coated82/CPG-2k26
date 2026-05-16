if (instance_exists(other)) {
    // Envia o dano negativo para a função hurt do inimigo
    other.hurt(_damage);
}
instance_destroy();