
var users = [];

$().ready(function () {
    initializeUserForm();
});

function initializeUserForm() {

   

    $.ajax({
        url: '/Administration/GetUsers',
        async: true,
        contentType: "application/json",
         dataType: "json",
         success: function (data) {
            //console.log('User Names ' +  data);

              $.each(data, function (k,u) {
                   users.push(u);
              });

             // console.log("Users:" + users);
        }
    });

    $('#SaveUser').click(function (event) {
        saveUser();
    });

    $('#ResetUserFields').click(function (event) {
        resetUserFields(false);
    });

    $('#UsernameSearch').autocomplete({
        minLength: 3,
        minDelay: 250,
        source: users,
    });

    $('#UsernameSearch').keyup(function (event) {
        if (event.key == 'Enter') {
            
            searchUser();
        }
    });

    $('#Enabled').prop('checked', true);
}


function searchUser() {

    if ($('#UsernameSearch').val() == '') {
        return;
    }

    populateUserForm();

}


function populateUserForm() {

    $.ajax({
        url: '/Administration/GetUserDetails',
        async: true,
        data: { username: $('#UsernameSearch').val() },
       // contentType: 'application/json',
        type: 'Get',
        success: function (result) {
           
            if (result.qcUserId > 0) {
                showUserForm(result);
            }
            else {
                resetUserFields(true);
            }
        }
    });
}


function showUserForm(result) {
      
    
    $('#qcUserId').val(result.qcUserId);
    $('#UserNameText').val(result.UserName);
    $('#Fullname').val(null ?? result.FullName);
    $('#Location').val(null ?? result.Location);
    $('#SecurityLevel').val(null ?? result.SecurityLevel);
    $('#Phone').val(null ?? result.Phone);

    if (result.Location == "0") {
        $('#Location').val('9')
    }

    var isDeleted = result.Deleted;

    if (isDeleted == true) {
        $('#Enabled').prop('checked', false);
        $('#Deleted').val('1');
       
    }
    else {
        $('#Enabled').prop('checked', true);
        $('#Deleted').val(null);
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

    
    var formData = $('#frmUser').serializeObject();

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
        resetUserFields(false);
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

function resetUserFields(search) {

    if (!search) {
        $('#UsernameSearch').val('');
    }
    

    $('#qcUserId').val('0');
    $('#UserNameText').val('');
    $('#Fullname').val('');
    $('#Location').val('');
    $('#SecurityLevel').val('');
    $('#Phone').val('');
    $('#Enabled').prop('checked', true);
    $('#Deleted').val(null);

    $("#SaveUser").html('Add New');
}