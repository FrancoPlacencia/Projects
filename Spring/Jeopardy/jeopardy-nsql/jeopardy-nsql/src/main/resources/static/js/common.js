function showResult(result, message) {
    Swal.fire({
        position: 'center',
        icon: result,
        title: message,
        showConfirmButton: false,
        timer: 2000
    });
}