$(document).ready(function() {

    jQuery('#newGameBtn').click(function(){
        var error = false;
        var errorMessage = "<b>Favor de corregir los siguientes errores:</b><br/><br/><ul>";
        if(jQuery('#dropGame option:selected').val() == '') {
             error = true;
             errorMessage = errorMessage + '<li style="text-align:left; margin-left: 50px;">Favor de elegir el juego</li>';
        }
        if(jQuery('#dropTeams option:selected').val() == '') {
             error = true;
             errorMessage = errorMessage + '<li style="text-align:left; margin-left: 50px;">Favor de elegir cuantos jugadores</li>';
        } else {
            var selectedPlayers = jQuery('#dropTeams option:selected').val()
            for(var i = 1; i<= selectedPlayers; i++) {
                if(jQuery("#team-input-" + i).val() == ''){
                    error = true;
                    errorMessage = errorMessage + '<li style="text-align:left; margin-left: 50px;">Favor de llenar el nombre del jugador '+ i +'.</li>';
                }
            }
        }
        if(error){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                html: errorMessage + '</ul>'
            });
            return false;
        } else {
            $("#newGameForm").submit();
            return true;
        }

    });

    jQuery('#dropGame').change(function(){
        jQuery("#gameId").val(this.value);
    });

    jQuery('#dropTeams').change(function(){
        jQuery("#numTeams").val(this.value);
    });

    hideTeamInputs();

    jQuery("#dropTeams").change(function(){
        var index;
        if(this.value == 'none') {
            index = 0;
        } else {
            index = this.value;
        }
        hideTeamInputs();
        for(let i = 1; i <= index; i++) {
            jQuery("#team-" + i).show();
        }
    });

});

function hideTeamInputs(){
    for(let i = 1; i <= 6; i++) {
        jQuery("#team-" + i).hide();
    }
}