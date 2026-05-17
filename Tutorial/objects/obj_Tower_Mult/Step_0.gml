if (global.pausado) exit;

// Suaviza a escala de volta para 0.15 (efeito mola)
image_xscale = lerp(image_xscale, 0.15, 0.1);
image_yscale = lerp(image_yscale, 0.15, 0.1);