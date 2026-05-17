// Verifica se a música já não está tocando para evitar que ela reinicie ou duplique
if (!audio_is_playing(snd_musica_tema)) 
{
    // Toca a música em loop com prioridade 10
    audio_play_sound(snd_musica_tema, 10, true);
}

// ========== POWER-UP K (Instâneo) ==========
global.powerup_k_disponivel = true;
global.powerup_k_cooldown = 0;
global.powerup_k_cooldown_total = 20;  // 20 segundos de espera


// ========== POWER-UP S (Só inimigos lentos) ==========
global.powerup_s_ativo = false;
global.powerup_s_timer = 0;
global.powerup_s_tempo_total = 10;  // 10 segundos de duração
global.powerup_s_disponivel = true;
global.powerup_s_cooldown = 0;
global.powerup_s_cooldown_total = 15;  // 15 segundos de espera até poder usar de novo
global.speed_multiplier = 1;

// ========== POWER-UP COPY/PASTE (Ctrl+C / Ctrl+V) ==========
global.dinheiro_copiado = 0;                    // Dinheiro armazenado no Ctrl+C
global.powerup_copy_disponivel = true;          // Ctrl+C disponível
global.powerup_copy_cooldown = 0;
global.powerup_copy_cooldown_total = 30;        // 30 segundos de espera para copiar

global.powerup_paste_disponivel = true;         // Ctrl+V disponível
global.powerup_paste_cooldown = 0;
global.powerup_paste_cooldown_total = 30;       // 30 segundos de espera para colar