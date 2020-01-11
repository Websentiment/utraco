function initStepTwo() {
    validationStepTwo();
    $(".loading").hide();
}

function scrollTop() {
    $('html,body').animate({
        scrollTop: $("body").offset().top
    }, 1000);
    return false;
}

$(document).on("click", ".btn-step[data-step='2']", function () {

    event.preventDefault();
    var fv = $(".JS-step[data-step='2']").data('formValidation');
    if (!fv.validate().$invalidFields.length) {
        scrollTop();
        saveStepTwo();
    }
});

$(".file-input input").change(function () {
    $(this).parent().find("label").text(this.files[0].name);
});

function saveStepTwo() {
    $(".loading").show();

    var data = getFormData([$(".JS-step[data-step='1']"), $(".JS-step[data-step='2']")]);
    data.ddlVisums = $("#hidVisum").val();
    data.ddlServices = $("#hidService").val();

    AjaxRequest("POST", "/aanvragen.aspx/sStepTwo", { data: data }, "", "json", function () {
        if (sMsg.d !== "") {
            var r = JSON.parse(sMsg.d);

            if (r.msg === "200") {
                // Files uploaden one by one
                var filesInput = $(".JS-step[data-step='2'] .JS-file");
                uploadFiles(r.iPersID, filesInput, function () {
                    changeStep(3);
                    $(".loading").hide();
                });
            } else if (r.msg === "500") {
                showAlert("Er is iets fouts gegaan. Proebeer nog een keer");
                $(".loading").hide();
            } else if (r.msg === "step1") {
                changeStep(1);
                $(".loading").hide();
            } else if (r.msg === "refresh") {
                window.location.reload(true);
            }
        }
    });
}

function validationStepTwo() {
    $(".JS-step[data-step='2']").formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'fas fa-check',
            invalid: 'fas fa-times',
            validating: 'fas fa-sync'
        },
        fields: {
            ctl00$ContentPlaceHolder1$txtVertrekDatum: {
                trigger: 'blur, change',
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
                trigger: 'blur, change',
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
            ctl00$ContentPlaceHolder1$txtBedrijfsnaam: {
                trigger: 'blur',
                validators: {
                    regexp: {
                        regexp: /^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/,
                        message: 'Naam kan alleen bestaan uit letters.'
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
            ctl00$ContentPlaceHolder1$fuVerblijf: {
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
            ctl00$ContentPlaceHolder1$fuUitnodiging: {
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
            }
        }
    });
}