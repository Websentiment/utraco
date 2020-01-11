﻿$(document).ready(function () {

    //if ($("#cbAnderAdres").is(':checked')) {
    //    $(".DivDiffrent").removeClass("d-none");
    //}

    //if ($("#cbAccount").is(':checked')) {
    //    alert("alasdasd");
    //}


    getForLater();

    $("#cbAccount").change(function () {
        $("#hidAccount").val($(this).is(':checked'));
        if ($(this).is(':checked')) {
            $(".txtPassword").focus();
            $("#divAccount").removeClass("hidden");
        } else {
            $("#divAccount").addClass("hidden");
        }
    });

    $("#cbAnderAdres").change(function () {
        bAddress = $(this).is(':checked');
        $("#hidAddress").val(bAddress);

        if (bAddress) {
            $("#DivDiffrent").removeClass("hidden");
            $(".txtFirstName2").focus();
        } else {
            $("#DivDiffrent").addClass("hidden");
        }
    });

    $('.ddlCountry').change(function () {
        bepaalVerzendkosten();
    });


    $('.ddlCountry2').change(function () {
        bepaalVerzendkosten();
    });

    $('.rblVerzendmethode input').change(function () {
        $('#hidArtikelVerzendID').val($(this).val());
        bepaalVerzendkosten();
    });

    $('.rblBetaalmethode input').change(function () {
        $('#hidBetaalmethode').val($(this).val());
        if ($(this).val() != 'ideal') {
            $(".divIdeal").hide();
        } else {
            $(".divIdeal").show();
        }
    });

    if ($('#hidValidatePostback').val() === 'true') {
        Validate(false);
    }

    $('.ddlCountry').on("change", function () {
        if ($(this).find(':selected').data('id') === 'B') { //B = australie
            $('.divHouseNr').addClass("hidden");
            $('.divAdd').addClass("hidden");
            $('.divExtraField').removeClass("hidden");
        } else {
            $('.divHouseNr').removeClass("hidden");
            $('.divAdd').removeClass("hidden");
            $('.divExtraField').addClass("hidden");
        }
    }).trigger("change");

    $('.ddlCountry2').on("change", function () {
        if ($(this).find(':selected').data('id') === 'B') {
            $('.divHouseNr2').addClass("hidden");
            $('.divAdd2').addClass("hidden");
            $('.divExtraField2').removeClass("hidden");
        } else {
            $('.divHouseNr2').removeClass("hidden");
            $('.divAdd2').removeClass("hidden");
            $('.divExtraField2').addClass("hidden");
        }
    }).trigger("change");

    $(".txtHouseNr").blur(function () {
        if ($(".ddlCountry").find(':selected').data('code') === 'NL') {
            var postcode = $(".txtZipCode").val();
            var nr = $(".txtHouseNr").val();
            if (postcode.length >= 6) {
                if (nr.length > 0) {
                    var wijkcode = postcode.substring(0, 4);
                    var straatcode;

                    if (postcode.length === 6) {
                        straatcode = postcode.substring(4, 6);
                    }
                    if (postcode.length === 7) {
                        straatcode = postcode.substring(5, 7);
                    }
                    var odata = {
                        sWijkCode: wijkcode,
                        sStraatCode: straatcode,
                        sNummer: nr
                    }
                    AjaxRequest("POST", "/Data/AdresCompleet.aspx/sAdres", odata, "#lblAdresInfo", "json", "sAdresCallback");
                }
            }
        }
    });

    $(".txtHouseNr2").blur(function () {
        if ($(".ddlCountry2").find(':selected').data('code') === 'NL') {
            var postcode = $(".txtZipCode2").val();
            var nr = $(".txtHouseNr2").val();
            if (postcode.length >= 6) {
                if (nr.length > 0) {
                    var wijkcode = postcode.substring(0, 4);
                    var straatcode;

                    if (postcode.length === 6) {
                        straatcode = postcode.substring(4, 6);
                    }
                    if (postcode.length === 7) {
                        straatcode = postcode.substring(5, 7);
                    }
                    var odata = {
                        sWijkCode: wijkcode,
                        sStraatCode: straatcode,
                        sNummer: nr
                    }
                    AjaxRequest("POST", "/Data/AdresCompleet.aspx/sAdres", odata, "#lblAdresInfo", "json", "sAdresCallback2");
                } 
            }
        }
    });
});

function sAdresCallback() {
    if (sMsg.d.code === "1") {
        $(".txtAddress").val(sMsg.d.straatnaam);
        $(".txtResidence").val(sMsg.d.plaatsnaam);
        $("#hdfProvincie").val(sMsg.d.provincienaam);
        var decimal = /^[-+]?[0-9]+\,[0-9]+$/;
        lati = sMsg.d.lat
        if (!lati.match(decimal)) {
            lati = 0
        }
        $("#hdfLatitudeX").val(lati);
        longi = sMsg.d.lon
        if (!longi.match(decimal)) {
            longi = 0
        }
        $("#hdfLongitudeY").val(longi);
        return true;
    } else {
        return false;
    }
}

function sAdresCallback2() {
    if (sMsg.d.code === "1") {
        $(".txtAddress2").val(sMsg.d.straatnaam);
        $(".txtResidence2").val(sMsg.d.plaatsnaam);
        $("#hdfProvincie2").val(sMsg.d.provincienaam);
        var decimal = /^[-+]?[0-9]+\,[0-9]+$/;
        lati = sMsg.d.lat
        if (!lati.match(decimal)) {
            lati = 0
        }
        $("#hdfLatitudeX2").val(lati);
        longi = sMsg.d.lon
        if (!longi.match(decimal)) {
            longi = 0
        }
        $("#hdfLongitudeY2").val(longi);
        return true;
    } else {
        return false;
    }
}


function isGegegevensValid() {
    var fv = $('.divGlobalForm').data('formValidation');
    var bOk = true;
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtCompany');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtVAT');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtFirstName');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtSurname');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtEmail');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtPhone');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtZipCode');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtHouseNr');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtAddress');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtResidence');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtFirstName2');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtSurname2');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtZipCode2');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtHouseNr2');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtAddress2');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtResidence2');
    fv.revalidateField('ctl00$ContentPlaceHolder1$terms');

    fv.revalidateField('ctl00$ContentPlaceHolder1$txtNewPasswordOrder');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtNewPasswordConfirmOrder');

    if (fv.isValidField('ctl00$ContentPlaceHolder1$terms') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtCompany') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtVAT') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtFirstName') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtSurname') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtEmail') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtPhone') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtZipCode') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtHouseNr') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtAddress') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtResidence') === false) { bOk = false; }

    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtFirstName2') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtSurname2') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtZipCode2') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtHouseNr2') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtAddress2') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtResidence2') === false) { bOk = false; }

    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtNewPasswordOrder') === false) { bOk = false; }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtNewPasswordConfirmOrder') === false) { bOk = false; }


    saveForLater(".checkout");

    if (bOk) {
        console.log("testPostBack")
        __doPostBack('ctl00$ContentPlaceHolder1$btnOrder', '')
    }
}

function bepaalVerzendkosten() {
    var bOtherAddress = $('.cbOtherAddress input').is(':checked');
    var id;
    if (bOtherAddress) {
        //bezorgadres
        id = $(".ddlCountry2").val()
    } else {
        //factuuradres
        id = $(".ddlCountry").val()
    }
    var odata = {
        iLandID: id,
        iArtikelVerzendID: $('#hidArtikelVerzendID').val(),
        sBetaalmethode: $('#hidBetaalmethode').val()
    }
    AjaxRequest("POST", "/Bestellen-stappen.aspx/BepaalVerzendkosten", odata, "", "json", "bepaalVerzendkostenCallBack");
}

function bepaalVerzendkostenCallBack() {
    $("#spVerzenden").html(sMsg.d.msg);
    $(".JS-subtotaalInclVerzendkosten").html(sMsg.d.totaalIncl);
    // $(".JS-subtotaalIncl").html(sMsg.d.totaalIncl);
    $(".JS-subtotaalExcl").html(sMsg.d.totaalExcl);
}

function isDiscountValid() {
    var fv = $('.divGlobalForm').data('formValidation');
    var bOk = true;
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtKortingscode');
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtKortingscode') === false) { bOk = false; }
    if (bOk) {
        __doPostBack('ctl00$ContentPlaceHolder1$btnKortingscode', '')
    }
}

function getForLater() {
    ////console.log("function getInputsFromStorage");
    var jsonString = sessionStorage.getItem("forLater");
    if (jsonString !== "") {
        var inputsObject = JSON.parse(jsonString);
        if (inputsObject === null) {
            return false;
        }

        console.log();

        $.each(inputsObject[window.location] === undefined ? {} : inputsObject[window.location], function (key, value) {
            var elem = $("#" + key);
            var tagName = $(elem).prop("tagName");
            if (tagName === "INPUT") {
                switch ($(elem).attr('type')) {
                    case "radio":
                    case "checkbox": {
                        $(elem).prop("checked", value);
                    } break;
                    default: {
                        $(elem).val(value.value);
                    }
                }
            } else if (tagName === "SELECT") {
                $(elem).val(value.value);
            }
            $(elem).trigger("blur");
            $(elem).trigger("change");
        });
    }
}

function saveForLater(parentElement) {
    if (!parentElement) {
        parentElement = "";
    }

    var curr_jsonString = sessionStorage.getItem("forLater");
    var curr_inputsObject;
    if (curr_jsonString !== "" && curr_jsonString !== null) {
        curr_inputsObject = JSON.parse(curr_jsonString);
    } else {
        curr_inputsObject = {};
    }

    var inputsObject = {};

    $.each($(parentElement + " input, " + parentElement + " select"), function () {
        if ($(this).data("store") === false || $(this).val() === "") {
            return true;
        }

        var tagName = $(this).prop("tagName");
        var id = $(this).attr('id');

        if (tagName === "INPUT") {
            var val = $(this).val();

            switch ($(this).attr('type')) {
                case "radio":
                case "checkbox": {
                    if ($(this).is(':checked')) {
                        inputsObject[id] = true;
                    }
                } break;
                default: {
                    inputsObject[id] = {
                        value: val
                    };
                }
            }
        } else if (tagName === "SELECT") {
            inputsObject[id] = {
                value: $(this).find("option:selected").val()
            };
        }
    });

    curr_inputsObject[window.location] = inputsObject;

    var jsonString = JSON.stringify(curr_inputsObject);
    sessionStorage.setItem("forLater", jsonString);
}

