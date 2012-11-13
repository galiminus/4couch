function getPlaces(callback) {
    console.log("hello");
    $.get("/places.json", function(places) {
	callback(places);
    });
};
