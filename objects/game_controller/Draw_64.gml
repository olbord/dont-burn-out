var _gw = display_get_gui_width();

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_text(20, 20, "Lives: " + string(global.cur_lives) + " / " + string(health_manager.max_lives));
draw_text(20, 45, "Score: " + string(global.user_score));
draw_text(20, 70, "Combo: " + string(global.combo));

draw_set_halign(fa_left);