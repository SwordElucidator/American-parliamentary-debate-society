
(function ($) {
  $(document).ready(function(){

    // reappearing nav, source: http://stackoverflow.com/questions/23315031/how-to-create-a-hidden-navbar-with-bootstrap-that-shows-after-you-scroll
    $(".navbar").hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.navbar').fadeIn();
        } else {
            $('.navbar').fadeOut();
        }
    });

    // http://www.abeautifulsite.net/smoothly-scroll-to-an-element-without-a-jquery-plugin-2/
    $('a[href^="#"]').on('click', function(event) {
    var target = $( $(this).attr('href') );
    if(target.length) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: target.offset().top
        }, 700);
    }
    
    });

  });
}(jQuery));


