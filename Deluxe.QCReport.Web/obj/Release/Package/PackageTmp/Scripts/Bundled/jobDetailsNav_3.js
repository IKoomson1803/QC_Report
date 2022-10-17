////function setActiveButton(element) {
////    $(".subMenuOnClick").removeClass("subMenuOnClick")
////    $("#" + element).addClass("subMenuOnClick");
////}

function initializeMultiSelectChecboxList() {

    $('.SearchableDropdown').multiselect({
        multiple: false,
        includeSelectAllOption: true,
        enableCaseInsensitiveFiltering: true,
        maxHeight: 200,
        nonSelectedText: '',
        allSelectedText: 'No option left ...',
        delimiterText: '\n',
        numberDisplayed: 1,
        buttonWidth: '300px',

    });

    $('.SearchableDropdown_2').multiselect({
        multiple: false,
        includeSelectAllOption: true,
        enableCaseInsensitiveFiltering: true,
        maxHeight: 200,
        nonSelectedText: '',
        allSelectedText: 'No option left ...',
        delimiterText: '\n',
        numberDisplayed: 1,
        buttonWidth: '150px',

    });

    $('.SearchableDropdown_3').multiselect({
        multiple: false,
        includeSelectAllOption: true,
        enableCaseInsensitiveFiltering: true,
        maxHeight: 400,
        nonSelectedText: '',
        allSelectedText: 'No option left ...',
        delimiterText: '\n',
        numberDisplayed: 1,
        buttonWidth: '400px',

    });

    $('.SearchableDropdown_4').multiselect({
        multiple: true,
        includeSelectAllOption: true,
        enableCaseInsensitiveFiltering: true,
        maxHeight: 200,
        nonSelectedText: '',
        allSelectedText: 'No option left ...',
        delimiterText: '\n',
        numberDisplayed: 1,
        buttonWidth: '100px',

    });


}

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

function GetNavDetails(qcno, rno, wono, element) {

    $.ajax({
        type: "GET",
        url: "/Home/GetTopNavigation",
        data: { qcnum: qcno, revnum: rno, wonum: wono },
        async: true,
        success: function (data) {


          //  alert(!$("#TopMenu").find('.lnkDPPProgDetails').length)

            if (!$("#TopMenu").find('.lnkQcAudioAndTC').length
                && !$("#TopMenu").find('.lnkDPPProgDetails').length) {
                $("#TopMenu").append(data);
            }


        },
        error: function (xdata) {
            Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
        }
    });

};

function GetJobDetails(url, qcno, rno, wono, element) {


    $.ajax({
        type: "GET",
        url: url,
        data: { qcnum: qcno, revnum: rno, wonum: wono },
        async: true,
        success: function (data) {

            $("#divContent").html(data);
            $(".subMenuOnClick").removeClass("subMenuOnClick")
            $("#" + element).addClass("subMenuOnClick");

        },
        error: function (xdata) {
            Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
        },
        complete: function (data) {
            $('.cssload-preloader').hide();
        }
    });

}

function PopulateJobDetails(url, element) {

    // //$('.cssload-preloader').fadeIn();

    var qcno = $('#currentQCNumber').val();
    var rno = $('#currentRevNumber').val(); //$(this).data('revnum');

    var isQCNoValid = IsQCNumberValid(qcno)

    if (!isQCNoValid) {
        /*$('.cssload-preloader').hide();*/
        return;
    }

    //alert(url)

    GetNavDetails(qcno, rno, null, element);
    GetJobDetails(url, qcno, rno, null, element)




}

function CopyQC() {
    //$('.cssload-preloader').fadeIn();

    var qcno = $('#currentQCNumber').val();
    var rno = $('#currentRevNumber').val(); //$(this).data('revnum');
    var wono = $('#txtNewJobNumber').val();  // Needed just for Copy QC

    var isQCNoValid = IsQCNumberValid(qcno)

    if (!isQCNoValid) {
        $('.cssload-preloader').hide();
        return;
    }

    GetNavDetails(qcno, rno);
    SaveCopyQC(qcno, rno, wono)

}


function SaveCopyQC(qcno, rno, wono) {

    $.ajax({
        type: "POST",
        url: '/Job/SaveCopyQC',
        data: { qcnum: qcno, revnum: rno, wonum: wono },
        async: true,
        success: function (data) {

            if (data.woNum != '') {
                wono = data.woNum
                location.href = '/home/Index?woNumber=' + wono;
            }
            else {
                $('.cssload-preloader').hide();
                Msg.success(data.msg, 5 * 1000);
            }

        },
        error: function (xdata) {
            Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
        },
        complete: function (data) {
            $('.cssload-preloader').hide();
        }
    });

}
