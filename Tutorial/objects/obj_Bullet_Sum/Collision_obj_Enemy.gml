if (instance_exists(other)) {
    // Envia o dano negativo (-2) para a função hurt
    other.hurt(_damage);
}
instance_destroy();