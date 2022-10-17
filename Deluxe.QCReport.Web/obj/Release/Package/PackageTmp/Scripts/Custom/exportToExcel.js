//const { log } = require("util");

var _fileDownloadCheckTimer;
var _downloadToken = new Date().getTime(); //use the current timestamp as the token value. This will be used by ExcelHelper.cs util 


//$(function () {
//    initializeExport();
//})


//function initialize() {


//}

function initializeExport() {

    $.blockUI({ message: 'Exporting to excel, please wait for the download dialog box...' });
  
    _fileDownloadCheckTimer = window.setInterval(function () {
        var cookieValue = $.cookie('fileDownloadToken');
        console.log('cookieValue:' + cookieValue)
        console.log('downloadToken:' + _downloadToken)
        if (cookieValue == _downloadToken)
            finishDownload();
    }, 10000);
}

function exportToExcel() {
    initializeExport()
    $("#spExportToExcel").show();
    // $('#spExportToExcel').delay(1000).fadeOut().fadeIn('slow')
    location.href = '/AdvancedSearch/ExportToExcel?downloadToken=' + _downloadToken;
      
}

function finishDownload() {
    window.clearInterval(_fileDownloadCheckTimer);
    $.removeCookie('fileDownloadToken'); //clears this cookie value
    $.unblockUI();
    $("#spExportToExcel").hide()
}

