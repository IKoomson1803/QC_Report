var AjaxGlobalHandler = {
    Initiate: function () {
        $.ajaxSetup({ cache: false });

        //As of jQuery 1.9, all the handlers for the jQuery global Ajax events, 
        //including those added with the.ajaxComplete() method, must be attached to document.
        // Ajax events fire in following order
        $(document).ajaxStart(function () {
            $.blockUI({
                message: ''
            });
        }).ajaxSend(function (e, xhr, opts) {
        }).ajaxError(function (e, xhr, opts) {

            //HttpStatusCode.Unauthorized
            if (xhr.status === 401) {  // This will come from CustomAuthorize.cs HandleUnauthorizedRequest() for AJAX request
                location.href = '/Home/Index';
            }
            else {
                errorAlert(); //From errorMessage.js
            }

        }).ajaxSuccess(function (e, xhr, opts) {
        }).ajaxComplete(function (e, xhr, opts) {
        }).ajaxStop(function () {
            $.unblockUI();
        });
    }
};