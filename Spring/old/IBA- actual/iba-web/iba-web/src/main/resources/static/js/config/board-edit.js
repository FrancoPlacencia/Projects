$(document).ready(function() {
    getAllQuestions();

    jQuery('#saveQuestionBtn').click(function(){
        var error = false;
        var errorMessage = "<b>Favor de corregir los siguientes errores:</b><br/><br/><ul>";
        if(jQuery('#questionContent').val() == ''){
            error = true;
            errorMessage = errorMessage + '<li style="text-align:left; margin-left: 50px;">Favor de llenar la pregunta</li>';
        }
        if(jQuery('#answer').val() == ''){
            error = true;
            errorMessage = errorMessage + '<li style="text-align:left; margin-left: 50px;">Favor de llenar la respuesta</li>';
        }

        if(jQuery('#dropCategory option:selected').val() == 'none'){
            error = true;
            errorMessage = errorMessage + '<li style="text-align:left; margin-left: 50px;">Favor de elegir una categoria</li>';
        }
        if(error) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                html: errorMessage
            });
            return false;
        } else {
            $("#saveQuestionForm").submit();
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
    jQuery('#editQuestionForm input[name="questionId"]').val(questionId);
    jQuery('#editQuestionForm input[name="boardId"]').val(boardId);
    $("#editQuestionForm").submit();
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
            var question = {
                questionId : questionId,
                boardId : boardId
            };
            jQuery.ajax({
                type: "DELETE",
                contentType: "application/json",
                url: '/api/questions',
                data: JSON.stringify(question),
                dataType: 'json',
                success: function (data) {
                    showResult('success','Pregunta eliminada');
                    getAllQuestions();
                },
                error: function (e) {
                    showResult('error', '¡ERROR al eliminar la pregunta!');
                }
            });
            return true;
        } else {
            return false;
        }
    });
}

function getAllQuestions(){
    var question = {
        boardId : jQuery("#boardId").val(),
        answer: ""
    };
    jQuery.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/api/questions",
        data: question,
        dataType: 'json',
        success: function (data) {
            jQuery('#questionsTable tbody').empty();
            data.forEach(function(data, index){
                var rowData = "";
                rowData = rowData.concat('<tr><td style="text-align: center;">' + data.categoryDesc + '</td>');
                rowData = rowData.concat('<td>' + data.questionContent + '</td>');
                rowData = rowData.concat('<td style="text-align: left;"><ol>');
                rowData = rowData.concat('<li>' + data.option1 + '</li>');
                rowData = rowData.concat('<li>' + data.option2  + '</li>');
                rowData = rowData.concat('<li>' + data.option3 + '</li>');
                rowData = rowData.concat('</ol></td>');
                rowData = rowData.concat('<td style="text-align: center;"><i>Opción ' + data.answer + '</i><br/><b>' + data.fullAnswer + '</b></td>');
                rowData = rowData.concat('<td style="text-align: center;">');
                rowData = rowData.concat('<div class="btn-group" role="group">');
                rowData = rowData.concat('<button name="editQuestionBtn" type="button" class="btn btn-primary" ');
                rowData = rowData.concat('onclick="editQuestion(' + data.questionId + ',' + data.boardId + ');">');
                rowData = rowData.concat('<i class="fas fa-edit"></i></button>');
                rowData = rowData.concat('<button name="deleteQuestionBtn" type="button" class="btn btn-danger" ');
                rowData = rowData.concat('onclick="deleteQuestion(' + data.questionId + ',' + data.boardId + ')">');
                rowData = rowData.concat('<i class="fa-solid fa-trash-can"></i></button>');
                rowData = rowData.concat('</div></td></tr>');
                jQuery('#questionsTable tbody').append(rowData);
            });
        },
        error: function (e) {
            showResult('error', '¡ERROR al obtener las preguntas!');
        }
    });
}