

$().ready(function () {
    initializeLocationForm();

    $('#tblAdmin').on('search.dt', function () {
        var value = $('.dataTables_filter input').val();
        // alert(value); // <-- the value
        resetLocationFields()
    });
});

function initializeLocationForm() {
   
    $('#ResetLocationFields').click(function (event) {
        resetLocationFields(false);
    });

    $('#SaveLocation').click(function (event) {
        saveLocation();
    });

    $('.clickable-row').on('click', function () {

        $('table tr').removeClass("selectedRow");
        $(this).addClass("selectedRow");
        var id = $(this).data('id');
        $('#btnSave').text('Update');
        populateLocationById(id);

    });
}

function populateLocationById(id) {

    $.ajax({
        url: '/Administration/GetLocationById',
        async: true,
        data: { id: id },
        type: 'Get',
        success: function (result) {
            //console.log(result)

            if (result.pkey > 0) {
                showLocationForm(result);
            }

        }

        });

}


function showLocationForm(result) {

    $('#pkey').val(result.pkey);
    $('#Location').val(null ?? result.Location);
    $('#Address').val(null ?? result.Address);
    $("#SaveLocation").html('Update');

}



function rowOnClick() {

    $('.clickable-row').on('click', function () {

        $('table tr').removeClass("selectedRow");
        $(this).addClass("selectedRow");
        var id = $(this).data('id');
        $('#btnSave').text('Update');
        populateLocationById(id);

    });
}






function resetLocationFields() {

    $('#pkey ').val('');
    $('#Location').val('');
    $('#Address').val('');
    $('table tr').removeClass("selectedRow");
    $("#SaveLocation").html('Add New');

}


function saveLocation() {

    $('#divLocationMessage').html('');

    if ($("#Location").val() == "") {

        $('#Location').popover({ placement: 'bottom', content: "Please provide location and continue...", trigger: "manual" }).popover('show')
            .on('shown.bs.popover', function () {
                setTimeout("$('#Location').popover('destroy');", 3000);
            });

        return false;
    }

    if ($("#Address").val() == "") {

        $('#Address').popover({ placement: 'bottom', content: "Please provide address and continue...", trigger: "manual" }).popover('show')
            .on('shown.bs.popover', function () {
                setTimeout("$('#Address').popover('destroy');", 3000);
            });

        return false;
    }

    var formData = $('#frmLocation').serializeObject();

    // console.log(formData);
    // return;

    $.ajax({
        url: '/Administration/SaveLocation',
        cache: false,
        data: formData,
        type: 'POST',
        success: function (data) {
            if (data.success == true) {
                resetLocationFields(false);
                //Msg.success(data.msg, 5 * 1000);

                //Refresh the autocomplete lookup
                $.get('/Administration/LoadLocationPartial').done(function (data) {

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