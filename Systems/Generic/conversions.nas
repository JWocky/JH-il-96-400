# genric conversion of units
# Pete Brendt aka JWocky
#


var autoconverts=func() {

	var tanks_base = props.globals.getNode("/consumables/fuel");

	if (tanks_base != nil) {
		var tanks = tanks_base.getChildren("tank");
	} else {
		var tanks = [];
	}

	for (var i=0; i<size(tanks); i+=1) {
		var t = tanks[i];
		var tname = t.getNode("name", 1).getValue();
		if (tname!=nil) {
			var content_lbs=t.getNode("level-lbs", 1).getValue();
			var density=t.getNode("density-ppg", 1).getValue();
			var content_gal=content_lbs/density;
			setprop("/consumables/fuel/tank["~i~"]/level-gal_us", content_gal);
		}
	}

    settimer(autoconverts, 1);
}

    settimer(autoconverts, 2);



