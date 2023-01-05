
var clients = [];



$().ready(function () {
    initializeClientForm();
});


function initializeClientForm() {

    $.ajax({
        url: '/Administration/GetClients',
        async: true,
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            //console.log('Clients ' +  data);

            $.each(data, function (k, c) {
                clients.push(c);
            });

         
        }
    });

    $('#CustomerNameSearch').autocomplete({
        minLength: 3,
        minDelay: 250,
        source: clients,
    });

    $('#CustomerNameSearch').keyup(function (event) {
        if (event.key == 'Enter') {
            searchClient();
        }
    });

    $('#ResetClientFields').click(function (event) {
        resetClientFields(false);
    });
        
    $('#SaveClient').click(function (event) {
        saveClient();
    });

  
}

function searchClient() {

    if ($('#CustomerNameSearch').val() == '') {
        return;
    }

    populateClientForm();


}

function populateClientForm() {

    $.ajax({
        url: '/Administration/GetClientDetails',
        async: true,
        data: { clientName: $('#CustomerNameSearch').val() },
        type: 'Get',
        success: function (result) {

            if (result.CustID  > 0) {
                showClientForm(result);
            }
            else {
                resetClientFields(true);
            }
        }
    });

}


function showClientForm(result){
    console.log(result);

    $('#CustID ').val(result.CustID );
    $('#CustCode').val(result.CustCode);
    $('#CustName').val(null ?? result.CustName);
    $('#CustAddress').val(null ?? result.CustAddress);
    $('#CustPhone').val(null ?? result.CustPhone);
    $('#GradingScale').val(null ?? result.GradingScale);

    $("#SaveClient").html('Update');


}

function resetClientFields(search) {

    if (!search) {
        $('#CustomerNameSearch').val('');
    }

    $('#CustID ').val('0');
    $('#CustCode').val('');
    $('#CustName').val('');
    $('#CustAddress').val('');
    $('#CustPhone').val('');
    $('#GradingScale').val('');

    $("#SaveClient").html('Add New');

}

function saveClient() {

    $('#divClientMessage').html('');

    if ($("#CustName").val() == "") {
       // $('#divClientMessage').html("Please supply customer's name and continue...");

        $('#CustName').popover({ placement: 'bottom', content: "Please provide customer name and continue...", trigger: "manual" }).popover('show')
            .on('shown.bs.popover', function () {
                setTimeout("$('#CustName').popover('destroy');", 3000);
            });

        return false;
    }


    var formData = $('#frmClient').serializeObject();

    //console.log(formData);
    //return;

    $.ajax({
        url: '/Administration/SaveClient',
        cache: false,
        data: formData,
        type: 'POST',
        success: function (data) {
            if (data.success == true) {
                resetClientFields(false);
                //Msg.success(data.msg, 5 * 1000);

                //Refresh the autocomplete lookup
                $.get('/Administration/LoadClientPartial').done(function (data) {

                    $("#divAdminContent").html(data);
                })
            }
            else {
                Msg.error(data.msg, 5 * 1000);;
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            //console.log(errorThrown);
        }
    });

}