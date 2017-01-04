//= require bootstrap/dist/js/bootstrap.min.js
//= require fastclick/lib/fastclick.js
//= require nprogress/nprogress.js
//= require Chart.js/dist/Chart.min.js
//= require jquery-sparkline/dist/jquery.sparkline.min.js
//= require Flot/jquery.flot.js
//= require Flot/jquery.flot.pie.js
//= require Flot/jquery.flot.time.js
//= require Flot/jquery.flot.stack.js
//= require Flot/jquery.flot.resize.js

//= require Flot/jquery.flot.orderBars.js
//= require Flot/date.js
//= require Flot/jquery.flot.spline.js
//= require Flot/curvedLines.js

//= require moment/moment.min.js
//= require datepicker/daterangepicker.js
//= require js/custom.min.js


//= require data-table/jquery.dataTables.min.js
//= require data-table/dataTables.bootstrap.min.js
//= require data-table/buttons.bootstrap.min.js
//= require data-table/dataTables.buttons.min.js
//= require data-table/buttons.flash.min.js
//= require data-table/buttons.html5.min.js
//= require data-table/buttons.print.min.js
//= require data-table/dataTables.fixedHeader.min.js
//= require data-table/dataTables.responsive.min.js
//= require data-table/responsive.bootstrap.js
//= require data-table/jszip.min.js
//= require data-table/pdfmake.min.js
//= require data-table/vfs_fonts.js

//= require_tree .

      function myFunction() {
        // Declare variables 
        var input, filter, table, tr, td, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("mytable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[0];
          if (td) {
            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          } 
        }
      }
 
 
 /*$(document).ready(function() {
        var handleDataTableButtons = function() {
          if ($("#datatable-buttons").length) {
            $("#datatable-buttons").DataTable({
             
           "ordering": false

        
            
              "oLanguage": {
                    "sEmptyTable": "Nenhum registro encontrado",
                    "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                    "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sInfoThousands": ".",
                    "sLengthMenu": "_MENU_ resultados por página",
                    "sLoadingRecords": "Carregando...",
                    "sProcessing": "Processando...",
                    "sZeroRecords": "Nenhum registro encontrado",
                    "sSearch": "Pesquisar",
                    "oPaginate": {
                        "sNext": "Próximo",
                        "sPrevious": "Anterior",
                        "sFirst": "Primeiro",
                                  "sLast": "Último"
                  },
                  "oAria": {
                      "sSortAscending": ": Ordenar colunas de forma ascendente",
                      "sSortDescending": ": Ordenar colunas de forma descendente"
                  }
                    },


              dom: "Bfrti",
              buttons: [
                {
                  extend: "copy",
                  className: "btn-sm"
                },
                {
                  extend: "csv",
                  className: "btn-sm"
                },
                {
                  extend: "excel",
                  className: "btn-sm"
                },
                {
                  extend: "pdfHtml5",
                  className: "btn-sm"
                },
                {
                  extend: "print",
                  className: "btn-sm"
                },
              ],
              responsive: true
            });
          }
        };

        TableManageButtons = function() {
          "use strict";
          return {
            init: function() {
              handleDataTableButtons();
            }
          };
        }();

        $('#datatable').dataTable();
        $('#datatable-keytable').DataTable({
          keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
          ajax: "js/datatables/json/scroller-demo.json",
          deferRender: true,
          scrollY: 380,
          scrollCollapse: true,
          scroller: true
        });

        var table = $('#datatable-fixed-header').DataTable({
          fixedHeader: true
        });

        TableManageButtons.init();
      }); 

