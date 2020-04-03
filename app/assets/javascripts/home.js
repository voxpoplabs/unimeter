//= require application
//= require datatables
//= require easyautocomplete
//= require jvectormap

var options = {
	getValue: "name",
	url: function (phrase) {
		return "/autocomplete.json?q=" + phrase;
	},
	categories: [{
			listLocation: "meters",
			header: "<b>Meters</b>"
		},
//				 {
//			listLocation: "politicians",
//			header: "<b>Politicians</b>"
//		}
	],
	list: {
		onChooseEvent: function () {
			document.location.href = "http://" + $("#search-meters").getSelectedItemData().subdomain + ".lvh.me:3000";
		}
	},
	template: {
		type: "custom",
		method: function (value, item) {
			return value + " - " + item.country;
		}
	}
};

$("#search-meters-input").easyAutocomplete(options);

$("#search-meters-input").on("change input", function () {
	if (this.value) {
		$(this).closest(".easy-autocomplete").addClass("valid");
	} else {
		$(this).closest(".easy-autocomplete").removeClass("valid");
	}
});

function objectify(array) {
	return array.reduce(function (accumulator, currentValue) {
		accumulator[currentValue[0]] = currentValue[1];
		return accumulator;
	}, {});
}

var array = [];

for (var i = 0; i < $("#countries-body tbody tr").length; i++) {
	var row = $("#countries-body tbody tr").eq(i);
	array.push([row.find("td:first-child").text(), parseInt(row.find("td:last-child").text(), 10)]);
}

var countries = objectify(array);

$("#map").vectorMap({
	map: "world_mill",
	series: {
		regions: [{
			values: countries,
			scale: ["#3399ff", "#004c99"]
      }]
	},
	backgroundColor: "white",
	regionStyle: {
		initial: {
			"fill": "silver",
			"fill-opacity": 1,
			"stroke": "none",
			"stroke-width": 0,
			"stroke-opacity": 1
		},
		hover: {
			"fill-opacity": 0.8,
			"cursor": "pointer"
		},
		selected: {
			"fill": "yellow"
		},
		selectedHover: {}
	},
	zoomOnScroll: false,
	onRegionClick: function (event, code) {
		if (countries[code]) {
			window.location.href = "/search?q=[" + code.toLowerCase() + "]";
		}
	},
	onRegionTipShow: function (event, element, code) {
		element.html(element.html() + " | " + (countries[code] === undefined ? "No polimeter yet" : countries[code] === 1 ? "1 polimeter" : countries[code] + " polimeters"));
	}
});

$("#countries-header").DataTable({
	dom: "t",
	autoWidth: false,
	columnDefs: [{
		targets: 0,
		orderable: false
	}],
	order: [[2, "desc"]]
});

var tableCountries = $("#countries-body").DataTable({
	dom: "t",
	autoWidth: false,
	columnDefs: [{
		targets: 0,
		orderable: false
	}],
	order: [[2, "desc"]],
	pageLength: -1
});

$("#countries-header th").click(function () {
	tableCountries.order([$(this).index(), $(this).hasClass("sorting_asc") ? "asc" : "desc"]).draw();
});