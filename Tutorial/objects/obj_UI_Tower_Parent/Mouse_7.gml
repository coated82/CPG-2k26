// 1. CHECAR PREÇO (Apenas para permitir a seleção)
if(global.cash_amount < cost) {
    return;
}

// global.cash_amount -= cost; <--- REMOVA ESTA LINHA!

// 2. MOSTRAR OS SLOTS DISPONÍVEIS
with(obj_Placeable){
    can_be_seen = true;
}

// 3. FECHAR A LOJA E ANEXAR AO MOUSE
parent.hide();
obj_Mouse.selected_sprite = image;

// 4. DIZER QUAL OBJETO SERÁ CRIADO (Importante para o Placeable saber)
global.instance_tower_to_build = tower_to_spawn;