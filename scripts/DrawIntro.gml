///Intro

intro_text[12] = "One Home";
intro_text[11] = "by Cara Kronisch, Marcelo Gaia, Sebastian Stander, and Hehley Park";
intro_text[10] = "BEGIN";
intro_text[9] = "20XX ";
intro_text[8] = "Earth is effectively dying...";
intro_text[7] = "In order to combat this, the powers that be have decided to sponsor a joint effort to re-evalute their capacity to limit our collective footprint.";
intro_text[6] = "You have been assigned to a small team of six. Your goal is to effectively design and build a house that could be a template to potentially save humanity.";
intro_text[5] = "Fortunately for you, your team has already taken care of the big stuff.";
intro_text[4] = "All you have to do is procure the resources neccesary to finish it.";
intro_text[3] = "Your team has concluded that either an Earth-Sheltered, Recycled, or 'Dome' Design would do.";
intro_text[2] = "No one decided it was a good idea to inform you as to the logistics of putting up such homes.";
intro_text[1] = "You have ____ days to aquire the resources to build one of these.";
intro_text[0] = "Good luck!";

draw_set_colour(c_navy);
draw_roundrect( 20, window_get_height() - 150, window_get_width() - 20, window_get_height() - 20, false);
draw_set_colour(c_white); 
draw_roundrect( 20, window_get_height() - 150, window_get_width() - 20,  window_get_height() - 20, true);
                    
draw_set_halign(fa_left);
draw_set_valign(fa_top);
    
    
draw_set_font(fnt_Helvetica_bold);
draw_text_ext_transformed(40, window_get_height() - 140, intro_text[12], 12, window_get_width() - 80,1,1,0);
