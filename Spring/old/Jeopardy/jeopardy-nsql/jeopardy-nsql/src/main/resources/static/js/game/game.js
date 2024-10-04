var dice = {
    sides: 6,
    roll: function () {
    var randomNumber = Math.floor(Math.random() * this.sides) + 1;
        return randomNumber;
    }
}

function testDice(){
    for(var i=0;i<10;i++){
        onclickDice();
    }
}

jQuery('#diceBtn').click(function(){
    var diceResult = dice.roll();
    jQuery('#diceBtn').prop("disabled", true);
    jQuery('#diceBtn').removeClass("btn-outline-primary").addClass("btn-primary");
    jQuery("#diceVal").val(diceResult);
    switch(diceResult){
        case 1:
            jQuery("#diceVw").removeClass().addClass("fa-solid fa-dice-one");
            console.log("dice result " + 1);
        break;
        case 2:
            jQuery("#diceVw").removeClass().addClass("fa-solid fa-dice-two");
            console.log("dice result " + 2);
        break;
        case 3:
            jQuery("#diceVw").removeClass().addClass("fa-solid fa-dice-three");
            console.log("dice result " + 3);
        break;
        case 4:
            jQuery("#diceVw").removeClass().addClass("fa-solid fa-dice-four");
            console.log("dice result " + 4);
        break;
        case 5:
            jQuery("#diceVw").removeClass().addClass("fa-solid fa-dice-five");
            console.log("dice result " + 5);
        break;
        case 6:
            jQuery("#diceVw").removeClass().addClass("fa-solid fa-dice-six");
            console.log("dice result " + 6);
        break;
        default:
            jQuery("#diceVw").removeClass().addClass("fa-solid fa-triangle-exclamation");
            console.log("dice result " + 0);
        break;
    }
});