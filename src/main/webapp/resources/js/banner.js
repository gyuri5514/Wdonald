/**************************************************************************
배너
****************************************************************************/

var slideIndex = 0;

function slideButton() {
	var c = $('#banner_container');
	if(c.attr("style") == "display:none;"){
		c.attr("style","display:block;");
		$('#slideBtn').text("미리보기 취소");	
		showSlides();
	}
	else {
		c.attr("style","display:none;");
		$('#slideBtn').text("미리보기");	
	}
}

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySliders");
    var dots = document.getElementsByClassName("dot");
	
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }

    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" dot_active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " dot_active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
	if(slides.length < 1) {
		$('#content').text("배너가 없습니다.");
		$('#content').css("display","block");
	}
	
}