$(document).ready(function() {
    if(jQuery("#continueGameId").val() == '') {
        jQuery("#continueBtn").prop("disabled", true);
    }

    jQuery("#newGameBtn").click(function(){
        if(jQuery("#boards").val() == '0'){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'No hay tableros configurados'
            });
        } else {
            Swal.fire({
                title: '¿Estas seguro?',
                text: "¡No podras revertir esta accion!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si',
                background: '#fff',
            }).then((result) => {
                if (result.value) {
                    console.log('Confirmed');
                    $("#newGameForm").submit();
                    return true;
                } else {
                    console.log('Declined');
                    return false;
                }
            });
        }

    });

});
