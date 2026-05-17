// Verifica se a música já não está tocando para evitar que ela reinicie ou duplique
if (!audio_is_playing(snd_musica_tema)) 
{
    // Toca a música em loop com prioridade 10
    audio_play_sound(snd_musica_tema, 10, true);
}

// ========== TIPO DE PAUSA ==========
// 0 = pause normal (Ctrl+P)
// 1 = pré-fase (clique para começar)
// 2 = contagem regressiva
global.tipo_pausa = 0;
global.contagem_valor = 3;  // Começa do 3
global.contagem_timer = 0;

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

// ============================================================================
//                          RECORDES DAS FASES
// ============================================================================

// Recorde de cada fase (variáveis separadas e simples)
global.recorde_paralelo = 0;
global.recorde_quadratico = 0;
global.recorde_euler = 0;

// Qual fase estamos jogando agora
global.fase_atual = "paralelo";

// Wave atual da partida
global.wave = 0;

// ============================================================================
//                          SALVAR RECORDE
// ============================================================================

function salvar_recorde() {
    var _recorde_atual = 0;
    var _nome = "";
    
    // Pega o recorde atual baseado na fase
    switch (global.fase_atual) {
        case "paralelo":
            _recorde_atual = global.recorde_paralelo;
            _nome = "paralelo";
            break;
        case "quadratico":
            _recorde_atual = global.recorde_quadratico;
            _nome = "quadratico";
            break;
        case "euler":
            _recorde_atual = global.recorde_euler;
            _nome = "euler";
            break;
    }
    
    // Se a wave atual for maior, salva
    if (global.wave > _recorde_atual) {
        // Atualiza a variável global
        switch (global.fase_atual) {
            case "paralelo":
                global.recorde_paralelo = global.wave;
                break;
            case "quadratico":
                global.recorde_quadratico = global.wave;
                break;
            case "euler":
                global.recorde_euler = global.wave;
                break;
        }
        
        // Salva no arquivo
        ini_open("recordes.ini");
        ini_write_real("Recordes", _nome, global.wave);
        ini_close();
        
        show_debug_message("🏆 NOVO RECORDE! " + _nome + ": Wave " + string(global.wave));
    }
}

