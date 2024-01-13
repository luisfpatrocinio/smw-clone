/// @description 
if (live_call()) return live_result;

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_font(fntDebug);
var _spac = 16;
var _start_y = 32;
var i = 0;
draw_text(32, _start_y + _spac * i, $"hsp: {hsp}");
i++;
draw_text(32, _start_y + _spac * i, $"vsp: {vsp}");
i++;
draw_text(32, _start_y + _spac * i, $"sprite: {sprite_get_name(sprite_index)}");
i++;
draw_text(32, _start_y + _spac * i, $"onGround: {onGround}");