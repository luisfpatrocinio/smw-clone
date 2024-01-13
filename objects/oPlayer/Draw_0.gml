/// @description Draw Mario
try {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * facing, image_yscale, 0, image_blend, image_alpha);
} catch (_e) {
	draw_text_ext_transformed(x, y, _e.message, 12, 120, 0.50, 0.50, 0);
}