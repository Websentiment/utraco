$(document).ready(function () {
    $(".messengerbtncon").click(function () {
        $(".chatboxcon").addClass("active");
    });

    $(".closebtninnercon").click(function () {
        $(".chatboxcon").removeClass("active");
    });

    $(".widget-messenger").addClass("show");
});