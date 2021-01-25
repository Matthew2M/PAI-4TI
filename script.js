function validateForm(){
    var errors = [];
    var firstname = document.getElementById("firstname").value;
    var lastname = document.getElementById("lastname").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var confirmpassword = document.getElementById("confirmpassword").value;
    var checkbox = document.getElementById("checkbox").checked;
    var regexp1 = new RegExp('[A-ZŻŹĆĄŚĘŁÓŃ]');
    var regexp2 = new RegExp('[0-9]');
    var regexp3 = /\S+@\S+\.\S+/;
    if(firstname.length < 3) {
        var error1 = document.getElementById("firstname").style.border = "1px solid red";
        errors.push("Zbyt krótkie imię");
    }
    else {
        var error1 = document.getElementById("firstname").style.border = "1px solid darkgrey";
    }

    if(firstname === lastname) {
        var error1 = document.getElementById("firstname").style.border = "1px solid red";
        var error2 = document.getElementById("lastname").style.border = "1px solid red";
        errors.push("Imię i nazwisko nie mogą być takie same");
    }
    else if(firstname != lastname){
        var error1 = document.getElementById("firstname").style.border = "1px solid darkgrey";
        var error2 = document.getElementById("lastname").style.border = "1px solid darkgrey";
    }

    if(email.match(regexp3)) {
        var error3 = document.getElementById("email").style.border = "1px solid darkgrey";
    }
    else {
        var error3 = document.getElementById("email").style.border = "1px solid red";
        errors.push("Błędny adres e-mail");
    }
    
 
    if(password.length < 8 || confirmpassword.length < 8 ) {
        var error4 = document.getElementById("password").style.border = "1px solid red";
        var error5 = document.getElementById("confirmpassword").style.border = "1px solid red";
        errors.push("Hasło jest za krótkie");
    }
    else if(password.length > 8 && confirmpassword.length > 8){
        var error4 = document.getElementById("password").style.border = "1px solid darkgrey";
        var error5 = document.getElementById("confirmpassword").style.border = "1px solid darkgrey";
    }

    if(password.match(regexp1)){
        var error4 = document.getElementById("password").style.border = "1px solid darkgrey";
    }
    else {
        var error4 = document.getElementById("password").style.border = "1px solid red";
        errors.push("Hasło nie zawiera dużej litery");
    }

    if(password.match(regexp2)){
        var error4 = document.getElementById("password").style.border = "1px solid darkgrey";
    }
    else {
        var error4 = document.getElementById("password").style.border = "1px solid red";
        errors.push("Hasło nie zawiera cyfry");
    }

    if(password != confirmpassword) {
        var error4 = document.getElementById("password").style.border = "1px solid red";
        var error5 = document.getElementById("confirmpassword").style.border = "1px solid red";
        errors.push("Hasła muszą być takie same");
    }
    else if (password === confirmpassword && password != "" && confirmpassword != ""){
        var error4 = document.getElementById("password").style.border = "1px solid darkgrey";
        var error5 = document.getElementById("confirmpassword").style.border = "1px solid darkgrey";
    }

    if(checkbox === false) {
        var error6 = document.getElementById("checkboxline").style.display = "block";
        errors.push("Zaznacz checkbox");
    }
    else if(checkbox === true) {
        var error6 = document.getElementById("checkboxline").style.display = "none";
    }

   if(errors.length === 0){
       alert("Validation ok");
       window.location.reload(true);
   }  
   else {
    error1
    error2
    error3
    error4
    error5
    error6
    setTimeout(function() {
        alert(errors.join('\n'));
    },5)
    
   }
}