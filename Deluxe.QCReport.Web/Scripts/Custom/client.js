
var clients = [];



$().ready(function () {
    initializeClientForm();
   
    $('#tblAdmin').on('search.dt', function () {
        var value = $('.dataTables_filter input').val();
        // alert(value); // <-- the value
        resetClientFields() ;
    });
});


function initializeClientForm() {

    $('#ResetClientFields').click(function (event) {
        resetClientFields();
    });
        
    $('#SaveClient').click(function (event) {
        saveClient();
    });

    $('.clickable-row').on('click', function () {

        $('table tr').removeClass("selectedRow");
        $(this).addClass("selectedRow");
        var id = $(this).data('id');
        $('#btnSave').text('Update');
        //$("#divEnabled").show();
        populateClient(id);

    });


  
}


function rowOnClick() {

    $('.clickable-row').on('click', function () {

        $('table tr').removeClass("selectedRow");
        $(this).addClass("selectedRow");
        var id = $(this).data('id');
        $('#btnSave').text('Update');
       //$("#divEnabled").show();
        populateClient(id);

    });
}

function populateClient(id) {
    $.ajax({
        url: '/Administration/GetClientById',
        async: true,
        data: { id: id },
        type: 'Get',
        success: function (result) {

            if (result.CustID > 0) {
                showClientForm(result);
            }
            else {
                resetClientFields(true);
            }
        }
    });

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

function resetClientFields() {

    $('#CustID ').val('');
    $('#CustCode').val('');
    $('#CustName').val('');
    $('#CustAddress').val('');
    $('#CustPhone').val('');
    $('#GradingScale').val('');
    $('table tr').removeClass("selectedRow");
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
                resetClientFields();
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