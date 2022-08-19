$(function () {
    initializeFaultsImagesTable();
    //$(".dt-buttons").hide();
});


function initializeFaultsImagesTable() {

    if (!$.fn.dataTable.isDataTable('#tblFaultsImages')) { // Prevent DataTable reintialization after Drag and Drop

        $('#tblFaultsImages').DataTable({
            dom: 'Blfrtip',
            "iDisplayLength": 50,
            searching: false,
            columnDefs: [
                //{ "type": "date-euro", targets: [11] }
                //{ "orderable": false, "targets": [1] }
                //{ "visible": false, "targets": [1] }
            ],
            buttons: [{
                //text: 'Export To Excel',
                //className: 'btn-export',
                //extend: 'excelHtml5',
                //exportOptions: {
                //    modifier: {
                //        selected: true
                //    },
                //    columns: [1, 2, 3, 4, 5, 6, 7],
                //    format: {
                //        header: function (data, columnIdx) {
                //            return data;
                //        },
                //        body: function (data, column, row) {
                //            return data;
                //        }
                //    }
                //},
                footer: false,
                //customize: function (xlsx) {
                //    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                //    //$('c[r=A1] t', sheet).text( 'Custom text' );
                //    //$('row c[r^="C"]', sheet).attr('s', '2');
                //}
            }]
        });

    }
 
}

/**
 * This plug-in will provide date sorting for the "dd/mm/YYYY hh:ii:ss" 
 * formatting, which is common in France and other European countries. It can 
 * also be quickly adapted for other formatting as required. Furthermore, this 
 * date sorting plug-in allows for empty values in the column.
 *
 * Please note that this plug-in is **deprecated*. The
 * [datetime](//datatables.net/blog/2014-12-18) plug-in provides enhanced
 * functionality and flexibility.
 *
 *  @name Date (dd/mm/YYYY hh:ii:ss) 
 *  @summary Sort date / time in the format `dd/mm/YYYY hh:ii:ss`
 *  @author [Ronan Guilloux](http://coolforest.net/)
 *  @deprecated
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'date-euro', targets: 0 }
 *       ]
 *    } );
 */
//jQuery.extend(jQuery.fn.dataTableExt.oSort, {
//    "date-euro-pre": function (a) {
//        var x;

//        if ($.trim(a) !== '') {
//            var frDatea = $.trim(a).split(' ');
//            var frTimea = (undefined != frDatea[1]) ? frDatea[1].split(':') : [00, 00, 00];
//            var frDatea2 = frDatea[0].split('/');
//            x = (frDatea2[2] + frDatea2[1] + frDatea2[0] + frTimea[0] + frTimea[1] + ((undefined != frTimea[2]) ? frTimea[2] : 0)) * 1;
//        }
//        else {
//            x = Infinity;
//        }

//        return x;
//    },

//    "date-euro-asc": function (a, b) {
//        return a - b;
//    },

//    "date-euro-desc": function (a, b) {
//        return b - a;
//    }
//});

function clearSearch() {
    var table = $('#ttblFaultsImages').DataTable();
    table
        .search('')
        .columns().search('')
        .draw();
}