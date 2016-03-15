/// GetBuildingOption(bld,mat)
{
    var bld = argument[0];
    var mat = argument[1];

    
    var mres, gres, res;
    
    show_debug_message("");
    show_debug_message(mat);
    
    // Setting the blank option
    option = instance_create(0,0,OneBuildingOption);
    
    for(var i = 0; i < array_height_2d(bld); i++){
        if(mat == bld[i,0]){
            res = StringExplode(",",bld[i,3]);
            
            for(var j = 0; j < array_length_1d(res); j++){
                var temp = StringExplode(":",res[j]);
                mres[j,0] = temp[0];
                mres[j,1] = temp[1];
            }
            
            // Check if there's enough resources
            gres = global.ls_resources;
            var mres_size;
            
            mres_isarray = array_height_2d(mres) > 1;
            if(mres_isarray) mres_size = array_height_2d(mres);
            else  mres_size = array_length_1d(mres);
            
            for(var j = 0; j < mres_size; j++){
                var resname, resvalue;
                if(mres_isarray){
                    resname = mres[j,0];
                    resvalue = real(mres[j,1]);
                } else {
                    resname = mres[0];
                    resvalue = real(mres[1]);
                }
                
                for(var k = 0; k < array_height_2d(gres); k++){
                    if(gres[k,0] == resname){
                        // Not enough resources
                        show_debug_message("j,0 - "+resname+" - "+string(resvalue));
                        
                        if(gres[k,1] < resvalue*global.resource_coefficient){
                            show_debug_message("Not enough resources");
                            return option;
                        }
                        break;
                    }
                }
                
                
            }
            
            for(var j = 0; j < mres_size; j++){
                var resname, resvalue;
                if(mres_isarray){
                    resname = mres[j,0];
                    resvalue = real(mres[j,1]);
                } else {
                    resname = mres[0];
                    resvalue = real(mres[1]);
                }
                
                for(var k = 0; k < array_height_2d(gres); k++){
                    if(gres[k,0] == resname)
                        global.ls_resources[k,1] -= resvalue*global.resource_coefficient;
                }
            }
            
            show_debug_message("Went through");
            option.material     = bld[i,0];
            option.description  = bld[i,1];
            option.greenpoints  = bld[i,2];
            option.resources    = mres;
            option.sprite       = bld[i,4];
            
            submenu_highlight = 0;
        }
    }
    return option;
}
