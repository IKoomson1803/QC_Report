
var locations = [];



$().ready(function () {
    initializeLocationForm();
});

function initializeLocationForm() {
    $.ajax({
        url: '/Administration/GetLocations',
        async: true,
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
           
            $.each(data, function (k, c) {
                locations.push(c);
            });


        }
    });

    $('#LocationSearch').autocomplete({
        minLength: 3,
        minDelay: 250,
        source: locations,
    });

    $('#LocationSearch').keyup(function (event) {
        if (event.key == 'Enter') {
            searchLocation();
        }
    });

    $('#ResetLocationFields').click(function (event) {
        resetLocationFields(false);
    });

    $('#SaveLocation').click(function (event) {
        saveLocation();
    });
}



function searchLocation() {

    if ($('#LocationSearch').val() == '') {
        return;
    }

    populateLocationForm();


}

function populateLocationForm() {

    $.ajax({
        url: '/Administration/GetLocationDetails',
        async: true,
        data: { location: $('#LocationSearch').val() },
        type: 'Get',
        success: function (result) {
            //console.log(result)

            if (result.pkey > 0) {
                showLocationForm(result);
            }
            else {
                resetLocationFields(true);
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

function resetLocationFields(search) {

    if (!search) {
        $('#LocationSearch').val('');
    }

    $('#pkey ').val('0');
    $('#Location').val('');
    $('#Address').val('');
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