//= require application
//= require datatables

/* globals AmCharts */

$("#tablePromises").DataTable({
	dom: "<'#filter_container'fi>t",
	autoWidth: false,
	order: [[0, "asc"]],
	pageLength: -1
});

var tableData = $("#tableData").DataTable({
	dom: "t",
	ordering: false,
	pageLength: -1
});

var arrays = tableData.rows().data().toArray();

var categories = [],
	statuses = [];

$(".categories").each(function () {
	if ($(this).text()) {
		categories.push($(this).text());
	}
});
$(".statuses").each(function () {
	if ($(this).text()) {
		statuses.push($(this).text());
	}
});

function occurrences(string, subString, allowOverlapping) {
	string += "";
	subString += "";
	if (subString.length <= 0) return (string.length + 1);

	var n = 0,
		pos = 0,
		step = allowOverlapping ? 1 : subString.length;

	while (true) {
		pos = string.indexOf(subString, pos);
		if (pos >= 0) {
			++n;
			pos += step;
		} else break;
	}
	return n;
}

function drawChartTime(selectedCategory) {
	var columns = [],
		cat = selectedCategory === 0 ? "" : "c" + selectedCategory;
	for (var i = 0; i < arrays.length; i++) {
		columns.push({
			"month": arrays[i][0],
			"status1": occurrences(arrays[i][1], cat + "s1"),
			"status2": occurrences(arrays[i][1], cat + "s2"),
			"status3": occurrences(arrays[i][1], cat + "s3"),
			"status4": occurrences(arrays[i][1], cat + "s4")
		});
		if (arrays.length === 1) {
			columns.push({
				"month": arrays[i][0],
				"status1": occurrences(arrays[i][1], cat + "s1"),
				"status2": occurrences(arrays[i][1], cat + "s2"),
				"status3": occurrences(arrays[i][1], cat + "s3"),
				"status4": occurrences(arrays[i][1], cat + "s4")
			});
		}
	}

	AmCharts.makeChart("chart-time", {
		dataProvider: columns,
		type: "serial",
		marginLeft: 35,
		marginRight: 35,
		balloon: {
			fillAlpha: 1,
			fontSize: 14
		},
		legend: {
			equalWidths: false,
			position: "top",
			valueAlign: "left",
			valueWidth: 100,
			useMarkerColorForLabels: true,
			reversedOrder: true
		},
		valueAxes: [{
			gridAlpha: 0.07,
			ignoreAxisWidth: true,
			integersOnly: true,
			stackType: "regular"
			}],
		graphs: [{
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			lineColor: "#cd5c5c",
			title: statuses[3],
			valueField: "status4"
			}, {
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			lineColor: "#00c864",
			title: statuses[2],
			valueField: "status3"
			}, {
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			lineColor: "#ffa500",
			title: statuses[1],
			valueField: "status2"
			}, {
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			lineColor: "#808080",
			title: statuses[0],
			valueField: "status1",
			hidden: true
			}],
		chartScrollbar: {},
		chartCursor: {
			categoryBalloonDateFormat: "MMM YYYY",
			cursorAlpha: 0.1
		},
		dataDateFormat: "YYYY-MM",
		categoryField: "month",
		categoryAxis: {
			equalSpacing: true,
			startOnAxis: true,
			minPeriod: "MM",
			parseDates: true
		},
		export: {
			enabled: true
		}
	});
}

function drawChartCategory(selectedTime) {
	var columns = [],
		currentMonth = new Date().getMonth() + 1,
		offset = selectedTime === 0 ? 0 : 12 * selectedTime - 12 + currentMonth;

	for (var i = 0; i < categories.length; i++) {
		columns.push({
			category: categories[i],
			status1: occurrences(arrays[arrays.length - 1 - offset][1], "c" + (i + 1) + "s1"),
			status2: occurrences(arrays[arrays.length - 1 - offset][1], "c" + (i + 1) + "s2"),
			status3: occurrences(arrays[arrays.length - 1 - offset][1], "c" + (i + 1) + "s3"),
			status4: occurrences(arrays[arrays.length - 1 - offset][1], "c" + (i + 1) + "s4")
		});
	}

	AmCharts.makeChart("chart-category", {
		dataProvider: columns,
		type: "serial",
		marginLeft: 35,
		marginRight: 35,
		balloon: {
			fillAlpha: 1,
			fontSize: 14
		},
		legend: {
			equalWidths: false,
			position: "top",
			valueAlign: "left",
			valueWidth: 100,
			useMarkerColorForLabels: true,
			reversedOrder: true
		},
		valueAxes: [{
			gridAlpha: 0.07,
			ignoreAxisWidth: true,
			integersOnly: true,
			stackType: "regular"
			}],
		graphs: [{
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			labelText: "[[value]]",
			lineColor: "#cd5c5c",
			title: statuses[3],
			type: "column",
			valueField: "status4"
			}, {
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			labelText: "[[value]]",
			lineColor: "#00c864",
			title: statuses[2],
			type: "column",
			valueField: "status3"
			}, {
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			labelText: "[[value]]",
			lineColor: "#ffa500",
			title: statuses[1],
			type: "column",
			valueField: "status2"
			}, {
			balloonText: "[[title]]: <b>[[value]]</b>",
			fillAlphas: 0.5,
			labelText: "[[value]]",
			lineColor: "#808080",
			title: statuses[0],
			type: "column",
			valueField: "status1"
			}],
		categoryField: "category",
		categoryAxis: {
			gridPosition: "start",
			gridAlpha: 0
		},
		export: {
			enabled: true
		}
	});
}

drawChartTime(0);
drawChartCategory(0);

$("input[name='tab-chart-time']").change(function () {
	var n = parseInt(this.value, 10);
	drawChartTime(n);
});

$("input[name='tab-chart-category']").change(function () {
	var n = parseInt(this.value, 10);
	drawChartCategory(n);
});