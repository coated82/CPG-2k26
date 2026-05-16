draw_self();

//Dinheiro
draw_set(1, c_white, function() { 
	set_align(fa_left, fa_middle);
	
	draw_text_ext_transformed(
		16,
		8,
		"R$: " + string(global.cash_amount),
		0,
		200,
		2,
		2,
		0
	)
	});
	
	//Wave
draw_set(1, c_white, function() { 
	set_align(fa_left, fa_middle);
	
	draw_text_ext_transformed(
		352,
		8,
		"Wave: " + string(global.wave),
		0,
		200,
		2,
		2,
		0
	)
	});
	
	// health
draw_set(1, c_white, function() { 
	set_align(fa_left, fa_middle);
	
	draw_text_ext_transformed(
		658,
		8,
		"Vida: " + string(global.hitpoints),
		0,
		200,
		2,
		2,
		0
	)
	});
	
	//build
draw_set(1, c_white, function() { 
	set_align(fa_left, fa_middle);
	
	draw_text_ext_transformed(
		room_width - 270,
		8,
		"Construir",
		0,
		200,
		2,
		2,
		0
	)
	});