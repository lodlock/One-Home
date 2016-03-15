/// Callback(callback, npc)
var callback = argument[0];
var npc = argument[1];

show_debug_message("Callback: " + callback.outcome);
callback = ExplodeString(":" , callback.outcome);

// If a proper callback command comes
if(array_length_1d(callback) >= 3){
    var command = callback[1];
    var value = callback[2];
    
    switch(command){
        case "approval":
            var signal = string_copy(value,0,1);
            value = real(string_copy(value,2,string_length(value)));
            if(signal == "+") npc.approval += value;
            else npc.approval -= value;
            break;
        case "romance":
            // Do nothing xD
            break;
        case "resources":
            /*
                Create the resource timer, but first check if the npc isn't
                already fetching the resources requested, if yes, do nothing.
            */
            
            if(instance_exists(obj_resource_timer)){
                for (var i = 0; i < instance_number(obj_resource_timer); i += 1) {
                    var obj = instance_find(obj_resource_timer,i);
                    if(obj.type == npc.material) npc.is_fetching = true;
                }
            }
            
            if(!npc.is_fetching){
                var timer = instance_create(0,0,obj_resource_timer);
                timer.type = npc.material;
                timer.amount = npc.approval;
                npc.is_fetching = true;
                timer.npc = npc;
            }
            
            break;
    }
}
