//= require application
//= require autosize
//= require datepicker

$(".date").datepicker({
	format: "M dd, yyyy",
	autoclose: true,
	maxViewMode: 2,
	todayHighlight: true
});

$("#meter_image_logo").change(function () {
	var file = this.files[0];
	var reader = new FileReader();
	reader.addEventListener("load", function () {
		if (reader.result.length < 200000) {
			$("#meter-preview-logo").attr("src", reader.result).show();
			$("#meter-preview-name").hide();
		}
	}, false);
	if (file) {
		reader.readAsDataURL(file);
	} else {
		$("#meter-preview-logo").hide();
		$("#meter-preview-name").show();
	}
});

$("#meter_image_politician").change(function () {
	var file = this.files[0];
	var reader = new FileReader();
	reader.addEventListener("load", function () {
		if (reader.result.length < 200000) {
			$("#meter-preview-description").css("background-image", "url(" + reader.result + ")");
		}
	}, false);
	if (file) {
		reader.readAsDataURL(file);
	} else {
		$("#meter-preview-description").css("background-image", "");
	}
});

$("#meter_name").on("change keyup input paste cut", function () {
	$("#meter-preview-name").html($(this).val());
});

$("#meter_show_date").change(function () {
	if (this.checked) {
		$("#meter-preview-meter_date").show();
	} else {
		$("#meter-preview-meter_date").hide();
	}
});

$(".form-input[id^='meter_status']").on("change keyup input paste cut", function () {
	$("#meter-preview-" + $(this).attr("id")).html($(this).val());
});

$("#meter_description").on("change keyup input paste cut", function () {
	$("#meter-preview-description div").html($(this).val());
});

$("#meter_description_width").change(function () {
	$("#meter-preview-description div").css("width", $(this).val() + "%");
});

$("#meter_text_days").on("change keyup input paste cut", function () {
	$("#meter-preview-days").html($(this).val());
});

// Determine max number of characters for an input
function checkMax(element) {
	var length = element.val().length,
		max = parseInt(element.attr("maxlength"), 10),
		span = element.closest(".form-group").find("span.max");
	span.html("Max<br>" + length + " / " + max).css({
		"color": (length / max) === 1 ? "red" : (length / max) > 0.75 ? "darkorange" : "#bbb"
	});
}

$(".form-input[maxlength]").each(function () {
	checkMax($(this));
});

$(".form-input[maxlength]").on("change keyup input paste cut", function () {
	checkMax($(this));
});

$("textarea.max-kb").on("change", function () {
	var val_length = $(this).val().length;
	var max_span = $(this).closest(".form-group").find("span.max-kb");
	var max_length = parseInt(max_span.data("max"), 10);
	max_span.html((val_length / 1000).toFixed(1) + "kb / " + max_length / 1000 + "kb");
});

// Show what meter subdomain will look like based on chosen name
$("#meter_name").on("keyup input paste cut change", function () {
	$("#new_subdomain").show();
	$("#subdomain").html($(this).val().toLowerCase().replace(/[\u0250-\ue007\s]/g, "").replace(/[àáâäãåāăą]/g, "a").replace(/[çćĉč]/g, "c").replace(/[ð]/g, "d").replace(/[èéêëěēę]/g, "e").replace(/[ìíîïĩ]/g, "i").replace(/[ł]/g, "l").replace(/[ńñ]/g, "n").replace(/[òóôöõø]/g, "o").replace(/[ś]/g, "s").replace(/[ùúûüũ]/g, "u").replace(/[ŵ]/g, "w").replace(/[ýŷÿ]/g, "y").replace(/[źžż]/g, "z").replace(/[ß]/g, "ss"));
});

// Show relevant country or province flag
$("#meter_country").change(function () {
	var val = this.value;
	var code = val.substring(val.indexOf("[") + 1, val.indexOf("]"));
	var label = $("label[for='meter_province']");
	var optgroup1 = $("#meter_province optgroup:first-of-type");
	var optgroup2 = $("#meter_province optgroup:last-of-type");
	$("#country-flag").attr("src", "/images/flags-country/" + code + ".png");
	$("#meter_province").val($("#meter_province option:first").val()).change();
	var countries = ["ca", "us", "mx", "au", "gb", "fr", "be", "de", "ch", "es", "ar", "jp", "in", "eg", "za"];
	if (countries.indexOf(code) > -1) {
		$("#meter_province option").each(function () {
			if ($(this).val().indexOf("[" + code + "-") >= 0 || $(this).val() === "") {
				$(this).prop("disabled", false).show();
			} else {
				$(this).prop("disabled", true).hide();
			}
		});
		label.removeClass("disabled");
		$("#meter_province").prop("disabled", false);
		if (code === "ca") {
			label.html("Province / Territory");
			optgroup1.prop("label", "Province");
			optgroup2.prop("label", "Territory").show();
		} else if (code === "jp") {
			label.html("Prefecture");
			optgroup1.prop("label", "Prefecture");
			optgroup2.prop("label", "").hide();
		} else if (code === "gb") {
			label.html("Constituent Country / Territory");
			optgroup1.prop("label", "Constituent Country");
			optgroup2.prop("label", "Overseas Territory").show();
		} else if (code === "fr") {
			label.html("Région");
			optgroup1.prop("label", "Région de France métropolitaine");
			optgroup2.prop("label", "Région d'outre-mer").show();
		} else if (code === "be") {
			label.html("Province / Region");
			optgroup1.prop("label", "Province");
			optgroup2.prop("label", "Region").show();
		} else if (code === "de") {
			label.html("Bundesland");
			optgroup1.prop("label", "Flächenland");
			optgroup2.prop("label", "Stadtstaat").show();
		} else if (code === "ch") {
			label.html("Canton");
			optgroup1.prop("label", "Canton");
			optgroup2.prop("label", "").hide();
		} else if (code === "ar" || code === "es" || code === "mx") {
			label.html("State / Special District");
			optgroup1.prop("label", "State");
			optgroup2.prop("label", "Special District").show();
		} else if (code === "eg") {
			label.html("Governorate");
			optgroup1.prop("label", "Governorate");
			optgroup2.prop("label", "").hide();
		} else if (code === "za") {
			label.html("Province");
			optgroup1.prop("label", "Province");
			optgroup2.prop("label", "").hide();
		} else {
			label.html("State / Territory");
			optgroup1.prop("label", "State");
			optgroup2.prop("label", "Territory / Special District").show();
		}
	} else {
		label.html("Region").addClass("disabled");
		$("#meter_province").prop("disabled", true);
	}
});

$("#meter_province").change(function () {
	var val = $(this).val();
	var code = val.substring(val.indexOf("[") + 1, val.indexOf("]"));
	if (val) {
		$("#province-flag").attr("src", "/images/flags-province/" + code + ".png");
	} else {
		$("#province-flag").attr("src", "/images/flags-province/zz.png");
	}
});

if ($("#meter_country").val()) {
	var province = $("#meter_province").val();
	$("#meter_country").change();
	$("#meter_province").val(province).change();
}

// Add a new category
$("#add_category").click(function () {
	$("input[id^='meter_category']").each(function () {
		if (!$(this).is(":visible")) {
			var index = $(this).parent().index();
			$(this).parent().show();
			$(this).closest(".column").next(".column").find(".form-group").eq(index).show();

			//				var category_number = ($(this).attr("id").split("category")[1]);
			//				$("label[for$='_category" + category_number + "']").parent("div").show();
			$("#add_category").blur();
			//				if ($("input[id^='meter_category']:visible").length === $("input[id^='meter_category']").length) {
			//					$("#add_category").hide();
			//				}
			return false;
		}
	});
});