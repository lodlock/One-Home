/// ExplodeString(sep,data)
/*
** Usage:
** var arr = explode_string(sep,data);
**
** Arguments:
** sep separator character, string
** data array data, string
**
** Returns:
** array where entry 0 array[0] is the number of items read and array[1....n] is the data as strings
**
** Notes:
** Converts a string of data with elements separated
** by a delimiter into an array of strings.
**
** GMLscripts.com, modified by icuurd12b42
*/
{
    var arr,sep,dat,len,ind,pos;
    
    arr[0] = 0;
    
    sep = argument[0];
    dat = argument[1];
    
    len = string_length(sep);
    
    ind = 1;
    
    repeat (string_count(sep,dat)+1) {
    
        pos = string_pos(sep,dat)-1;
        
        if(pos == -1) pos = string_length(dat);
        
        arr[ind] = string_copy(dat,1,pos);
        dat = string_delete(dat,1,pos+len);
        ind += 1;
        arr[0] +=1;
        
    }
    
    return arr;
}
