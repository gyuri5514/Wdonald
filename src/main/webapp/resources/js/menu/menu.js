var pricelistdesc = function(url) {
	
	$.ajax({
		type: 'get',
		url: "../PricelistDesc",
		data: "",
		contentType: "application/x-www-form-rulencoded; charset=UTF-8",
		success: function(data) {
			$('#product_list').html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};