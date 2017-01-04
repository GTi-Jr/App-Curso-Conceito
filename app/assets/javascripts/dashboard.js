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
 
 
