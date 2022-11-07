$(document).ready(function() {
    jQuery('#questionBtn').click(function(){
        event.preventDefault();
        var error = false;
        var errorMessage = "";
        var errors = [];
        if(jQuery('#questionContent').val() == ''){
            error = true;
            errors.push("Favor de llenar la pregunta");
        }
        if(jQuery('#option1').val() == ''){
            error = true;
            errors.push("Favor de llenar la opción 1");
        }
        if(jQuery('#option2').val() == ''){
            error = true;
            errors.push("Favor de llenar la opción 2");
        }
        if(jQuery('#option3').val() == ''){
            error = true;
            errors.push("Favor de llenar la opción 3");
        }
        if(jQuery('#options').val() == ''){
            error = true;
            errors.push("Favor de seleccionar la respuesta");
        }

        if(jQuery('#dropCategory option:selected').val() == '0'){
            error = true;
            errors.push("Favor de seleccionar la categoría");
        }
        console.log(error);
        if(error) {
            errorMessage = errorMessage.concat('<b>Favor de corregir los siguientes errores:</b><br/><br/><ul>');
            errors.forEach(function(value){
                errorMessage = errorMessage.concat('<li style="text-align:left; margin-left: 50px;">');
                errorMessage = errorMessage.concat(value);
                errorMessage = errorMessage.concat('</li>')
            });
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                html: errorMessage
            });
            return false;
        } else {
            $("#questionForm").submit();
            return true;
        }
    });

    jQuery('#dropCategory').change(function(){
        jQuery("#categoryId").val(this.value);
    });

    if(jQuery("#categoryId").val() != ''){
        jQuery('#dropCategory option:eq(' + jQuery("#categoryId").val() + ')').prop('selected', true);
    }
});

function editQuestion(questionId,boardId){
    $("#getQuestionId").val(questionId);
    $("#getBoardId").val(boardId);
    $("#getQuestionForm").submit();
}

function deleteQuestion(questionId,boardId){
    Swal.fire({
        title: '¿Estas seguro?',
        text: "¡No podrás revertir esta acción!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.value) {
            console.log('Confirmed');
            $("#deleteQuestionId").val(questionId);
            $("#deleteBoardId").val(boardId);
            $("#deleteQuestionForm").submit();
            return true;
        } else {
            console.log('Declined');
            return false;
        }
    });
}

