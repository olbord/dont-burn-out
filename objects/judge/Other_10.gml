var _i   = press_lane - 1;
var _arr = global.lane_times[_i];
var _h   = global.lane_head[_i];

// no notes left in this lane
if (_h >= array_length(_arr)) exit;

var _delta = global.song_pos - _arr[_h];    // negative = early, positive = late

// outside the window: ignore the press, no penalty
if (abs(_delta) > hit_window) exit;

// it's a hit: resolve the note
global.lane_head[_i] += 1;
global.combo += 1;
global.max_combo = max(global.max_combo, global.combo);

global.user_score += 1;