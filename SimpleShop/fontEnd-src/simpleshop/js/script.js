$(function(){
	$(".close").click(function(){
		$(".alert-div").css("display","none");
	});

// 添加书本到购物车
	$(".add-btn").click(function(){
		var isbn = $(this).data("book-isbn");
		$.ajax({
		 	url: "",
		 	type: "GET",
		 	dataType:"json",
		 	data: {
		 		isbn: isbn,
		 		action: "add"
		 	},
			success: function(result){
		      	$('#addAlert-content').text(result.message);
		      	$('#addAlert').modal('show');
		    },
		    error: function(result){
		    	$('#addAlert-content').text(result.message);
		      	$('#addAlert').modal('show');
		    }
		});
	});
	
	$(".delete").click(function(){
		var isbn = $(this).data("book-isbn");
		var cost = $(this).data("cost");
		var $tr = $(this).closest("tr");
		$.ajax({
		 	url: "",
		 	type: "GET",
		 	dataType:"json",
		 	data: {
		 		isbn: isbn,
		 		action: "delete"
		 	},
			success: function(result){
		      	$('#deleteAlert-content').text(result.message);
		      	$('#deleteAlert').modal('show');
		      	if(result.err == "success"){
		      		$tr.fadeOut();
		      		$(".amount-cost").text(($(".amount-cost").text() - cost).toFixed(2));
		      	}
		    },
		    error: function(result){
		    	$('#deleteAlert-content').text(result.message);
		      	$('#deleteAlert').modal('show');
		    }
		});
	});
});