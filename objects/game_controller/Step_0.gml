if (global.state == "playing") {
	if (global.cur_lives <= 0) {
		global.state = "failed";
		audio_stop_sound(music_player.inst);
		room_goto(Loss);
		exit;
	}
	
    // cleared = every note resolved and the song has run a bit past the last note
    var _done = true;
    for (var l = 0; l < 4; l++) {
        if (global.lane_head[l] < array_length(global.lane_times[l])) _done = false;
    }
    if (_done && global.song_pos > global.end_time + 1500) {
        global.state = "cleared";
		room_goto(Win);
		exit;
    }

    global.pulse = max(0, global.pulse - 0.08);
    if (global.last_grade_timer > 0) global.last_grade_timer--;
}