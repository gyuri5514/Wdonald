$('#order_detail').click(function order_detail_show() {
	if ($("#order_detail_table").css("display") == "none") {
		$("#order_detail_table").show();
	} else {
		$("#order_detail_table").hide();
	}
})