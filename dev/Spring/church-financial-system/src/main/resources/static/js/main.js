jQuery('#gameSelectBtn').click(function(){
	var option = $("#dropGame option:selected").val();
	console.log(option);
	if(option == "none") {
		alert("Favor de seleccionar un juego");
		return false;
	} else {
		$("#gameId").val(option);
		$("#edit").submit();
		return true;
	}
	
});