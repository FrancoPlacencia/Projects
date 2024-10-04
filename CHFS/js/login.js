
$("#login-btn").on( "click", login());


function login(){
    let email = jQuery("#email").val()
    let password = jQuery("#password").val()
    let loginRequestDTO = {
        "email": email,
        "password": password
    };
    console.log("email: %s password: %s", email, password);
    jQuery.ajax({
        type: "POST",
        url: "http:localhost:8081/auth/login",
        data: loginRequestDTO, 
        success: function(data, status){
            console.log("LOGIN SUCCESS")
            console.log("data: %s", data);
            console.log("status: %s", status);
        },
        error: function(data,status) {
            console.log("LOGIN SUCCESS")
            console.log("data: %s", data);
            console.log("status: %s", status);
        }
    });
}