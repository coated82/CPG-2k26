// Verifica se a música já não está tocando
if (!audio_is_playing(snd_Balloons_Forever)) {
    audio_play_sound(snd_Balloons_Forever, 10, true);
}

// ========== TIPO DE PAUSA ==========
global.tipo_pausa = 0;
global.contagem_valor = 3;
global.contagem_timer = 0;

// ========== POWER-UP K ==========
global.powerup_k_disponivel = true;
global.powerup_k_cooldown = 0;
global.powerup_k_cooldown_total = 120;

// ========== POWER-UP S ==========
global.powerup_s_ativo = false;
global.powerup_s_timer = 0;
global.powerup_s_tempo_total = 5;
global.powerup_s_disponivel = true;
global.powerup_s_cooldown = 0;
global.powerup_s_cooldown_total = 30;
global.speed_multiplier = 1;

// ========== POWER-UP COPY/PASTE ==========
global.dinheiro_copiado = 0;
global.powerup_copy_disponivel = true;
global.powerup_copy_cooldown = 0;
global.powerup_copy_cooldown_total = 150;
global.powerup_paste_disponivel = true;
global.powerup_paste_cooldown = 0;
global.powerup_paste_cooldown_total = 300;

// ========== RECORDES DAS FASES ==========
global.recorde_paralelo = 0;
global.recorde_quadratico = 0;
global.recorde_euler = 0;
global.fase_atual = "Paralelo";
global.wave = 0;

// ========== FUNÇÃO PARA SALVAR RECORDE ==========
function salvar_recorde() {
    var _recorde_atual = 0;
    var _nome = "";
    
    switch (global.fase_atual) {
        case "Paralelo":
            _recorde_atual = global.recorde_paralelo;
            _nome = "Paralelo";
            break;
        case "Quadratico":
            _recorde_atual = global.recorde_quadratico;
            _nome = "Quadratico";
            break;
        case "Euler":
            _recorde_atual = global.recorde_euler;
            _nome = "Euler";
            break;
    }
    
    if (global.wave > _recorde_atual) {
        switch (global.fase_atual) {
            case "Paralelo":
                global.recorde_paralelo = global.wave;
                break;
            case "Quadratico":
                global.recorde_quadratico = global.wave;
                break;
            case "Euler":
                global.recorde_euler = global.wave;
                break;
        }
        
        ini_open("recordes.ini");
        ini_write_real("Recordes", _nome, global.wave);
        ini_close();
        
        show_debug_message("🏆 NOVO RECORDE! " + _nome + ": Wave " + string(global.wave));
    }
}

// ========== FUNÇÃO PARA CARREGAR RECORDES ==========
function carregar_recordes() {
    ini_open("recordes.ini");
    
    global.recorde_paralelo = ini_read_real("Recordes", "Paralelo", 0);
    global.recorde_quadratico = ini_read_real("Recordes", "Quadratico", 0);
    global.recorde_euler = ini_read_real("Recordes", "Euler", 0);
    
    ini_close();
    
    show_debug_message("📊 RECORDES CARREGADOS:");
    show_debug_message("  Paralelo: " + string(global.recorde_paralelo));
    show_debug_message("  Quadratico: " + string(global.recorde_quadratico));
    show_debug_message("  Euler: " + string(global.recorde_euler));
}

// ========== CARREGAR RECORDES AO INICIAR ==========
carregar_recordes();