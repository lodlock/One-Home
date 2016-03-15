/// TriggerEvent(event,value)
/*
    Test on an Event Oriented Development
    
    Calling events anywhere in the code and checking the scope of
    each part of it.
*/
var event = argument[0];
var value = argument[1];

switch(event){  
    case "CloseMenu":
        menu_highlight = 0;
        draw_menu = false;
        global.mv_free = true;
        obj_player.direction = 270;
        obj_player.sprite_index = spr_player_down;
        break;
    case "Build":
        if(value == "Structure") {
            draw_submenu = "structure";
            
            if(global.building.walls.material == noone) {           // Walls:
                //      Didara second 
                global.didara[? "next"] = ConversationCheckNext("didara","c3");
                
                //      Fayruz-Alex second 
                if(ConversationCheckNext("npc","af1") != "c999") {
                    global.npc_npc[? "next"] = "af1";
                    
                    var player = instance_find(obj_player,0);
                    global.npc_conv = true;
                    player.new_npc.interacting = false;
                    CreateDialogNPC(player.new_npc);
                }
            } else if (global.building.roof.material == noone) {   // Roof
                
                //      Alex second 
                global.alex[? "next"] = ConversationCheckNext("alex","c5");
                
            } else if (global.building.frames.material == noone) { // Windows
                
                //      Fayruz second
                global.fayruz[? "next"] = ConversationCheckNext("fayruz","c7");
                
                //      Fayruz-Alex second
                if(ConversationCheckNext("npc","af1") != "c999") {
                    global.npc_npc[? "next"] = "af1";
                    
                    var player = instance_find(obj_player,0);
                    global.npc_conv = true;
                    player.new_npc.interacting = false;
                    CreateDialogNPC(player.new_npc);
                }
                
            }
        }
        if(value == "Facilities") {
            draw_submenu = "facilities";
        
            if (global.building.plumbing.material == noone) { // Plumbing
            
            // Nothing here
                
            } else if (global.building.electricity.material == noone) { // Electricity
                
                //      Jacques second
                global.jacques[? "next"] = ConversationCheckNext("jacques","c5");
                
            } else if (global.building.heating.material == noone) { // Heating 
                
                //      Tsai second
                global.tsai[? "next"] = ConversationCheckNext("tsai","c5");
                
            }
        }
        break;
    case "BuildWall":
        global.building.walls       = GetBuildingOption(global.ls_building[? "walls"],value);
        if(real(global.building.walls.material) != noone) {
            submenu_option = global.ls_building[? "roof"];
        
            //    Fayruz third
            global.fayruz[? "next"] = ConversationCheckNext("fayruz","c14");
            
            //    Jaques-Fayruz second
            if(ConversationCheckNext("npc","fj1") != "c999") {
                global.npc_npc[? "next"] = "fj1";
                
                var player = instance_find(obj_player,0);
                global.npc_conv = true;
                player.new_npc.interacting = false;
                CreateDialogNPC(player.new_npc);
            }
            //   Fayruz-Alex third
            //   Tsai-Fayruz first
        }
        break;
    case "BuildRoof":
        global.building.roof        = GetBuildingOption(global.ls_building[? "roof"],value);
        if(real(global.building.roof.material) != noone) {
            submenu_option = global.ls_building[? "windows"];
        
            //    Tsai third
            global.tsai[? "next"] = ConversationCheckNext("tsai","c10");
            
            //    Jacques third
            global.jacques[? "next"] = ConversationCheckNext("jacques","c13");
            
            //    Didara-Tsai second
            if(ConversationCheckNext("npc","dt1") != "c999") {
                global.npc_npc[? "next"] = "dt1";
                
                var player = instance_find(obj_player,0);
                global.npc_conv = true;
                player.new_npc.interacting = false;
                CreateDialogNPC(player.new_npc);
            }
            //    Jacques-Alex second
        }
        break;
    case "BuildWindows":
        global.building.frames      = GetBuildingOption(global.ls_building[? "windows"],value);
        
        if(real(global.building.frames.material) != noone) {
            submenu_option = global.ls_building[? "plumbing"];
            draw_submenu = "";
            menu_option[0,1] = false;
            menu_option[1,1] = true;
            for(var i = 0; i < array_height_2d(menu_option); i++){
                if(menu_option[i,1]){
                    menu_highlight = i;
                    break;
                }
            }       
          
            //    Tsai-Jacques second
            if(ConversationCheckNext("npc","jt1") != "c999") {
                global.npc_npc[? "next"] = "jt1";
                
                var player = instance_find(obj_player,0);
                global.npc_conv = true;
                player.new_npc.interacting = false;
                CreateDialogNPC(player.new_npc);
            }
            //    Tsai-Fayruz second
            //    Jacques-Didara third
            //    Jacques-Fayruz third
            
            //    Alex third
            global.alex[? "next"] = ConversationCheckNext("alex","c14");
            
            //    Didara third 
            global.didara[? "next"] = ConversationCheckNext("jacques","c7");
        }
        
        break;
    case "BuildPlumbing":
        global.building.plumbing    = GetBuildingOption(global.ls_building[? "plumbing"],value);
        if(real(global.building.plumbing.material) != noone) {
            submenu_option = global.ls_building[? "electricity"];
        
            //    Fayruz fourth
            global.fayruz[? "next"] = ConversationCheckNext("fayruz","c18");
            
            //    Tsai fourth
            global.tsai[? "next"] = ConversationCheckNext("tsai","c15");
            
            //    Jacques fourth
            global.jacques[? "next"] = ConversationCheckNext("jacques","c20");
            
            //    Didara-Tsai third
            if(ConversationCheckNext("npc","dt2") != "c999") {
                global.npc_npc[? "next"] = "dt2";
                
                var player = instance_find(obj_player,0);
                global.npc_conv = true;
                player.new_npc.interacting = false;
                CreateDialogNPC(player.new_npc);
            }
        }
        break;
    case "BuildElectricity":
        global.building.electricity = GetBuildingOption(global.ls_building[? "electricity"],value);
        if(real(global.building.electricity.material) != noone) {
            submenu_option = global.ls_building[? "heating"];
        
            //    Didara fourth
            global.didara[? "next"] = ConversationCheckNext("jacques","c14");
            
            //    Alex fourth
            global.alex[? "next"] = ConversationCheckNext("alex","c25");
            
            //    Tsai-Fayruz third
            if(ConversationCheckNext("npc","ft2") != "c999") {
                global.npc_npc[? "next"] = "ft2";
                
                var player = instance_find(obj_player,0);
                global.npc_conv = true;
                player.new_npc.interacting = false;
                CreateDialogNPC(player.new_npc);
            }
            //    Tsai-Jacques third
            //    Jacques-Alex third
        }
        break;
    case "BuildHeating":
        global.building.heating     = GetBuildingOption(global.ls_building[? "heating"],value);
        if(real(global.building.heating.material) != noone) {
            EndGame();
        }
        break;
    
}

