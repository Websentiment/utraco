$(document).ready(function () {
    //$(".prices table tbody tr td span").each(function () {
    //    if ($(this).text().trim() === "V");
    //        $(this).parent().addClass("check");
    //});

    var $cart = $(".prices table tbody tr td");
    var text = $cart.find(" span").text().trim();
    if ((text == "V") || !text.length) {
        $cart.addClass("emptyCart");
    }
    else {
        $cart.removeClass("emptyCart");
    }
});
