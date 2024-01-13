/// @description 
if (live_call()) return live_result;

hsp = 0;
vsp = 0;

moveSpeed = 1.50;
runSpeed = 3.50;
jumpSpeed = 6;
gravSpeed = 0.40;

onGround = false;
running = false;
duck = false;

accel = 0.150;
fric = 0.250;

facing = 1;

function SpritesStruct(_prefix) constructor {
    idle = asset_get_index(_prefix + "Idle");
    walk = asset_get_index(_prefix + "Walk");  
    run = asset_get_index(_prefix + "Run");    
    jump = asset_get_index(_prefix + "Jump");  
    fall = asset_get_index(_prefix + "Fall");  
    skid = asset_get_index(_prefix + "Skid");  
    duck = asset_get_index(_prefix + "Duck");  
    mask = asset_get_index(_prefix + "Mask");  
}

sprites = new SpritesStruct("sMario");

enum FORMS {
	MINI,
	SUPER,
	FLOWER,
	CAPE
}

playerForm = FORMS.MINI;

changeForm = function(_newForm) {
	playerForm = _newForm;
	switch (_newForm) {
		case FORMS.MINI:
			sprites = new SpritesStruct("sMario");
			break;
		case FORMS.SUPER:
			sprites = new SpritesStruct("sSuperMario");
			break;
	}
}

mask_index = sprites.mask;

// DEBUG:
kcp = function(_key) {
	return keyboard_check_pressed(_key);	
}