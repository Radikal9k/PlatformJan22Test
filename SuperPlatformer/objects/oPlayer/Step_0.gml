// Get Player Inputs
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

if (key_left) || (key_right) || (key_jump)
{
	controller = 0;	
}

//control if left pad is used (absolute value) when higher then 0.2 (it can be from  0 to 1)
if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
{
	// devono essere sempre positivi per spostarsi
	// se negativo diventa positivo (abs), se positivo il minimo é 0 quindi key_left nn si attiva
	//... ma si attiva key_right che vuole il massimo tra 0 é il joipad positivo
	key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));	
	key_right = max(gamepad_axis_value(0, gp_axislh),0);
	controller = 1;
}

if (gamepad_button_check_pressed(0, gp_face1)) 
{
	key_jump = 1;
	controller = 1;
}


// Calculate movements
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

//Jump
if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	// it's negative 7 because Y negative it's up, not down.
	vsp = -10;
}

// Horizontal collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x+sign(hsp)
	}
	hsp = 0;
}

x = x + hsp;


// Vertical collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{ 
		y = y+sign(vsp)
	}
	vsp = 0;
}

y = y + vsp;


//Animation when not touching the floor
if (!place_meeting(x,y+1,oWall)) 
{
	sprite_index = sPlayerA;	
	image_speed = 0;
	if (sign(vsp) > 0) 
	{image_index = 1;}
	else	{image_index = 0;}
}
//else animation if touching the floor
else 
{
	image_speed = 1;
	if (hsp == 0) 
	{
		sprite_index = sPlayer;
	}
	else 
	{
		sprite_index = sPlayerR;
	}
}
if (hsp != 0) image_xscale = sign(hsp);
 