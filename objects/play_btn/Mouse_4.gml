if (global.state == "menu") {
	// start game
	global.state = "playing";

	// set cursor to default
	window_set_cursor(cr_default);

	// change computer sprite
	event_user(0);

	// place game_controller instance in the room
	if (!instance_exists(game_controller)) {
	    instance_create_layer(0, 0, layer, game_controller);
	}

	with (game_controller) {
		chart_filename = other.chart_filename;
		event_user(0);
	}
}