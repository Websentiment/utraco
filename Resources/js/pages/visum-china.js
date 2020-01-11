$(document).ready(function () {
    if ($(".JS-visumchina").length > 0) {
        load();
    }
});

function load() {
    var fv = $(".JS-visumchina").formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'fas fa-check',
            invalid: 'fas fa-times',
            validating: 'fas fa-sync'
        },
        fields: {
            ctl00$ContentPlaceHolder1$ddlNat: {
                trigger: 'blur',
                validators: {
                    notEmpty: {
                        message: 'U moet een nationaliteit kiezen.'
                    }
                }
            }
        }
    });

    $(".JS-visum").on("click", function () {
        var fv = $(".JS-visumchina").data('formValidation');
        if (!fv.validate().$invalidFields.length) {
            $("#hidReden").val($(this).data("reden"));
            __doPostBack('ctl00$ContentPlaceHolder1$btnSend', '');
        }
    });
}