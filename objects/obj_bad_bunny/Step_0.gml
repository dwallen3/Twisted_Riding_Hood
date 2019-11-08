/// @description Insert description here
// You can write your code in this editor
grav = min(7,yvel+0.05)
switch (state)
{
	case e_state.idle:
	{
		xvel = 0
		yvel = grav
		if(distance_to_object(obj_red)<room_width)
		{
			state = e_state.room_chase
		}
	}
	break;
	case e_state.room_chase:
	{
		self.direction = sign(obj_red.x - self.x)
		xvel = direction * movespeed
		yvel = grav
		if(distance_to_object(obj_red)>room_width)
		{
			state = e_state.idle
		}
	}
	break;
}

if(place_meeting(round(x+xvel),round(y), obj_collidable))
{
	while(!place_meeting(round(x+sign(xvel)),round(y),obj_collidable))
	{
		x+=sign(xvel)
	}
	xvel = 0
}
x += xvel
if(place_meeting(round(x),round(y+yvel), obj_collidable))
{
	while(!place_meeting(round(x),round(y+sign(yvel)),obj_collidable))
	{
		y+=sign(yvel)
	}
	yvel = 0
}
y += yvel

//image_xscale = orig_xscale * sign(direction)