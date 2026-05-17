if (global.pausado) exit;

global.hitpoints -= 1;

if (global.hitpoints <= 0) {
    room_goto(rm_final_scream);
}

instance_destroy();