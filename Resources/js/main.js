$(document).ready(function () {
    $('.products .item .JSmore').click(function () {
        event.preventDefault();
        $(this).parent().find("ul").toggleClass("open");

        if ($(this).parent().find("ul").hasClass('open')) {
            $(this).text('Lees minder');
        } else {
            $(this).text('Lees meer');
        }

        var myLazyLoad = new LazyLoad({
            elements_selector: ".lazy"
        });

        var wow = new WOW({
            boxClass: 'wow',
            animateClass: 'animated',
            offset: 150,
            live: true
        });
        wow.init();

        $(".package-detail .packagelist .packages label").click(function () {
            $('html, body').animate({
                scrollTop: $(".contactform").offset().top - 77
            }, 2000);
        });





        $('.smooth-scroll').on('click', function (event) {
            var target = $(this.getAttribute('href'));
            if (target.length) {
                event.preventDefault();
                $('html, body').stop().animate({
                    scrollTop: target.offset().top - 77
                }, 1000);
            }
        });

        if (navigator.userAgent.match(/Trident.*rv:11\./)) {
            $('body').addClass('ie11');
        }
    })

    $.ajaxSetup({ cache: false });
    var sMsg = '';
    function AjaxRequest(reqtyp, sUrl, odata, msgId, datatype, sFunctie) {
        if (datatype === "html") {
            $.ajax({
                type: reqtyp,
                url: sUrl, //Pagina bestandsnaam en functienaam
                contentType: "application/json; charset=utf-8",
                dataType: datatype,
                success: function (msg) {
                    sDiv = $('.selector', $(msg));
                    sMsg = msg;
                    window[sFunctie]();
                },
                error: function (msg) {
                    $(msgId).html(msg);
                    return false;
                }
            });
        } else {
            $.ajax({
                type: reqtyp,
                url: sUrl, //Pagina bestandsnaam en functienaam
                data: JSON.stringify(odata),
                contentType: "application/json; charset=utf-8",
                dataType: datatype,
                success: function (msg) {
                    sMsg = msg;
                    if (typeof sFunctie === "function") {
                        sFunctie();
                        return;
                    }

                    console.log(sFunctie);
                    window[sFunctie]();
                },
                error: function (msg) {
                    $(msgId).html(msg);
                    return false;
                }
            });
        }
    }
});

