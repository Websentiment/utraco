window.onscroll = function () { myFunction() };

function myFunction() {
    var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
    var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
    var scrolled = (winScroll / height) * 100;
    document.getElementById("myBar").style.width = scrolled + "%";
}

$(document).ready(function () {


    $(".JStoggleHeader").click(function () {
        $(this).parent().toggleClass("active");
        $(this).parent().siblings().removeClass("active");

        if ($('.JStoggleHeader').parent().hasClass('active')) {
            $(".overlay").addClass("active");
        } else {
            $(".overlay").removeClass("active");
        }
    });

    $(".dropdown .toggleDropdown").click(function () {
        $(this).parent().toggleClass("open");
    });

    $('.hamburger').click(function () {
        $("header").toggleClass('open');
        $("#nav-icon2").toggleClass('open');
        $(".overlay").toggleClass('active');
    });
});