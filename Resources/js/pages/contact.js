$(document).ready(function () {
    var icon = {
        url: "/Resources/img/marker.svg", // url
        scaledSize: new google.maps.Size(45, 45), // scaled size
        origin: new google.maps.Point(0, 0), // origin
        anchor: new google.maps.Point(0, 0) // anchor
    };
    var map,
        marker;
    function initialize() {
        var mapOptions = {
            center: new google.maps.LatLng(51.586742, 5.027752),
            zoom: 15,
            scrollwheel: false,
            disableDefaultUI: true,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles: [{ "featureType": "all", "elementType": "labels.text.fill", "stylers": [{ "saturation": 36 }, { "color": "#333333" }, { "lightness": 40 }] }, { "featureType": "all", "elementType": "labels.text.stroke", "stylers": [{ "visibility": "on" }, { "color": "#ffffff" }, { "lightness": 16 }] }, { "featureType": "all", "elementType": "labels.icon", "stylers": [{ "visibility": "off" }] }, { "featureType": "administrative", "elementType": "geometry.fill", "stylers": [{ "color": "#fefefe" }, { "lightness": 20 }] }, { "featureType": "administrative", "elementType": "geometry.stroke", "stylers": [{ "color": "#fefefe" }, { "lightness": 17 }, { "weight": 1.2 }] }, { "featureType": "landscape", "elementType": "geometry", "stylers": [{ "color": "#f5f5f5" }, { "lightness": 20 }] }, { "featureType": "poi", "elementType": "geometry", "stylers": [{ "color": "#f5f5f5" }, { "lightness": 21 }] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [{ "color": "#dedede" }, { "lightness": 21 }] }, { "featureType": "road.highway", "elementType": "geometry.fill", "stylers": [{ "color": "#ffffff" }, { "lightness": 17 }] }, { "featureType": "road.highway", "elementType": "geometry.stroke", "stylers": [{ "color": "#ffffff" }, { "lightness": 29 }, { "weight": 0.2 }] }, { "featureType": "road.arterial", "elementType": "geometry", "stylers": [{ "color": "#ffffff" }, { "lightness": 18 }] }, { "featureType": "road.local", "elementType": "geometry", "stylers": [{ "color": "#ffffff" }, { "lightness": 16 }] }, { "featureType": "transit", "elementType": "geometry", "stylers": [{ "color": "#f2f2f2" }, { "lightness": 19 }] }, { "featureType": "water", "elementType": "geometry", "stylers": [{ "color": "#e9e9e9" }, { "lightness": 17 }] }]
        };
        map = new google.maps.Map(document.getElementById("map"), mapOptions);
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(51.586742, 5.027752),
            icon: icon,
            map: map,
            url: "https://goo.gl/maps/2EYmhN17zM1PtiyX6"
        });

        google.maps.event.addListener(marker, 'click', function () {
            window.open(this.url, '_blank');
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);
    google.maps.event.addDomListener(window, "resize", function () {
        var center = map.getCenter();
        google.maps.event.trigger(map, "resize");
        map.setCenter(center);
    });
});

function isContactValid2() {
    var fv = $('.divGlobalForm').data('formValidation');
    var bOk = true;
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtName');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtEmail');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtBericht');
    fv.revalidateField('ctl00$ContentPlaceHolder1$cbPrivacy');
    fv.revalidateField('ctl00$ContentPlaceHolder1$txtPhone');

    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtName') === false) {
        bOk = false;
    }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$cbPrivacy') === false) {
        bOk = false;
    }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtEmail') === false) {
        bOk = false;
    }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtBericht') === false) {
        bOk = false;
    }
    if (fv.isValidField('ctl00$ContentPlaceHolder1$txtPhone') === false) {
        bOk = false;
    }
    var v = grecaptcha.getResponse();
    if (v.length === 0) {
        bOk = false;
        if (!$(".spanVal")[0]) {
            $("<span class='captcha-contact help-block'>Toon aan dat u geen robot bent</span>").insertAfter(".g-recaptcha");
        }
    }
    else {
        $(".spanVal").remove();
    }
    if (bOk) {
        __doPostBack('ctl00$ContentPlaceHolder1$btnSubmit1', '')
    } else {
        return false;
    }
}