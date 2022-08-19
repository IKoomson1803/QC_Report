
var AspectRatios = [];



$().ready(function () {
    initializeAspectRatioForm();
});

function initializeAspectRatioForm() {
    $.ajax({
        url: '/Administration/GetAspectRatios',
        async: true,
        contentType: "application/json",
        dataType: "json",
        success: function (data) {

            $.each(data, function (k, c) {
                AspectRatios.push(c);
            });


        }
    });

    $('#AspectRatioSearch').autocomplete({
        minLength: 3,
        minDelay: 250,
        source: AspectRatios,
    });

    $('#AspectRatioSearch').keyup(function (event) {
        if (event.key == 'Enter') {
            searchAspectRatio();
        }
    });

    $('#ResetAspectRatioFields').click(function (event) {
        resetAspectRatioFields(false);
    });

    $('#SaveAspectRatio').click(function (event) {
        saveAspectRatio();
    });
}



function searchAspectRatio() {

    if ($('#AspectRatioSearch').val() == '') {
        return;
    }

    populateAspectRatioForm();


}

function populateAspectRatioForm() {

    $.ajax({
        url: '/Administration/GetAspectRatioDetails',
        async: true,
        data: { AspectRatio: $('#AspectRatioSearch').val() },
        type: 'Get',
        success: function (result) {
            //console.log(result)

            if (result.AspectID > 0) {
                showAspectRatioForm(result);
            }
            else {
                resetAspectRatioFields(true);
            }
        }
    });

}


function showAspectRatioForm(result) {


    $('#AspectID').val(result.AspectID);
    $('#AspectRatio').val(null ?? result.AspectRatio);
  
    $("#SaveAspectRatio").html('Update');


}

function resetAspectRatioFields(search) {

    if (!search) {
        $('#AspectRatioSearch').val('');
    }

    $('#AspectID ').val('0');
    $('#AspectRatio').val('');
    $("#SaveAspectRatio").html('Add New');

}


function saveAspectRatio() {

    $('#divAspectRatioMessage').html('');

    if ($("#AspectRatio").val() == "") {

        $('#AspectRatio').popover({ placement: 'bottom', content: "Please provide Aspect Ratio and continue...", trigger: "manual" }).popover('show')
            .on('shown.bs.popover', function () {
                setTimeout("$('#AspectRatio').popover('destroy');", 3000);
            });

        return false;
    }


    var formData =   $('#frmAspectRatio').serializeObject();  // $("#frmAspectRatio").serialize();

    //var formData = {
    //    AspectID: $('#AspectID').val(),
    //    AspectRatio: $('#AspectRatio').val()
    //}

    console.log(formData);
    //return;
          
        var myModel = $('#frmAspectRatio').serializeObject();

    $.post('/Administration/SaveAspectRatio', { model: myModel }).done(function (data) {

            if (data.success == true) {
                resetAspectRatioFields(false);
                
                //Refresh the autocomplete lookup
                $.get('/Administration/LoadAspectRatioPartial').done(function (data) {

                    $("#divAdminContent").html(data);
                })
            }
            else {
                Msg.error(data.msg, 5 * 1000);
            }
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

             
            });
    

    //$.ajax({
    //    url: '/Administration/SaveAspectRatio',
    //    cache: false,
    //    data: formData,
    //    type: 'POST',
    //   // dataType: 'json',
    //    success: function (data) {
    //        if (data.success == true) {
    //            resetAspectRatioFields(false);
    //            //Msg.success(data.msg, 5 * 1000);

    //            //Refresh the autocomplete lookup
    //            $.get('/Administration/LoadAspectRatioPartial').done(function (data) {

    //                $("#divAdminContent").html(data);
    //            })
    //        }
    //        else {
    //            Msg.error(data.msg, 5 * 1000);;
    //        }
    //    },
    //    error: function (xhr, textStatus, errorThrown) {
    //        //console.log(errorThrown);
    //    }
    //});

}