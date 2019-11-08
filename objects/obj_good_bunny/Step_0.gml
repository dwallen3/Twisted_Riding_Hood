/// @description Insert description here
// You can write your code in this editor
grav = min(7,yvel+0.05)
switch (state)
{
	case e_state.idle:
	{
		xvel = 0
		yvel = grav
		if(distance_to_object(player_dagger)<100)
		{
			state = e_state.chase
		}
	}
	break;
	case e_state.chase:
	{
		self.direction = sign(player_dagger.x - self.x)
		xvel = direction * movespeed
		yvel = grav
		if(distance_to_object(player_dagger)>150)
		{
			state = e_state.idle
		}
	}
	break;
}

if(place_meeting(round(x+xvel),round(y), object1))
{
	while(!place_meeting(round(x+sign(xvel)),round(y),object1))
	{
		x+=sign(xvel)
	}
	xvel = 0
}
x += xvel
if(place_meeting(round(x),round(y+yvel), object1))
{
	while(!place_meeting(round(x),round(y+sign(yvel)),object1))
	{
		y+=sign(yvel)
	}
	yvel = 0
}
y += yvel