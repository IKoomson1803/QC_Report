

$(function () {

    /********** Users ***************************************/

    $('body').on('click', '#Users', function () {

              
        $.get('/Administration/LoadUserPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

               
            });
    });

 /********** Clients ***************************************/

    $('body').on('click', '#Clients', function () {

       
        $.get('/Administration/LoadClientPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

               
            });
    });

    /********** Locations ***************************************/


    $('body').on('click', '#Locations', function () {


        $.get('/Administration/LoadLocationPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

            });
    });

    /********** Aspect Ratios ***************************************/

    $('body').on('click', '#AspectRatios', function () {


        $.get('/Administration/LoadAspectRatioPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

            });
    });

    /********** Formats ***************************************/
    $('body').on('click', '#Formats', function () {


        $.get('/Administration/LoadFormatPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

            });
    });

    /********** Control Rooms  ***************************************/
    $('body').on('click', '#ControlRooms', function () {


        $.get('/Administration/LoadControlRoomPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

            });
    });

    /**********  Tape Descriptions ***************************************/
    $('body').on('click', '#TapeDescriptions', function () {


        $.get('/Administration/LoadTapeDescriptionPartial').done(function (data) {

            $("#divAdminContent").html(data);
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

            });
    });



});


