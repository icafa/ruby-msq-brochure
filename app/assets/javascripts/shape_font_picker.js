var ShowShapesPicker;
ShowShapesPicker= function(){
	var shapespicker = document.getElementById('shapes-list');
	if(shapespicker)
		shapespicker.style.display = "block";
}
var HideShapesPicker;
HideShapesPicker= function(){
	var shapespicker = document.getElementById('shapes-list');
	if(shapespicker)
		shapespicker.style.display = "none";
}
var ShowFontsPicker;
ShowFontsPicker= function(){
	var fontspicker = document.getElementById('fonts-list');
	if(fontspicker)
		fontspicker.style.display = "block";
}
var HideFontsPicker;
HideFontsPicker= function(){
	var fontspicker = document.getElementById('fonts-list');
	if(fontspicker){
		fontspicker.style.display = "none";
	}
}
var SimpleShapesMenuShow;
SimpleShapesMenuShow= function(){
	var simpleshapesmenu = document.getElementById('simple-shapes-menu');
	if(simpleshapesmenu)
		simpleshapesmenu.style.display = "block";
}
var TextMenuShow;
TextMenuShow= function(){
	var textmenu = document.getElementById('text-menu');
	if(textmenu)
		textmenu.style.display = "block";
}
var ready;
ready = function() {
	TextMenuShow();
	SimpleShapesMenuShow();
}
$(document).ready(ready);
$(document).on('turbolinks:load', ready);