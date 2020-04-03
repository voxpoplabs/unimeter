//= require jquery
//= require jquery_ujs
//= require jquery.ui.widget.min
//= require fileupload.min
//= require autosize
//= require datepicker

window.onscroll = function () {
	if (document.documentElement.scrollTop || document.body.scrollTop) {
		$("header.landing").addClass("solid");
	} else {
		$("header.landing").removeClass("solid");
	}
};

$(document).click(function (event) {
	if ($(".active").length) {
		if (!$(event.target).closest(".dropdown").length) {
			$(".dropdown").removeClass("active");
		}
	}
});

$(".dropdown-title").click(function () {
	$(".dropdown.active").not($(this).parent()).removeClass("active");
	$(this).parent().toggleClass("active");
});

$("[data-action='see-logs']").click(function() {
	if ($(".log").length) {
		$(this).toggleClass("expanded");
		$("#promise-logs").slideToggle(200);
	}
});

///////////// ADJUST FORM ELEMENTS ONCE AT PAGE LOAD /////////////

// Adjust visibility of categories
$(".promise_categories input[id^='meter_category']").each(function () {
	var category_number = ($(this).attr("id").split("category")[1]);
	if (!$(this).val() && category_number != 1) {
		$("label[for$='_category" + category_number + "']").parent(".form-group").hide();
		$("#add_category").show();
	}
});

// Adjust which category icons are shown
$("select[id^='meter_icon_category']").each(function () {
	if ($(this).val()) {
		$(this).prev("i").removeClass().addClass("fa fa-" + $(this).val() + " fa-fw");
	}
});

// Adjust visiblity of bilingual meter options
$("#meter_bilingual").each(function () {
	if (this.checked) {
		$(this).parents(".form-group").removeClass("unchecked");
		$("#meter_b_language, #meter_b_status1, #meter_b_status2, #meter_b_status3, #meter_b_status4, #meter_b_category1").prop("required", true);
	} else {
		$(this).parents(".form-group").addClass("unchecked");
		$("#meter_b_language, #meter_b_status1, #meter_b_status2, #meter_b_status3, #meter_b_status4, #meter_b_category1").prop("required", false);
	}
});

// Toggle bilingual meter options
$("#meter_bilingual").change(function () {
	if (this.checked) {
		$(this).parents(".form-group").removeClass("unchecked");
		$("#meter_b_language, #meter_b_status1, #meter_b_status2, #meter_b_status3, #meter_b_status4, #meter_b_category1").prop("required", true);
	} else {
		$(this).parents(".form-group").addClass("unchecked");
		$("#meter_b_language, #meter_b_status1, #meter_b_status2, #meter_b_status3, #meter_b_status4, #meter_b_category1").prop("required", false);
	}
});

///////////// EVENT LISTENERS FOR METER NAVIGATION /////////////

// Filter promises based on their status

///////////// EVENT LISTENERS FOR FORMS /////////////

// Modal and loading effects
$("body").on("click", ".edit.btn", function () {
	$(this).addClass("loading");
});

$(".modal").on("click", ".close-modal", function () {
	$(document).trigger("close-modal");
});

$(".modal").on("submit", "form", function () {
	$(this).find("[type='submit']").addClass("loading");
});

// Show relevant category icon
$("select[id^='meter_icon_category']").change(function () {
	$(this).prev("i").removeClass().addClass("fa fa-" + $(this).val() + " fa-fw");
});

///////////// TRIGGERS /////////////

$(document).on("open-modal", function () {
	$(".modal").addClass("active").find(".focus").focus();
	$(".edit.btn").removeClass("loading");
});

$(document).on("close-modal", function () {
	$(".modal").removeClass("active");
});

//Client Side Image Upload to S3
$(".file-upload").each(function (i, elem) {
	var maxFileSize = $(this).data("max");
	var fileInput = $(elem);
	var form = $(fileInput.parents("form:first"));
	var submitButton = form.find("input[type='submit']");
	var progressBar = $("<div class='bar pl-5'></div>");
	var barContainer = $("<div class='file-upload-progress mt-5'></div>").append(progressBar);
	fileInput.after(barContainer);

	fileInput.fileupload({
		fileInput: fileInput,
		url: form.data("url"),
		type: "POST",
		autoUpload: true,
		formData: form.data("form-data"),
		maxFileSize: maxFileSize,
		paramName: "file",
		dataType: "XML",
		replaceFileInput: false,
		progressall: function (e, data) {
			var progress = parseInt(data.loaded / data.total * 100, 10);
			progressBar.css("width", progress + "%");
		},
		start: function () {
			submitButton.prop("disabled", true);

			progressBar.
			css("background-color", "forestgreen").
			css("display", "block").
			css("width", "0%").
			text("Working...");
		},
		done: function (e, data) {
			submitButton.prop("disabled", false);
			progressBar.text("Uploading complete. You're good to go!");

			// extract key and generate URL from response
			var key = $(data.jqXHR.responseXML).find("Key").text();
			var url = '//' + form.data('host') + '/' + key;

			// create hidden field
			var input = $("<input />", {
				type: "hidden",
				name: fileInput.attr("name"),
				value: url
			});
			form.append(input);

		},
		fail: function () {
			submitButton.prop("disabled", false);

			progressBar.
			css("background", "red").
			text("Failed");
		}
	}).on("fileuploadprocessalways", function (e, data) {
		$(this).next(".message").remove();
		var currentFile = data.files[data.index];
		if (data.files.error && currentFile.error) {
			var message = currentFile.error === 3 ? "This file is too large. Please upload a file that is smaller than " + (maxFileSize / 1000) + " kb." : "This file is too small.";
			$(this).parent().find(".message").html(message);
		} else {
			$(this).parent().find(".message").empty();
		}
	});
});