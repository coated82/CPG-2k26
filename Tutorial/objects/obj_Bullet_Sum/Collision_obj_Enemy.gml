if (instance_exists(other)) {
    // A bala da somadora também usa a função hurt unificada
    other.hurt(_damage, source_tower_name);
}

instance_destroy();