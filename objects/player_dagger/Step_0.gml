/// @description Insert description here
// You can write your code in this editor
key_A_pressed = keyboard_check(ord("A"))

key_D_pressed = keyboard_check(ord("D"))

key_shift_pressed = keyboard_check(vk_shift)

key_jump = keyboard_check_pressed(vk_space)

speed_multiply = key_shift_pressed ? 4.0 : walk_speed;

var move_dir = key_D_pressed - key_A_pressed;

h_speed = move_dir * walk_speed * speed_multiply;

v_speed = v_speed + grv;


// for jump
if (place_meeting(x,y+1,(object1)) && (key_jump))
{
	v_speed = -4;
}


// Horizontal collision
if(place_meeting(x+h_speed,y, object1))
{
	while(!place_meeting(x+sign(h_speed),y, object1))
	{
		x = x + sign(h_speed);
	}
	h_speed = 0;
}

x = x + h_speed;
 //Vertical Collision
if (place_meeting(x,y+v_speed, object1))
{
	while(!place_meeting(x,y+sign(v_speed), object1))
	{
		y = y + sign(v_speed);
	}
	v_speed = 0;
}

y = y + v_speed;
//Animation for jumping
if (!place_meeting(x, y+1, object1)) 
{
	//sprite_index = walking;
	//image_speed = 0;
	if(sign(v_speed) > 0) image_index = 1; else image_index = 0;
}
//else
//{
//	image_speed = 1;
//	if(h_speed == 000)
//	{
//		sprite_index = dagger_idle;
//	}
//	else
//	{
//		sprite_index = dagger_walking;
//	}
//}
//Animation for walking
if(move_dir != 0)
{
	image_xscale = sign(h_speed);
	sprite_index = dagger_walking;
}
else
{
	sprite_index = dagger_idle;
}
if(mouse_check_button(mb_left))
{
	sprite_index = dagger_attack;
}