global.state = "menu";

if (!instance_exists(game_resetter)) {
    instance_create_layer(0, 0, "Instances", game_resetter);
}

with (game_resetter) {event_user(0);}