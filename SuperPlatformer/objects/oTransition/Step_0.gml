/// @description Progress the transition

if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO)
	{
		//Easy version= percent = max(0,percent-0.05);	
		//Oppure
		percent = max(0, percent - max((percent/10),0.005));
	}
	else
	{
		//Easy version= percent = min or max(1,percent+0.05);	
		//Oppure
		percent = min(percentTarget, percent + max(((1-percent)/10),0.005));
	}
	if (percent == percentTarget) || (percent == 0)
	{
		switch (mode)
		{
			case TRANS_MODE.INTRO: 
			{
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT: 
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO: 
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART: 
			{
				game_restart();
				break;
			}
		}
	}
}

