global.inputCooldown = 0;

//The default bindings can be changed in __input_config_verbs
function getInput(_player = 0) {
	global.inputCooldown = max(global.inputCooldown - 1, 0);
	
	xAxis = input_x("left", "right", "up", "down", _player);
	yAxis = input_y("left", "right", "up", "down", _player);
	
	jumpKey		= input_check_pressed("jump", _player);
	jumpKeyRel	= input_check_released("jump", _player);
	runKey		= input_check("run", _player);
	
	pauseKey	= input_check_pressed("pause", _player);
}

function canInput() {
	return global.inputCooldown <= 0;
}

function setInputCooldown(_val = INPUT_COOLDOWN) {
	global.inputCooldown = _val;
}