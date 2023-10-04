

$().ready(function () {
    $("#divEnabled").hide();
    $('#Active').prop('checked', true);
    initializeUserForm();
    rowOnClick();

    $('#tblAdmin').on('search.dt', function () {
        var value = $('.dataTables_filter input').val();
         resetUserFields();
    });
});

function initializeUserForm() {

   
    $('#SaveUser').click(function (event) {
        saveUser();
    });

    $('#ResetUserFields').click(function (event) {
        resetUserFields();
    });

    
   
}


function searchUser() {

    if ($('#UsernameSearch').val() == '') {
        return;
    }

    populateUserForm();

}

function rowOnClick() {



    $('.clickable-row').on('click', function () {

        $('table tr').removeClass("selectedRow");
        $(this).addClass("selectedRow");
        var id = $(this).data('id');
        $('#btnSave').text('Update');
        $("#divEnabled").show();
        populateUserFormById(id);

    });
}



function populateUserFormById(id) {

    $.ajax({
        url: '/Administration/GetUserDetailsById',
        async: true,
        data: { id: id },
        // contentType: 'application/json',
        type: 'Get',
        success: function (result) {

            if (result.qcUserId > 0) {
                showUserForm(result);
            }
            else {
                resetUserFields();
            }
        }
    });
}


function showUserForm(result) {


    $('#qcUserId').val(result.qcUserId);
    $('#UserName').val(result.UserName);
    $('#Fullname').val(null ?? result.FullName);
    $('#Location').val(null ?? result.Location);
    $('#SecurityLevel').val(null ?? result.SecurityLevel);
    $('#Phone').val(null ?? result.Phone);

    if (result.Location == "0") {
        $('#Location').val('9')
    }

    var isDeleted = result.Deleted;

    if (isDeleted) {
        $('#Active').prop('checked', false);
    }
    else {
        $('#Active').prop('checked', true);
    }

    $("#SaveUser").html('Update');

}

function saveUser() {

    $('#divUserMessage').html('');

    if ($("#UserNameText").val() == "") {
        //$('#divUserMessage').html('Please supply user name and continue...');

        $('#UserNameText').popover({ placement: 'bottom', content: "Please provide user CORP name and continue...", trigger: "manual" }).popover('show')
            .on('shown.bs.popover', function () {
                setTimeout("$('#UserNameText').popover('destroy');", 3000);
            });


        return false;
    }

    if ($("#Location").val() == "") {
        $('#divUserMessage').html('Please supply location and continue...');

        //$('#Location').val().popover({ placement: 'bottom', content: "Please provide location and continue...", trigger: "manual" }).popover('show')
        //    .on('shown.bs.popover', function () {
        //        setTimeout("$('#Location').popover('destroy');", 3000);
        //    });

        return false;
    }

    if ($("#SecurityLevel").val() == "") {
        $('#divUserMessage').html('Please supply role and continue...');

        //$('#SecurityLevel').popover({ placement: 'bottom', content: "Please provide security level and continue...", trigger: "manual" }).popover('show')
        //    .on('shown.bs.popover', function () {
        //        setTimeout("$('#SecurityLevel').popover('destroy');", 3000);
        //    });

        return false;
    }

    var formData = $("#frmUser").serialize({
        checkboxesAsBools: true
    });


    /* var formData = $('#frmUser').serializeObject();*/

    $.ajax({
        url: '/Administration/SaveUser',
        cache: false,
        data: formData,
        //contentType: "application/json",
        type: 'POST',
        success: saveSuccessful,
        error: function (xhr, textStatus, errorThrown) {
            //console.log(errorThrown);
        }
    });
}


function saveSuccessful(data) {

    if (data.success == true) {
        resetUserFields();
        // Msg.success(data.msg, 5 * 1000);

        //Refresh the autocomplete lookup
        $.get('/Administration/LoadUserPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
    }
    else {
        Msg.error(data.msg, 5 * 1000);;
    }
}

function saveFailed(data) {
    Msg.error(data.msg, 5 * 1000);
}

function resetUserFields() {


    $('#qcUserId').val('0');
    $('#UserNameText').val('');
    $('#Fullname').val('');
    $('#Location').val('');
    $('#SecurityLevel').val('');
    $('#Phone').val('');
    $('#Active').prop('checked', true);
    $('table tr').removeClass("selectedRow");
    $("#divEnabled").hide();

    $("#SaveUser").html('Add New');
}