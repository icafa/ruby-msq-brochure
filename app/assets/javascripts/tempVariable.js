var tempString;
var tempInteger;
var tempWidth;
var tempHeight;
var tempBrochureType = "brochure";
var tempcurrentPage = 1;
var tempPageCount = 1;

var setTempStringRoute = function(tmp){
	tempString = tmp;
	console.log("tempString contains", tempString);
}
var getTempStringRoute = function(){
	return tempString;
}

var setCurrentPage = function(tmp){
	tempcurrentPage = tmp;
	disablePrevPageBtn(false);
	disableNextPageBtn(false);
    if(getCurrentPage() == getPageCount()){
        disableNextPageBtn(true);
    }
    if(getCurrentPage() == 1){
        disablePrevPageBtn(true);
    }
}
var getCurrentPage = function(){
	return tempcurrentPage;
}

var setPageCount = function(tmp){
    tempPageCount = tmp;
}
var getPageCount = function(){
	return tempPageCount;
}
var setTempIntegerId = function(tmp){
	tempInteger = tmp;
	console.log("temp Integer", tempInteger);
}
var getTempIntegerId = function(){
	return tempInteger;
}
var setTempWidthHeight = function(tmpw,tmph){
	tempWidth = tmpw;
	tempHeight = tmph;
	console.log("tempWidth contains", tempWidth);
}
var getTempWidth = function(){
	return tempWidth;
}
var getTempHeight = function(){
	return tempHeight;
}

var setTempBrochureTypeFromId = function(id){
	tempBrochureType = document.getElementById(id).value;
}
var getTempBrochureType = function(){
	return tempBrochureType;
}