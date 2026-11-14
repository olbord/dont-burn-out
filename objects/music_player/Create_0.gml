stream     = audio_create_stream(working_directory + global.bgm_file);
inst       = audio_play_sound(stream, 0, false);
latency_ms = 0;                         // calibration: raise if hits feel early
last_raw   = -1;
last_wall  = get_timer() / 1000;
pos_ms     = 0;