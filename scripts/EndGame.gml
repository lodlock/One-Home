///EndGame()

// Add the green point and judge it.
show_debug_message("Endgame");

// Show the Romance / Highest Approval NPC Dialogue

var total_gp = 0;
total_gp += global.building.walls.greenpoints;
total_gp += global.building.roof.greenpoints;
total_gp += global.building.frames.greenpoints;
total_gp += global.building.plumbing.greenpoints;
total_gp += global.building.electricity.greenpoints;
total_gp += global.building.heating.greenpoints;

if(total_gp >= 12 && global.building.heating.greenpoints > 0) {
    show_message("Congratulations, you saved the planet! Thank you for your effort!");
} else {
    show_message("Oh damn, it seems like your decisions weren't the best ones. The 
            planet didn't change much, seems like we're all doomed...");
}

game_end();
// Show the Lowest NPC Dialogue
