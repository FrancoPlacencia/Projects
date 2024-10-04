$(document).ready(function() {
    $("#reveal").click(function() {
        $("#answer").show("10000");
        $("#correct").prop("disabled", false);
        $("#incorrect").prop("disabled", false);
        $("#reveal").prop("disabled", true);
    });

    $("#correct").click(function(){
        $("#answerInput").val("correct");
        $("#questionForm").submit();
    });

    $("#incorrect").click(function(){
        $("#answerInput").val("incorrect");
        $("#questionForm").submit();
    });
});