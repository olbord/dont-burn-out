draw_set_color(block_color);
draw_set_alpha(block_alpha);

for (var l = 0; l < 4; l++) {
    if (!lane_ok[l]) continue;

    var _arr = global.lane_times[l];
    for (var n = global.lane_head[l]; n < array_length(_arr); n++) {
        var _dt = _arr[n] - global.song_pos;
        if (_dt > approach_ms) break;

        var _p = 1 - (_dt / approach_ms);   // 0 = at the end of the line, 1 = on the button

        // symmetric curve: speeds up leaving the line, slows down reaching the button
        var _e;
        if (_p <= 1) {
            var _f = (_p < 0.5) ? 2 * _p * _p : 1 - 2 * sqr(1 - _p);
            _e = lerp(_p, _f, ease_amount);
        } else {
            _e = 1 + (_p - 1) * (1 - ease_amount);   // keeps moving smoothly past the button
        }

        var _y = lerp(lane_end_y[l], lane_cy[l], _e);
        draw_rectangle(lane_cx[l] - lane_half[l], _y - block_h / 2,
                       lane_cx[l] + lane_half[l], _y + block_h / 2, false);
    }
}

draw_set_alpha(1);
draw_set_color(c_white);