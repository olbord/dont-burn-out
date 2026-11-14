var _buf = buffer_load(working_directory + chart_filename);
var _raw = json_parse(buffer_read(_buf, buffer_string));
buffer_delete(_buf);

global.bgm_file    = _raw.bgm;
global.bpm         = real(_raw.bpm);
global.ms_per_beat = 60000 / global.bpm;

global.lane_times = [[], [], [], []];
global.lane_head  = [0, 0, 0, 0];           // first unresolved note per lane
global.end_time   = 0;

var _notes = _raw.charts[0].notes;

// chart preprocessing
for (var i = 0; i < array_length(_notes); i++) {
    var _n = _notes[i];
    array_push(global.lane_times[_n.lane - 1], _n.songPos);
    global.end_time = max(global.end_time, _n.songPos);
}

global.state  = "playing";

var _s  = 8;                // change only this to rescale everything
var _x0 = 20  / 17 * _s;    // positions are the old ones (made at scale 17) divided by 17, times the scale
var _dx = 228 / 17 * _s;
var _y  = 261;

var _objs = [H, J, K, L];
for (var i = 0; i < 4; i++) {
    var _inst = instance_create_layer(_x0 + i * _dx, _y, "Instances", _objs[i]);
    _inst.image_speed  = 0;
    _inst.image_xscale = _s;
    _inst.image_yscale = _s;
}

// line look
line_color  = c_gray;
line_alpha  = 0.5;
line_width  = 2;

// block look
block_color = c_white;
block_alpha = 0.9;
block_h     = 16;

// motion
approach_ms = 1500;     // ms a block is visible before its hit time
ease_amount = 0.4;      // 0 = constant speed, higher = stronger slow/speed curve

// lane geometry, filled in every frame by the Draw event
lane_ok    = [false, false, false, false];
lane_cx    = [0, 0, 0, 0];
lane_cy    = [0, 0, 0, 0];
lane_half  = [0, 0, 0, 0];
lane_end_y = [0, 0, 0, 0];

// draw just behind the buttons (bigger depth = further back)
depth = H.depth + 1;

instance_create_layer(0, 0, "Instances", health_manager);
instance_create_layer(0, 0, "Instances", judge);
instance_create_layer(0, 0, "Instances", music_player);
instance_create_layer(0, 0, "Instances", metronome);
instance_create_layer(0, 0, "Instances", input_listener);