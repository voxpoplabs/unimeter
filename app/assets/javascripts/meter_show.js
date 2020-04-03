//= require application
//= require autosize
//= require datepicker

//function smoothscroll(t, a) {
//	t.click(function () {
//		if (location.pathname.replace(/^\//, "") === this.pathname.replace(/^\//, "") && location.hostname === this.hostname) {
//			var t = $(this.hash);
//			if (t = t.length ? t : $("[name=" + this.hash.slice(1) + "]"), t.length) return $("html, body").animate({
//				scrollTop: t.offset().top - (40)
//			}, a ? a : 500), !1;
//		}
//	});
//}

// Add subcategories to the main promises table
var subcategories = [];
$("td[data-category]").each(function () {
	var category = $(this).data("category"),
		text = $(this).text().trim().toLowerCase();
	if ($.inArray(text, subcategories) === -1) {
		subcategories.push(text);
		$(this).parent("tr").before(
			"<tr class='np subcategory category" + category + "'> \
				<td></td> \
				<td class='hide'></td> \
				<td class='hide'></td> \
				<td colspan='2'>" + text + "</td> \
			</tr>");
	}
});

autosize($(".autosize"));

$("#meter-summary div[data-search]").click(function () {
	$("#search-input").val($(this).data("search")).change();
});

//smoothscroll($("#meter-summary>a"));

// Search the promises table using text input
$("#search-input").on("keyup search input paste cut change", function () {
	if (this.value) {
		var filter = this.value.replace(/[()]/g, "");
		var count = 0;
		$("tbody tr").each(function () {
			if ($(this).text().replace(/[()]/g, "").search(new RegExp(filter, "i")) >= 0 && $(this).hasClass("pr")) {
				$(this).show();
				count++;
			} else {
				$(this).hide();
			}
		});
		$("#search-count").html(count === 1 ? "1 match" : count + " matches");
		$("#search-banner").html("Search for '" + this.value + "'");
		$("input[name='tab-group']").prop("disabled", true);
		$("label[for^='tab-']").hide();
	} else {
		$("tbody tr").each(function () {
			$(this).removeAttr("style");
		});
		$("#search-count, #search-banner").empty();
		$("input[name='tab-group']").prop("disabled", false);
		$("label[for^='tab-']").show();
	}
});

// Reset the search input
$("#search-clear").click(function () {
	$("#search-input").val("").change();
});

// Toggle the tweets timeline
$("#toggleTweets button").click(function () {
	$(this).toggleClass("toggled");
	if ($(this).hasClass("toggled")) {
		$("#meter-description-content").fadeOut(200);
		$("#meter-description-tweets").fadeIn(200);
	} else {
		$("#meter-description-tweets").fadeOut(200);
		$("#meter-description-content").fadeIn(200);
	}
});