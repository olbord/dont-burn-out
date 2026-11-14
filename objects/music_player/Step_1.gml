if (global.state != "playing") exit;

var _wall = get_timer() / 1000;

// only trust the audio position while the sound is still playing
if (audio_is_playing(inst)) {
    var _raw = audio_sound_get_track_position(inst) * 1000;
    if (_raw != last_raw) {
        last_raw  = _raw;
        last_wall = _wall;
    }
}

// between audio updates, and after the song has ended, advance with the system timer
pos_ms = last_raw + (_wall - last_wall);

global.song_pos = pos_ms - latency_ms;