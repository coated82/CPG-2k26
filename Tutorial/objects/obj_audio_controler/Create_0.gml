// Verifica se a música já não está tocando para evitar que ela reinicie ou duplique
if (!audio_is_playing(snd_musica_tema)) 
{
    // Toca a música em loop com prioridade 10
    audio_play_sound(snd_musica_tema, 10, true);
}