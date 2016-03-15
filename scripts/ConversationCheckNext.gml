/// ConversationCheckNext(npc,index)
/*
    Checks whether the conversation has happened already and 
    returns the standard one if it has.
*/
{
    var npc = argument[0];
    var index = argument[1];
    
    var record = npc + "-" + index;
    convarr_size = array_length_1d(global.conv_check);
    
    for(var i = 0; i < convarr_size; i++){
        if(record == global.conv_check[i]) return "c999";
    }
    
    global.conv_check[convarr_size] = record;
    
    return index;
}
