define([
    'knockout',
    'async!https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false'
],function(ko){

    var googleAutoCompleteService = new google.maps.places.AutocompleteService();
    var geoCoder = new google.maps.Geocoder();

    return{
        googleAutoCompleteService: googleAutoCompleteService,
        geoCoder: geoCoder
    };
});