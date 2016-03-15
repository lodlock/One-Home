/// CreateDialog(text, npc)
var text = argument[0];
var npc  = argument[1];

var next = text[? "next"];
var currConv = text[? next];
npc.curr = currConv.conversation[npc.line];

if(!npc.in_option){
    if(!npc.interacting){ // If not already talking to the npc
        npc.interacting = true;
        global.mv_free = false;
        npc.t = 0;
    } else { // If is actually talking to the npc
        if(npc.t >= string_length(npc.curr.sentence)){ // And the npc finished speaking
            if (npc.line < array_length_1d(currConv.conversation)-1){ // If npc has something else to say
                npc.t = 0;
                npc.line++;
                npc.curr = currConv.conversation[npc.line];
            } else { // End of conversation
                /*
                    Check here if the dialogue has options to display or not, if it has,
                    display it and act accordingly.
                */
                var numOptions = array_length_1d(currConv.options)
                if(numOptions >= 2){
                    npc.in_option = true;
                    npc.interacting = false;
                    npc.line = 0;
                    global.lastnpc = npc;
                    global.options = currConv.options;
                    instance_create(0,0,obj_options);
                } else {
                    /*
                        Call any callback from the options
                    */    
                    if(numOptions > 0)
                        Callback(currConv.options[0],npc);
                
                    /* 
                        If there's nothing else to say, another space keypress will 
                        end the conversation and reset it.
                    */
                    npc.interacting = false;
                    global.mv_free = true;
                    npc.line = 0;
                    global.options = noone;
                    
                    /*
                        Set to the random text
                    */
                    switch(text[? "npc"]){
                        case "didara":
                            global.didara[? "next"] = "c999";
                            break;
                        case "alex":
                            global.alex[? "next"] = "c999";
                            break;
                        case "tsai":
                            global.tsai[? "next"] = "c999";
                            break;
                        case "jacques":
                            global.jacques[? "next"] = "c999";
                            break;
                        case "fayruz":
                            global.fayruz[? "next"] = "c999";
                            break;
                    }
                }
            }
        }
    }
}

obj_player.image_speed = 0;
obj_player.image_index = 0;
