///PlayerMove()
var up_key      = keyboard_check(vk_up) or keyboard_check(ord('W'));
var down_key    = keyboard_check(vk_down) or keyboard_check(ord('S'));
var right_key   = keyboard_check(vk_right) or keyboard_check(ord('D'));
var left_key    = keyboard_check(vk_left) or keyboard_check(ord('A'));

animspeed = .6;
if(global.mv_free){
    if (right_key) {
        for(var i = 0; i < global.mv_speed; i++) {
            if( !place_meeting((x + 1),y,obj_collidable) || 
                ( 
                    place_meeting((x + 1),y,obj_door) && 
                    instance_nearest(x, y-160, obj_door).image_index > 12 &&
                    !place_meeting((x + 1),y,obj_collision) 
                )
            ){
                x += 1;
                image_speed = animspeed;
            }
        }
        
        obj_player.direction = 0;
        sprite_index = spr_player_right;
    }
    if (left_key) {
        for(var i = 0; i < global.mv_speed; i++) {
            if(!place_meeting((x - 1),y,obj_collidable) || 
                ( 
                    place_meeting((x - 1),y,obj_door) && 
                    instance_nearest(x, y-160, obj_door).image_index > 12 &&
                    !place_meeting((x - 1),y,obj_collision)
                )
            ){
                x -= 1;
                image_speed = animspeed;
            }
        }
        
        obj_player.direction = 180;
        sprite_index = spr_player_left;
    }
    if (down_key) {
        for(var i = 0; i < global.mv_speed; i++) {
            if(!place_meeting(x,(y + 1),obj_collidable) || 
                ( 
                    place_meeting(x,(y + 1),obj_door) && 
                    instance_nearest(x, y-160, obj_door).image_index > 12 &&
                    !place_meeting(x,(y + 1),obj_collision)
                )
            ){
                y += 1;
                image_speed = animspeed;
            }
        }
        
        obj_player.direction = 270;
        sprite_index = spr_player_down;
    }
    if (up_key) {
        for(var i = 0; i < global.mv_speed; i++) {
            if(!place_meeting(x,(y - 1),obj_collidable) || // NPCs
                ( 
                    place_meeting(x,(y - 1),obj_door) && 
                    instance_nearest(x, y-160, obj_door).image_index > 12 &&
                    !place_meeting(x,(y - 1),obj_collision)
                )
            ){ // Doors
                y -= 1;
                image_speed = animspeed;
            }
        }
        
        obj_player.direction = 90;
        sprite_index = spr_player_up;
    }
}

if((!up_key && !down_key && !left_key && !right_key) || !global.mv_free){
    image_index = 0;
    image_speed = 0;
}
