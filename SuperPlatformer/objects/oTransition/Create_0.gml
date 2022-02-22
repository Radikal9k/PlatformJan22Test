/// @description Size variable and mode setup

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;
 // per far diventare un set d numeri in Parole, per comoditá
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;
percentTarget = 1;