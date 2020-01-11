var objFellow = [];
var iFellow = 0;

var lllIndex = 0;
function initStepFour() {
    sExtra();

    AjaxRequest("POST", "/aanvragen.aspx/selectFellowTravelers", { bOnlyFellow: false }, "", "json", function () {
        if (sMsg.d !== "") {
            objFellow = JSON.parse(sMsg.d);

            lllIndex = objFellow.length;

            iFellow = 0; //Reset count
            $(".JS-traveler:not(.hidden)").remove();
            for (var i = 0; i < lllIndex; i++) {
                addFellowTravelers();
            }
        }
    });
}

function sExtra() {
    var iArtikelID = $("#ddlVisums").find("option:selected").data("id");
    var div = $(".JS-extra");

    if (iArtikelID) {
        AjaxRequest("POST", "/aanvragen.aspx/sExtra", { iArtikelID: iArtikelID }, "", "json", function () {
            if (sMsg.d !== "") {
                var obj = JSON.parse(sMsg.d);

                //over engineered tool
                $(".JS-extra input[type='checkbox']").each(function () {
                    var id = parseInt(this.id);
                    var f = obj.findIndex(function (x) { return x.iArtikelID === id; });
                    if (f !== -1) {
                        obj.splice(f, 1);
                    } else {
                        $(this).parents(".JS-parent").remove();
                    }
                });

                $.each(obj, function (i, v) {
                    var li = $("<li>")
                        .addClass("JS-parent checkbox");

                    $("<input>").attr({
                        type: 'checkbox',
                        value: v.iPrijs,
                        id: v.iArtikelID,
                        class: "checkbox",
                        checked: v.checked !== 0
                    }).appendTo(li);

                    $("<label>")
                        .attr("for", v.iArtikelID)
                        .html(v.sArtikel + "(&euro;" + parseFloat(v.iPrijs).toFixed(2).toString().replace(".", ",") + ")")
                        .appendTo(li);

                    li.appendTo(div);
                });
                calculateTotal();
            }
        });
    }
}


$(document).on("change", ".JS-extra input[type='checkbox']", function () {
    var iArtikelID = this.id,
        cb = $(this);

    AjaxRequest("POST", "/aanvragen.aspx/iuExtra", { iArtikelID: iArtikelID }, "", "json", function () {
        if (sMsg.d !== "") {
            var obj = JSON.parse(sMsg.d);
            switch (obj.msg) {
                case "deleted":
                    cb.prop('checked', false);
                    break;
                case "added":
                    cb.prop('checked', true);
                    break;
                case "error":
                    cb.prop('checked', false);
                    break;
            }
        }
        calculateTotal();
    });
});

$(document).on("change", "#ddlVerzendmethodes", calculateTotal);

function calculateTotal() {
    var totaal = $(".JS-subtotaal").data("price");

    $(".JS-extra input[type='checkbox']:checked").each(function () {
        totaal += parseFloat($(this).val());
    });

    var verzendkosten = $("#ddlVerzendmethodes option:selected").data("price");
    if (verzendkosten) {
        totaal += parseInt(verzendkosten);
    }

    $(".JS-totaal").html(totaal.toFixed(2).toString().replace(".", ","));
}

function addFellowTravelers() {
    var clone = $(".JS-traveler.hidden").clone();
    clone.removeClass("hidden");

    if (iFellow) {
        clone.find(".JS-traveler-count").html(iFellow);
    } else {
        clone.find("b.title").html("Reiziger");
    }


    var obj = objFellow[iFellow];
    if (obj !== undefined) {
        clone.find("li[data-f-id]").each(function () {
            $(this).html(obj[$(this).attr("data-f-id")]);
        });

        if (!obj["cbFellowAddress"]) {
            clone.find(".JS-traverel-address").addClass("hidden");
        }
    }

    clone.insertAfter(".JS-traveler:last");

    if (iFellow + 1 === lllIndex) {
        $(".loading").hide();
    }
    iFellow++;
}