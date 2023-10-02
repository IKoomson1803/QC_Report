var table;

$(function () {
    initializeAdminDataTable();

  
});

function initializeAdminDataTable() {

    //!$.fn.dataTable.isDataTable('#tblDataTable')

    //console.log($.fn.dataTable)

    if (!$.fn.dataTable.isDataTable('#tblAdmin')) {
        instantiateAdminDataTable();
    }

    $(".dt-buttons").hide();

    

}


function instantiateAdminDataTable() {

    table = $('#tblAdmin').DataTable({
        /*   dom: 'Blfrtip',*/
        /* dom: '<"top"i>rt<"bottom"flp><"clear">',*/
        "dom": '<"top"rlif>t<"bottom"p>',
        "iDisplayLength": 20,
        buttons: [{
            text: 'Export To Excel',
            className: 'btn-export',
            extend: 'excelHtml5',
            exportOptions: {
                modifier: {
                    selected: true
                },
                columns: [1],
                format: {
                    header: function (data, columnIdx) {
                        return data;
                    },
                    body: function (data, column, row) {
                        return data;
                    }
                }
            },
            footer: false,
            customize: function (xlsx) {
                var sheet = xlsx.xl.worksheets['sheet1.xml'];
                //$('c[r=A1] t', sheet).text( 'Custom text' );
                //$('row c[r^="C"]', sheet).attr('s', '2');
            }
        }]
    });

}

function resetAdminDataTable() {
      table
        .search('')
        .columns().search('')
        .draw();
}