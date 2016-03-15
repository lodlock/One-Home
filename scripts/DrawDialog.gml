///DrawDialog()

if(!in_option){
    if(interacting){
        
        global.mv_free = false;
        
        draw_set_colour(c_navy);
        draw_roundrect( 20,
                        window_get_height() - 150,
                        window_get_width() - 20, 
                        window_get_height() - 20, 
                        false);
                        
        draw_set_colour(c_white);
        draw_roundrect( 20,
                        window_get_height() - 150,
                        window_get_width() - 20, 
                        window_get_height() - 20, 
                        true);
                        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        // Drawing the NPC / Player name
        draw_set_font(fnt_Helvetica_bold);
        draw_text_ext_transformed(  40, window_get_height() - 140,
                                    curr.participant, 12,
                                    window_get_width() - 80,1,1,0);
                                    
        // Drawing the text itself
        draw_set_font(fnt_Helvetica_Neue);
        draw_text_ext_transformed(  141 - 101, window_get_height() - 115,
                                    string_copy(curr.sentence,0,t), 22, 
                                    window_get_width() - 80,1,1,0);
        
        
        draw_sprite_ext(portrait,0, 
                        window_get_width(), window_get_height() - 150,
                        0.3,0.3,0,c_white,1);
        
        if(t<string_length(curr.sentence)) { 
            if(global.debug)
                t+= 3600/room_speed;
            else 
                t+= 36/room_speed;
        }
    }
}
