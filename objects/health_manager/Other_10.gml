global.cur_lives = max(0, global.cur_lives - 1);
show_debug_message("lost a life! lives remaining: " + string(global.cur_lives));