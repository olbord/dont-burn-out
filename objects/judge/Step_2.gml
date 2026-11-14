if (global.state != "playing") exit;

for (var l = 0; l < 4; l++) {
    var _arr = global.lane_times[l];

    // any note whose window has fully passed is a miss
    while (global.lane_head[l] < array_length(_arr)
           && _arr[global.lane_head[l]] + hit_window < global.song_pos) {
        global.lane_head[l] += 1;
        global.combo = 0;
        with (health_manager) event_user(0);    // "lose life" signal
    }
}