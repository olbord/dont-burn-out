if (global.state != "playing") exit;

for (var i = 0; i < 4; i++) {
    if (keyboard_check_pressed(keys[i])) {
        judge.press_lane = i + 1;       // tell the judge which lane
        with (judge) event_user(0);     // "key pressed" signal
    }
}