draw_self();

if (flash > 0) 
{
//diminuisce flash d uno	
	flash--;
//setto manualmente lo shader a shWhite
	shader_set(shWhite);
//ridisegna l'oggetto
	draw_self();
//resetta lo shader originale
	shader_reset();
}


