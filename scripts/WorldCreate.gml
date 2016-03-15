///WorldCreate()
global.mv_free  = true;
global.debug = false;

if(global.debug) {
    global.resource_coefficient = 2;
    global.mv_speed = 12;
}
else {
    global.resource_coefficient = 75;
    global.mv_speed = 6;
}
    
// Global Font
draw_set_font(fnt_Helvetica_Neue);
//window_set_cursor(cr_none);

// Presetting resources
globalvar ls_resources;
ls_resources[0,0] = "Glass / Stone";
ls_resources[0,1] = 100;
ls_resources[1,0] = "Wood";
ls_resources[1,1] = 100;
ls_resources[2,0] = "Utilities";
ls_resources[2,1] = 100;
ls_resources[3,0] = "Metal";
ls_resources[3,1] = 100;
ls_resources[4,0] = "Plastic";
ls_resources[4,1] = 100;

// Presetting the building status
globalvar building;
building = instance_create(0,0,OneBuilding);

// NPC - NPC Conversation setup
global.conv_check[0] = "";
global.npc_conv = false;

// Loading the dialogues
global.didara   = ReadJson("didara.json");
global.tsai     = ReadJson("tsai.json");
global.alex     = ReadJson("alex.json");
global.jacques  = ReadJson("jacques.json");
global.fayruz   = ReadJson("fayruz.json");
global.npc_npc  = ReadJson("npc-npc.json");

// Setting the options variable
global.options = noone;
