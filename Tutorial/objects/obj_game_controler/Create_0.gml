// Verifica se a música já não está tocando para evitar que ela reinicie ou duplique
if (!audio_is_playing(snd_musica_tema)) 
{
    // Toca a música em loop com prioridade 10
    audio_play_sound(snd_musica_tema, 10, true);
}

// ========== POWER-UP K ==========
global.powerup_k_ativo = false;
global.powerup_k_timer = 0;
global.powerup_k_tempo_total = 20;  // 15 segundos
global.powerup_k_disponivel = true;
global.powerup_k_cooldown = 0;  // Cooldown opcional