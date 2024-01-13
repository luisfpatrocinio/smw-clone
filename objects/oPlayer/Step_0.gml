/// @description 
if (live_call()) return live_result;

getInput();

// Detect Ground
var lay_id = layer_get_id("Tiles");
var _tileMap = layer_tilemap_get_id(lay_id);
var data = tilemap_get_at_pixel(_tileMap, x, bbox_bottom + 1);
onGround = (data != 0);

// Run
running = runKey;

// Walk
if (xAxis != 0 && (!duck || !onGround)) {
	var _spd = running ? runSpeed : moveSpeed;
	hsp = approach(hsp, _spd * sign(xAxis), accel);
	facing = sign(hsp);
} else {
	var _fric = duck ? fric/2 : fric;
	hsp = approach(hsp, 0, _fric);	
}

// Gravity
if (!onGround) {
	vsp += gravSpeed;	
} else {
	vsp = 0;	
}

// Duck
if (yAxis > 0 && onGround) {
	duck = true;
} else if (yAxis == 0) {
	duck = false;
}

// Jump
if (jumpKey && onGround) {
	vsp -= jumpSpeed;
	show_debug_message("Pulou.", 0, 0);
}

if (jumpKeyRel && vsp < 0) {
	vsp *= 0.60;
	show_debug_message(current_second, 0, 0);
}


// Collisions
move_and_collide(hsp, vsp, _tileMap)

// Manage Sprites
if (!duck) {
	if (!onGround) {
		if (vsp < 0) sprite_index = sprites.jump;
		else if (vsp > 0) sprite_index = sprites.fall;
	
		facing = sign(xAxis) != 0 ? sign(xAxis) : facing;
	} else if (hsp != 0) {
		if (abs(hsp) == runSpeed) {
			sprite_index = sprites.run;	
		} else {
			sprite_index = sprites.walk;	
		}
	
		if (xAxis != 0 && facing != xAxis) {
			sprite_index = sprites.skid;
		}
	} else {
		sprite_index = sprites.idle;	
	}
} else if (duck) sprite_index = sprites.duck;

// DEBUG
if (kcp(vk_f1)) room_restart();
if (kcp(vk_f2)) jumpSpeed = get_integer("jumpSpeed: ", jumpSpeed);
if (kcp(vk_f3)) gravSpeed = get_integer("gravSpeed: ", gravSpeed);
if (kcp(vk_f4)) moveSpeed = get_integer("moveSpeed: ", moveSpeed);
if (kcp(ord("1"))) changeForm(FORMS.MINI);
if (kcp(ord("2"))) changeForm(FORMS.SUPER);