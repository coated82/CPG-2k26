// Garanta que o código seja EXATAMENTE este:
if (instance_exists(other)) {
    other.hurt(_damage); // O _damage deve ser 1, vindo da torre
}

instance_destroy(); // ESSENCIAL: Destrói a bala para não dar dano no próximo frame