$(document).ready(function () {
    if ($(".JS-aanvragen").length > 0) {
        load();
    }
});

function load() {
    $('.request-temp .text').stickThis({
        top: 85,
        zindex: 9,
        pushup: 'footer'
    });

    $(".JS-nav li[data-step]").on("click", function () {
        changeStep($(this).data("step"));
    });

    $(".banner .button-list").filter(function () {
        return $(this).find('li').length < 4;
    }).addClass("long");

    setDatepickers();
    changeStep(2);
}

function showAlert(msg) {
    $(".JS-alert").removeClass("hidden").html(msg);
    $(".JS-alert")[0].scrollIntoView();
}

/* ==========================================================================
   Datepicker initializer
   ========================================================================== */

function setDatepickers() {
    //Dob
    $('.JS-dob').each(function () {
        if ($(this).data("datepicker") === undefined) {
            $(this).datepicker({
                format: 'dd-mm-yyyy',
                autoclose: true
            });
        }
    });

    //Dob
    $('.JS-date-range').each(function () {
        var min = $(this).find(".JS-date-min"),
            max = $(this).find(".JS-date-max");

        min.data("max", max);
        max.data("min", min);

        $([min, max]).each(function () {
            if ($(this).data("datepicker") === undefined) {
                $(this).datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                }).on('changeDate', function (selected) {
                    var min = $(this).data("min"),
                        max = $(this).data("max"),
                        bMin = min !== undefined;

                    var date = new Date(selected.date.valueOf());
                    var someDate = new Date(selected.date.valueOf());
                    var numberOfDaysToAdd = 99;

                    if (bMin) {
                        someDate.setDate(someDate.getDate() - numberOfDaysToAdd);
                    } else {
                        someDate.setDate(someDate.getDate() + numberOfDaysToAdd);
                    }

                    var dd = someDate.getDate();
                    var mm = someDate.getMonth() + 1;
                    var y = someDate.getFullYear();
                    var someFormattedDate = dd + '/' + mm + '/' + y;


                    if (bMin) {
                        //Terug
                        min.datepicker('setStartDate', someFormattedDate);
                        min.datepicker('setEndDate', date);
                    } else {
                        //Vertrek
                        max.datepicker('setStartDate', date);
                        max.datepicker('setEndDate', someFormattedDate);
                    }
                });
            }
        });
    });
}

/* ==========================================================================
   Mgmt of form data
   ========================================================================== */

function getFormData(froms) {
    var data = {};
    $.each(froms, function () {
        $(this).find("input, select").each(function () {
            var _TAG = $(this).prop("tagName").toLowerCase();
            var _ID = $(this).data("f-id") ? $(this).data("f-id") : $(this).attr('id');

            if (_TAG === "input") {
                switch ($(this).attr('type')) {
                    case "checkbox":
                        data[_ID] = $(this).is(':checked');
                        break;
                    default:
                        data[_ID] = $(this).val();
                }
            } else if (_TAG === "select") {
                data[_ID] = $(this).find("option:selected").val();
            }
        });
    });

    return data;
}

/* ==========================================================================
   Mgmt of steps
   ========================================================================== */

function changeStep(i) {

    $(".JS-step[data-step]").each(function () {
        if ($(this).data("step") === i) {
            $(this).removeClass("hidden");
        } else {
            $(this).addClass("hidden");
        }
    });

    $(".JS-nav li[data-step]").each(function () {
        if ($(this).data("step") === i) {
            $(".JS-title").html($(this).html());
            $(this).addClass("active");
        } else {
            $(this).removeClass("active");
        }
    });

    switch (i) {
        case 1:
            $(".JS-betaal").addClass("hidden");
            $(".JS-prices").addClass("hidden");
            break;
        case 2:
            initStepTwo();
            $(".JS-betaal").addClass("hidden");
            $(".JS-prices").removeClass("hidden");
            break;
        case 3:
            initStepThree();
            $(".JS-betaal").addClass("hidden");
            $(".JS-prices").removeClass("hidden");
            break;
        case 4:
            initStepFour();
            $(".JS-betaal").removeClass("hidden");
            $(".JS-prices").removeClass("hidden");
            break;
    }

    berekenKosten();
}

/* ==========================================================================
   Files upload
   ========================================================================== */

function getBase64(file, elem) {
    var reader = new FileReader();
    reader.readAsDataURL(file);

    reader.onload = function () {
        $(elem).data("src", reader.result);
        $(elem).data("ext", file.type);
        $(".loading").hide();
    };

    reader.onerror = function (error) {
        //Show ERROR
        console.log('Error: ', error);
        $(".loading").hide();
    };

}

$(document).on("change", ".JS-file", function () {
    var files = $(this).prop("files");
    if (files.length > 0) {
        $(".loading").show();
        getBase64(files[0], this);
    } else {
        $(this).removeData("src");
        $(this).removeData("ext");
    }
});

//Uplaod files per person
function uploadFiles(iPersID, filesInput, _callback) {
    var l = filesInput.length;


    filesInput.each(function (i) {
        var files = $(this).prop('files');

        if (files.length > 0) {
            var base64 = $(this).data("src"),
                type = $(this).data("ext"),

                file = files[0];

            if (base64 && type && file.size <= 2097152) {
                var data = {
                    sBase64: base64,
                    sType: type,
                    iPersID: iPersID,
                    sInputID: $(this).attr("data-f-id") ? $(this).attr("data-f-id") : $(this).attr("id")
                };

                AjaxRequest("POST", "/aanvragen.aspx/filesUpload", data, "", "json", function () {
                    l -= 1;
                    if (l === 0) {
                        _callback();
                    }
                });
            }
        } else {
            _callback();
        }
    });
}

function berekenKosten() {
    //Selectors
    var aantal = $(".JS-aantal"),
        service = $(".JS-service-totaal"),
        visum = $(".JS-visum-totaal"),
        totaal = $(".JS-subtotaal");

    //Valus
    var iAantal = parseFloat($("#hidAantal").val() ? $("#hidAantal").val() : 2),
        iVisum = parseFloat($("#hidVisum").data("prijs")),
        iOpslag = parseFloat($("#hidService").data("opslag")),
        iService = parseFloat($("#hidService").data("prijs"));

    //Calculation
    var v = (iVisum + iOpslag) * iAantal,
        s = iService * iAantal,
        t = v + s;

    visum.html(v.toFixed(2).toString().replace(".", ","));
    service.html(s.toFixed(2).toString().replace(".", ","));
    totaal
        .html(t.toFixed(2).toString().replace(".", ","))
        .data("price", t);
    aantal.html(iAantal);

    calculateTotal();
}