// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @desc SlideTransition(mode, target)
/// @function SlideTransition(mode,target)
/// @arg mode sets transition mode between next, restart and goto
/// @arg target sets target room when using the goto mode

function SlideTransition(){
	with(oTransition){
		mode = argument[0];
		if(argument_count > 1) target = argument[1];
	}
}