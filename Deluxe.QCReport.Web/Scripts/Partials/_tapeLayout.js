$(function () {
    $('.lnkQcTapeLayout').addClass('active');

    $('#deletePromptModal').on('shown.bs.modal', function () {

        var itemNo = $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.ItemNum)').val();
        var modal = $(this);
        modal.find('.modal-body').text('Are you sure you want to delete record ' + itemNo + '?');

    })

    $('#btnSave').on("click", function () {

        //$('.cssload-preloader').fadeIn();
        var qcno = '@Model.TapeLayout_VM.Qcnum';
        var revno = '@Model.TapeLayout_VM.subQcnum';
        var myModel = $('#form_jobdetails').serializeObject();

        $.post('/Job/SaveTapeLayoutDetails', { model: myModel }).done(function (data) {

            if (data.success == true) {
                Msg.success(data.msg, 5 * 1000);

                LoadTapeLayoutDetails(qcno, revno, null);
            }
            else {
                Msg.error(data.msg, 5 * 1000);
            }
        })
        .fail(function (xdata) {

            Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
        })
        .always(function () {

            $('.cssload-preloader').hide();
        });
    });

    $('#btnDeletePrompt').on("click", function () {

        $('#deletePromptModal').modal('show');

    });

    $('#btnDelete').on("click", function () {

        $('#deletePromptModal').modal('hide');

        //$('.cssload-preloader').fadeIn();
        var qcno = '@Model.TapeLayout_VM.Qcnum';
        var revno = '@Model.TapeLayout_VM.subQcnum';
        var myModel = $('#form_jobdetails').serializeObject();

        $.post('/Job/DeleteTapeLayoutDetails', { model: myModel }).done(function (data) {

            if (data.success == true) {
                Msg.success(data.msg, 5 * 1000);

                LoadTapeLayoutDetails(qcno, revno, null);
            }
            else {
                Msg.error(data.msg, 5 * 1000);
            }
        })
        .fail(function (xdata) {

            Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
        })
        .always(function () {

            $('.cssload-preloader').hide();
        });
    });

    $('#btnReset').on("click", function () {

        $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.TapeFormatId)').val('');
        $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.ItemNum)').val(@nextItemNo);
        $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.Description)').val('');
        $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.Length)').val('');
        $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.Time_Code)').val('');

        $('#btnDeletePrompt').prop('disabled', true);
        $('#btnSave').text('Add');
    });

    // add ':' in timecode textbox
    $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.Time_Code)').on('keyup', function () {

        var currentValue = $(this).val();

        if (currentValue.length == 2 ||
            currentValue.length == 5 ||
            currentValue.length == 8) {

            $(this).val(currentValue + ':');
        }

    });

    $('.clickable-row').on('click', function () {

        //$('.cssload-preloader').fadeIn();
        var qcno = '@Model.TapeLayout_VM.Qcnum';
        var revno = '@Model.TapeLayout_VM.subQcnum';
        var tfno = $(this).data('tfid');

        LoadTapeLayoutDetails(qcno, revno, tfno);

    });

    if ('@Model.TapeLayout_VM.CurrentTimecodes' != '') {

        $('#btnDeletePrompt').prop('disabled', false);
        $('#btnSave').text('Save');
    }
    else {
        $('#@Html.IdFor(m => m.TapeLayout_VM.CurrentTimecodes.ItemNum)').val(@nextItemNo);
    }

});



function LoadTapeLayoutDetails(qcno, revno, tfno) {

    $.post('/Job/TapeLayoutDetails', { qcnum: qcno, revnum: revno, tfid: tfno }).done(function (data) {

        $("#divContent").html(data);
    })
    .fail(function (xdata) {

        Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
    })
    .always(function () {

        $('.cssload-preloader').hide();
    });
}
