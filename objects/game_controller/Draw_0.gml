var _btns = [H, J, K, L];
var _cam  = view_camera[0];
var _vy   = camera_get_view_y(_cam);
var _vh   = camera_get_view_height(_cam);

draw_set_color(line_color);
draw_set_alpha(line_alpha);

for (var l = 0; l < 4; l++) {
    lane_ok[l] = instance_exists(_btns[l]);
    if (!lane_ok[l]) continue;

    var _b = instance_find(_btns[l], 0);
    lane_cx[l]   = (_b.bbox_left + _b.bbox_right) / 2;
    lane_cy[l]   = (_b.bbox_top + _b.bbox_bottom) / 2;
    lane_half[l] = (_b.bbox_right - _b.bbox_left) * 0.4;

    // line end is as far from the bottom of the screen as the button center is from the top
    lane_end_y[l] = _vy + 1100;

    draw_line_width(lane_cx[l], lane_end_y[l], lane_cx[l], lane_cy[l], line_width);
}

draw_set_alpha(1);
draw_set_color(c_white);