if (instance_exists(other)) {
    // Passamos o dano E o nome da torre que disparou para o Firewall do inimigo
    other.hurt(_damage, source_tower_name);
}

// Destrói a bala após o impacto
instance_destroy();