/// TimeToString(number)
var number = argument[0];
var time = "";


if(number < 10)
    time = "0" + string(number);
else 
    time = string(number);
    
return string_copy(time,0,2);
