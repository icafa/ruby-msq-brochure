var resizeImg_brochure = function(img,size) {
 console.log("resize event");
  imgwidth = img.width;
  imgheight = img.height;
  var canvasHeight , canvasWidth, canvasLeft, canvasTop;
  if ( imgwidth < imgheight )//wide
  {
    canvasHeight = size;
    if (window.innerWidth < 500) {
      console.log("mobile");
      canvasHeight = 150.0;
      $('.portimg').addClass('portimg-mobile');
    }
    canvasWidth = canvasHeight/ imgheight * imgwidth;
    canvasLeft = -0.5 * (canvasWidth - canvasHeight);
    canvasTop = 0;
  }
  else//tall
  {
    canvasWidth = size;
    if (window.innerWidth < 500) {
      console.log("mobile");
      canvasWidth = 150.0;
      $('.portimg').addClass('portimg-mobile');
    }
    canvasHeight = canvasWidth/ imgwidth * imgheight;
    canvasLeft = 0;
    canvasTop = -0.5 * (canvasHeight - canvasWidth);
  }
  img.width = canvasWidth ;
  img.height = canvasHeight ; 
  img.style.position = "absolute";
  img.style.left = canvasLeft + 'px';
  img.style.top = canvasTop + 'px';
  img.style.visibility = "visible";
}
var resizeImg_brochure_datail = function(img,size) {
  console.log("resize event");
  imgwidth = img.width;
  imgheight = img.height;
  var canvasHeight , canvasWidth, canvasLeft, canvasTop;
  if ( imgwidth < imgheight )//wide
  {
    canvasHeight = size;
    if (window.innerWidth < 500) {
      console.log("mobile");
      canvasHeight = 150.0;
      $('.portimg').addClass('portimg-mobile');
    }
    canvasWidth = canvasHeight/ imgheight * imgwidth;
    canvasLeft = -0.5 * (canvasWidth - canvasHeight);
    canvasTop = 0;
  }
  else//tall
  {
    canvasWidth = size;
    if (window.innerWidth < 500) {
      console.log("mobile");
      canvasWidth = 150.0;
      $('.portimg').addClass('portimg-mobile');
    }
    canvasHeight = canvasWidth/ imgwidth * imgheight;
    canvasLeft = 0;
    canvasTop = 0;
  }
  img.width = canvasWidth ;
  img.height = canvasHeight ; 
  img.style.position = "absolute";
  img.style.left = canvasLeft + 'px';
  img.style.top = canvasTop + 'px';
}

var submitFormajax = function(formid, furl)
{
   var fd = new FormData(document.querySelector('#'+formid));
   $.ajax({
        url: furl,
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        success: function() {
           console.log("submitFormajax successed");
        }
    });
}