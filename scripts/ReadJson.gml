/// ReadJson(file)
var file = argument[0];

// Declare the variables
var dialogue, resultMap, list, jsonFile, data = "";

dialogue = ds_map_create();
dialogue[? "npc"] = string_replace(file,".json","");
dialogue[? "next"] = ConversationCheckNext(dialogue[? "npc"],"c0");

if(file == "npc-npc.json") dialogue[? "next"] = ConversationCheckNext("npc","af0");
    
// First of all, open the file
jsonFile = file_text_open_read(file);

// Make a string out of it
while (!file_text_eof(jsonFile)) {
    data += file_text_read_string(jsonFile);
    file_text_readln(jsonFile);
}

// Close the file
file_text_close(jsonFile);

data = string_replace_all(data,"__player__", obj_player.name);

// Transforming that string "theData" into a JSON
resultMap = json_decode(data);

/*  If there's error in this line, your json file is wrong,
    Find out there, not here. This line is fine, thank you. */
var size = ds_map_size(resultMap);
// Here, making in an object
if(!ds_list_empty(resultMap)){
    for (var map = ds_map_find_first(resultMap); map != undefined; map = ds_map_find_next(resultMap,map)) {
        
        var TheDialogue, pMap, cList, theMap;
        var index = noone, participants = noone, 
            conversation = noone, options = noone;

        TheDialogue = instance_create(0,0,OneDialogue);
        
        theMap      = resultMap[? map];
        
        index       = theMap[? "index"];
        pMap        = theMap[? "participants"];
        cMap        = theMap[? "conversation"];
        oMap        = theMap[? "options"];
        
        TheDialogue.index = index;
            
        // Adding the participants to the OneDialogue object
        for (var i = 0; i < ds_list_size(pMap); i++){
            participants[i] = pMap[| i];
        }
        
        // Adding the sentences to the OneDialogue object
        for (var i = 0; i < ds_list_size(cMap); i++){
            var newList = cMap[| i];
            var sentence = instance_create(0,0,OneSentence);
            sentence.participant = participants[newList[| 0]];
            sentence.sentence = newList[| 1];
            conversation[i] = sentence;
        }
        
        // Adding the options to the OneDialogue object
        for(var i = 0; i < ds_list_size(oMap); i++){
            var newMap = oMap[| i];
            var option = instance_create(0,0,OneOption);
            var output = newMap[? "output"];
            
            option.text = newMap[? "text"];
            
            output = ExplodeString(",",output);
            
            for(var j = 1; j <= output[0]; j++){
            
                var command = ExplodeString(":",output[j]);
                
                // @TODO: Probably there's a better way to do this
                switch(file){
                    case "didara.json":
                        option.npc = "Didara";
                        break;
                    case "tsai.json":
                        option.npc = "Tsai";
                        break;
                    case "jacques.json":
                        option.npc = "Jacques";
                        break;
                    case "alex.json":
                        option.npc = "Alex";
                        break;
                    case "fayruz.json":
                        option.npc = "Fayruz";
                        break;
                    default:
                        option.npc = "";
                }
                
                // Setting the blanks
                option.next = "";
                option.outcome = "";
                
                // Changing if anything is passed
                switch(command[1]){
                    case "goto":
                        option.next = command[2];
                    break;
                    case "resources":
                        option.outcome = output[j];
                    break;
                    case "approval":
                        option.outcome = output[j];
                    break;
                }
            }
            
            options[i] = option;
        }
        
        TheDialogue.participants = participants;
        TheDialogue.conversation = conversation;
        TheDialogue.options = options;
        
        dialogue[? map] = TheDialogue;
    }
}

return dialogue;
