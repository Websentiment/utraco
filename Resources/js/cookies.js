$(document).ready(function (e) {
    $.cookie('Functional', '1', { expires: 365 });

    if ($.cookie('token')) {
        $.removeCookie("Analytics");
    } else {
        $.cookie('Analytics', '1', { expires: 365 });
    }

    // Script voor toggle bars
    var min = 90;
    $(".cookies li").css("max-height", min);
    $(".cookies .Toggle").click(function (e) {
        var parent = $(this).parent();
        var max = parent.find(".content").height() + (min + 30);
        var next = parent.next(".cookies li");

        if (parent.hasClass("active")) {
            parent.removeClass("active");
            $(".cookies li").removeClass("next");
            $(".cookies li").css("max-height", min)
        } else {
            $(".cookies li").removeClass("active");
            parent.addClass("active");
            $(".cookies li").css("max-height", min);
            parent.css("max-height", max + "px");
            $(".cookies li").removeClass("next");
            next.addClass("next");
        }
    });

    if ($.cookie('Analytics')) {
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'UA-116131340-1');
    } else {
        $("#cbPreference1").removeAttr("checked");
        $.removeCookie('_ga', {  path: '/' });
        $.removeCookie('_gat_gtag_UA-116131340-1', {  path: '/' });
        $.removeCookie('_gid', { path: '/' });
    }

    // Script voor cookie cookie instellingen
    $('.btn-accept').click(function () {
        $.cookie('PopUp', '1', { expires: 365 });
        event.preventDefault();
        if ($("#cbPreference1").is(':checked')) {
            $.cookie('Analytics', '1', { expires: 365 });
            $.removeCookie("token");
            location.reload(true);
        } else {
            $.removeCookie("Analytics");
            $.cookie('token', '1', { expires: 365 });
            location.reload(true);
        }
    });

    // Script voor cookie melding pop-up
    $('.btnAccept').click(function () {
        $.cookie('PopUp', '1', { expires: 365 });
        location.reload(true);
    });

    if ($.cookie('PopUp')) {
        $('#PopupCookie').hide();
    } else {
        $('#PopupCookie').show();
    }
});
