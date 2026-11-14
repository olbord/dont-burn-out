if (global.state != "playing") exit;

var _b = floor((global.song_pos) / global.ms_per_beat);

// a new beat has started
if (_b > last_beat) {
    last_beat    = _b;
    global.pulse = 1;
}