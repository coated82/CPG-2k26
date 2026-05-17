// ============================================================================
//                          TELA DE GAME OVER
// ============================================================================

tempo_anim = 0;

// ============================================================================
//                          RESETAR POWER-UPS
// ============================================================================

// Reset Power-Up K
global.powerup_k_disponivel = true;
global.powerup_k_cooldown = 0;

// Reset Power-Up S
global.powerup_s_ativo = false;
global.powerup_s_timer = 0;
global.powerup_s_disponivel = true;
global.powerup_s_cooldown = 0;
global.speed_multiplier = 1;

// Reset Power-Up Copy/Paste
global.dinheiro_copiado = 0;
global.powerup_copy_disponivel = true;
global.powerup_copy_cooldown = 0;
global.powerup_paste_disponivel = true;
global.powerup_paste_cooldown = 0;

// Reset outras variáveis
global.tipo_pausa = 0;
global.pausado = false;
global.pre_fase_ativa = false;
global.wave = 0;

show_debug_message("🔄 Todos os power-ups e cooldowns foram resetados!");
