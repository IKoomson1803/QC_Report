$(function () {

    function IsQCNumberValid(qcNumber) {
        if (qcNumber == '') {
            return false;
        }
        else if (qcNumber == '0') {
            return false;
        }
        if (qcNumber == 0) {
            return false;
        }

        return true;
    }

    function GetDetailsNav(qcno, rno) {

        $.get('/Home/GetTopNavigation', {
            qcnum: qcno, revnum: rno
        })
            .done(function (data) {

                // $("#divTopSubMenu").html(data);

                // console.log('Audio QC in Sub Menu: ' + $("#TopMenu").find('.lnkQcAudioAndTC').length)
               // alert(!$("#TopMenu").find('.lnkDPPProgDetails').length)
              

                if (!$("#TopMenu").find('.lnkQcAudioAndTC').length
                    && !$("#TopMenu").find('.lnkDPPProgDetails').length) {
                    $("#TopMenu").append(data);
                }
            })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            });
    };

    function GetTopNavigation(url, qcno, rno, wono) {


        $.ajax({
            type: "GET",
            url: url,
            data: { qcnum: qcno, revnum: rno, wonum: wono },
            async: true,
            success: function (data) {
                $("#divContent").html(data);
            },
            error: function (xdata) {
                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            },
            complete: function (data) {
                $('.cssload-preloader').hide();
            }
        });

    }



    // colapse tree view items
    // ===============================================================================================================================================================================

    $("#btnTVJob").on("click", function () {

        $(".liQC").slideToggle();
        $(this).find('span').toggleClass('glyphicon-plus glyphicon-minus')
    });

    $(".btnTVQC").on("click", function () {

        $(this).siblings('.list-group').slideToggle();
        $(this).find('span').toggleClass('glyphicon-plus glyphicon-minus')
    });

    $(".btnTVRev").on("click", function () {

        $(this).siblings('.list-group').slideToggle();
        $(this).find('span').toggleClass('glyphicon-plus glyphicon-minus')
    });

    // END colapse tree view items
    // ===============================================================================================================================================================================


    // Tree view items events
    // ===============================================================================================================================================================================

    $(".aJobDetails").on("click", function () {

        // //$('.cssload-preloader').fadeIn();
        var wono = $(this).data('wonum');

        GetTopNavigation('/Home/JobDetails', null, null, wono)
    });

    $(".aQCDetails").on("click", function () {

        ////$('.cssload-preloader').fadeIn();
        var wono = $(this).data('wonum');
        var qcno = $(this).data('qcnum');

        GetTopNavigation('/Home/QCDetails', qcno, null, wono)
    });

    $(".aRevDetails").on("click", function () {

        // //$('.cssload-preloader').fadeIn();
        var wono = $(this).data('wonum');
        var qcno = $(this).data('qcnum');
        var rno = $(this).data('revnum');

        var isQCNoValid = IsQCNumberValid(qcno)

        if (!isQCNoValid) {
            $('.cssload-preloader').hide();
            return;
        }

        GetDetailsNav(qcno, rno);
        GetTopNavigation('/Home/RevDetails', qcno, rno, wono)
    });

    // END Tree view items events
    // ===============================================================================================================================================================================

});