jQuery(document).ready(function() {

    jQuery("#boardForm").submit(function (event) {
        event.preventDefault();
        if(jQuery('#boardDescription').val() == '') {
            showResult('error','Oops...','Favor de ingresar el nombre del tablero.');
        } else {
            editBoard();
        }
    });

    // load default page
    getAllBoards();

});

function loadBoard(boardId, boardDescription) {
    jQuery('#boardId').val(boardId);
    jQuery('#boardDescription').val(boardDescription);
}

function editBoard(){
    if(jQuery('#boardId').val() == 0){
        postBoard();
    } else {
        patchBoard();
    }
}

function postBoard(){
    var board = {
        boardDescription : jQuery('#boardDescription').val()
    };
    jQuery.ajax({
        type: "POST",
        contentType: "application/json",
        url: 'api/boards',
        data: JSON.stringify(board),
        dataType: 'json',
        success: function (data) {
            clearBoard();
            getAllBoards();
            showResult('success','Tablero creado','');

        },
        error: function (e) {
            showResult('error','¡ERROR al crear el tablero!','');
        }
    });
}

function getAllBoards(){
    jQuery.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/api/boards",
        data: '',
        dataType: 'json',
        success: function (data) {
            jQuery('#gamesTable tbody').empty();
            data.forEach(function(data, index){
                jQuery('#gamesTable tbody').append(
'<tr>' +
    '<td style="text-align: center;">' + data.boardId + '</td>' +
    '<td>' + data.boardDescription + '</td>' +
    '<td style="text-align: center;">' +
    '<div class="btn-group" role="group" aria-label="Basic example">' +
        '<button type="button" class="btn btn-primary" ' +
            'onclick="loadBoard(' + data.boardId + ',\'' + data.boardDescription + '\')">' +
            '<i class="fas fa-edit"></i></button>' +
        '<button type="button" class="btn btn-light" ' +
            'onclick="configBoard(' + data.boardId + ')">' +
            '<i class="fa-solid fa-gear"></i></button>' +
        '<button type="button" class="btn btn-danger" ' +
            'onclick="deleteBoard(' + data.boardId + ')">' +
            '<i class="fa-solid fa-trash-can"></i></button>'+
    '</div>' +
    '</td>'+
'</tr>');
            });
        },
        error: function (e) {
            showResult('error','¡ERROR al obtener los tableros!','');
        }
    });
}

function getSingleBoard(){
    // TODO
}

function patchBoard(){
    var board = {
        boardId: jQuery('#boardId').val(),
        boardDescription : jQuery('#boardDescription').val()
    };
    jQuery.ajax({
        type: "PATCH",
        contentType: "application/json",
        url: 'api/boards',
        data: JSON.stringify(board),
        dataType: 'json',
        success: function (data) {
            clearBoard()
            getAllBoards();
            showResult('success','Tablero actualizado','');
        },
        error: function (e) {
            showResult('error','¡ERROR al actualizar el tablero!','');
        }
    });
}

function deleteBoard(boardId){
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
            var board = {
                boardId : boardId
            };
            jQuery.ajax({
                type: "DELETE",
                contentType: "application/json",
                url: 'api/boards',
                data: JSON.stringify(board),
                dataType: 'json',
                success: function (data) {
                    showResult('success','Tablero eliminado','');
                    getAllBoards();
                },
                error: function (e) {
                    showResult('error','¡ERROR al eliminar el tablero!','');
                }
            });
            return true;
        } else {
            return false;
        }
    });
}

function configBoard(boardId){
    jQuery("#editBoardId").val(boardId);
    jQuery("#configBoardForm").submit();
}

function clearBoard(){
    jQuery('#boardId').val(0);
    jQuery('#boardDescription').val('');
}