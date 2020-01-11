var objFellow = [];
var iFellowThree = 0;

function initStepThree() {
    var fellowCount = parseInt($("#hidAantal").val() === "" ? 2 : $("#hidAantal").val()) - 1;
    AjaxRequest("POST", "/aanvragen.aspx/selectFellowTravelers", { bOnlyFellow: true }, "", "json", function () {
        if (sMsg.d !== "") {
            objFellow = JSON.parse(sMsg.d);
            var l = objFellow.length;
            fellowCount = l > fellowCount ? l : fellowCount;
            fellowCount -= $(".JS-fellow:not(.hidden)").length;

            for (var i = 0; i < fellowCount; i++) {
                addFellow();
            }

            objFellow = [];
        }
    });

    $(".loading").hide();
}

$(document).on("click", ".btn-fellow-add", addFellow);
$(document).on("click", ".btn-step[data-step='3']", function () {
    var valid = true;

    $(".JS-fellow:not(.hidden)").each(function () {
        var fv = $(this).data('formValidation');
        if (fv.validate().$invalidFields.length) {
            valid = false;
        }
    });

    if (valid) {
        saveFellow();
    }
});


var countFellowSave = 0;
function saveFellow() {
    if (countFellowSave > 0) { return false; }
    if (countFellowSave === 0) { changeStep(4); }

    $(".loading").show();

    var l = $(".JS-fellow:not(.hidden)").length;
    countFellowSave = l;

    for (var i = 0; i < l; i++) {
        var data = getFormData([$(".JS-fellow:not(.hidden)")[i]]);

        data.iFellowIndex = i;
        AjaxRequest("POST", "/aanvragen.aspx/sFellow", { data: data }, "", "json", function () {
            countFellowSave -= 1;
            var index = l - 1 - countFellowSave;

            if (sMsg.d !== "") {
                var obj = JSON.parse(sMsg.d);
                var filesInput = $($($(".JS-fellow:not(.hidden)")[index]).find(".JS-file"));

                uploadFiles(obj.iPersID, filesInput, function () {
                    if (countFellowSave === 0) {
                        $(".loading").hide();
                        changeStep(4);
                    }
                });
            }
        });
    }
}

function addFellow() {
    if (iFellowThree === 9) { return false; }
    var clone = $(".JS-fellow.hidden").clone();
    clone.removeClass("hidden");

    if (iFellowThree === 0) { clone.find(".btn-fellow-del").remove(); }

    clone.find("input, select").each(function () {
        var id = $(this).data("f-id");

        var label = clone.find("label[for='" + id + "']");
        var newID = id + iFellowThree;

        $(this).attr("id", newID);
        label.attr("for", newID);
    });

    var obj = objFellow[iFellowThree];
    if (obj !== undefined) {
        clone.find("input, select").each(function () {
            if ($(this).attr("type") === "checkbox") {
                $(this).prop("checked", obj[$(this).attr("data-f-id")]);
                showExtra(this);
            } else {
                $(this).val(obj[$(this).attr("data-f-id")]);
            }
        });
    }

    clone.insertAfter(".JS-fellow:last");
    setDatepickers();

    cloneValidation(clone);

    iFellowThree++;
    $("#hidAantal").val(iFellowThree + 1);
    berekenKosten();
}

$(document).on("click", ".btn-fellow-del", removeFellow);
function removeFellow() {
    var parent = $($(this).parents(".JS-fellow:not(.hidden)")[0]);
    var index = parent.index() - 2;
    parent.remove();

    AjaxRequest("POST", "/aanvragen.aspx/dFellow", { iFellow: index }, "", "json", function () {
        iFellowThree--;
        $("#hidAantal").val(iFellowThree + 1);
        berekenKosten();
    });
}

$(document).on("change", ".JS-fellow-cbAddress, .JS-fellow-cbDate", function () { showExtra(this); });
function showExtra(elem) {
    var c = ".JS-fellow-date";
    if ($(elem).hasClass("JS-fellow-cbAddress")) {
        c = ".JS-fellow-address";
    }

    var row = $(elem).parents(".JS-fellow").find(c);
    if ($(elem).is(":checked"))
        row.removeClass("hidden");
    else
        row.addClass("hidden");
}

function cloneValidation(clone) {
    clone.find("input").each(function () {
        $(this).attr("name", "ctl00$ContentPlaceHolder1$" + $(this).attr("data-f-id"));
    });

    clone.formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'fas fa-check',
            invalid: 'fas fa-times',
            validating: 'fas fa-sync'
        },
        fields: {
            ctl00$ContentPlaceHolder1$txtVertrekDatum: {
                trigger: 'blur',
                validators: {
                    date: {
                        format: 'DD-MM-YYYY',
                        message: 'Datum formaat klopt niet, 00 00 0000'
                    },
                    notEmpty: {
                        message: 'Datum is niet ingevuld.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtTerugkomDatum: {
                trigger: 'blur',
                validators: {
                    date: {
                        format: 'DD-MM-YYYY',
                        message: 'Datum formaat klopt niet, 00 00 0000'
                    },
                    notEmpty: {
                        message: 'Datum is niet ingevuld.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$ddlAanhef: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'U moet aanhef kiezen.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtVoornaam: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Uw naam is niet ingevuld.'
                    },
                    regexp: {
                        regexp: /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/,
                        message: 'Naam kan alleen bestaan uit letters.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtAchternaam: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Uw achternaam is niet ingevuld.'
                    },
                    regexp: {
                        regexp: /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/,
                        message: 'Achternaam kan alleen bestaan uit letters.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtGeboortedatum: {
                trigger: 'blur, change',
                validators: {
                    date: {
                        format: 'DD-MM-YYYY',
                        message: 'Datum format klopt niet, 00 00 0000'
                    },
                    notEmpty: {
                        message: 'Datum is niet ingevuld.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtGeborteplaats: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Uw geboorteplaats is niet ingevuld.'
                    },
                    regexp: {
                        regexp: /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/,
                        message: 'Geborteplaats kan alleen bestaan uit letters.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$ddlGeborteland: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'U moet uw geboorteland kiezen.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtBeroep: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Uw beroep is niet ingevuld.'
                    },
                    regexp: {
                        regexp: /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/,
                        message: 'Beroep kan alleen bestaan uit letters.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtTel: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Postcode is niet ingevuld.'
                    },
                    regexp: {
                        regexp: /^[0-9+]*$/,
                        message: "Een mobiele telefoonnummer mag alleen bestaan uit cijfers."
                    },
                    stringLength: {
                        min: 8,
                        message: 'Een mobiele telefoonnummer moet minimaal 8 cijfers hebben.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtPostcode: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Postcode is niet ingevuld.'
                    },
                    zipCode: {
                        country: 'NL',
                        message: 'De postcode is niet geldig'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtToev: {
                trigger: 'blur',
                validators: {
                    regexp: {
                        regexp: /^[a-z0-9]{0,8}$/,
                        message: 'U kunt niet meer dan 8 tekens gebruiken.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtStraat: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Straatnaam is niet ingevuld.'
                    },
                    regexp: {
                        regexp: /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/,
                        message: 'Straatnaam kan alleen bestaan uit letters.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtHouseNr: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Huisnummer is niet ingevuld.'
                    },
                    numeric: {
                        message: 'Huisnummer kan alleen bestaan uit cijfers.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtPlaats: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Woonplaats is niet ingevuld. '
                    },
                    regexp: {
                        regexp: /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/,
                        message: 'Woonplaats kan alleen bestaan uit letters.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$ddlLand: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'U moet een nationaliteit kiezen.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtPaspoortnummer: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Uw paspoortnummer is niet ingevuld.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$txtPaspoortLand: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'Uw uitgifteland is niet ingevuld.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$fuPassport: {
                validators: {
                    notEmpty: {
                        message: 'U dient een bestand te kiezen.'
                    },
                    file: {
                        extension: 'png,jpeg,jpg,pdf',
                        type: 'image/png,image/jpg,image/jpeg,application/pdf',
                        maxSize: 2097152,
                        message: 'U kunt alleen een png, jpeg, jpg of pdf bestand uploaden van maximaal 2MB.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$fuPaspoortFoto: {
                validators: {
                    notEmpty: {
                        message: 'U dient een bestand te kiezen.'
                    },
                    file: {
                        extension: 'png,jpeg,jpg,pdf',
                        type: 'image/png,image/jpg,image/jpeg,application/pdf',
                        maxSize: 2097152,
                        message: 'U kunt alleen een png, jpeg, jpg of pdf bestand uploaden van maximaal 2MB.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$fuVliegticket: {
                validators: {
                    file: {
                        extension: 'png,jpeg,jpg,pdf',
                        type: 'image/png,image/jpg,image/jpeg,application/pdf',
                        maxSize: 2097152,
                        message: 'U kunt alleen een png, jpeg, jpg of pdf bestand uploaden van maximaal 2MB.'
                    }
                }
            },
            ctl00$ContentPlaceHolder1$fuVerblijf: {
                validators: {
                    file: {
                        extension: 'png,jpeg,jpg,pdf',
                        type: 'image/png,image/jpg,image/jpeg,application/pdf',
                        maxSize: 2097152,
                        message: 'U kunt alleen een png, jpeg, jpg of pdf bestand uploaden van maximaal 2MB.'
                    }
                }
            }
        }
    });
}