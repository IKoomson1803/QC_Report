
function errorAlert() {
    $("#divMessage").html(
        "<div><h5>Whoops! There is an error, please contact system admin.</h5></div><br/>"
        + "<div><button onclick='closeMessageDialog()' class='btn btn-default' >Close<span class='glyphicon glyphicon-off'></span></button></div>")
        .dialog({
            autoOpen: true,
            modal: true,
            width: 500,
            resizable: false,
            title: "Error Message >>"
        });
}

function closeMessageDialog() {
    $("#divMessage").dialog("close");
    $.unblockUI();
}