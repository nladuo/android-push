$(document).ready(function(){
	$("#send_btn").click(function(){
		$.ajax({ 
			url: "/api/broadcast", 
			type: "POST",
			data: {  
				content : $("#content").val(),  
     		},
			success: function(data){
        		alert(data.msg);
      		}
      	});

	});
});