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



//= require moment/moment.min.js
//= require datepicker/daterangepicker.js
//= require js/custom.min.js




//= require_tree .

 


function searchCategory(input){
  var cols;
  $.post("/search/categories", {queryString: "" + input + ""}, function(data) {

    if (data===false){
         cols = "";
         cols += "<tr>";
        cols += '<td colspan="3" style="text-align:center">Nada encontrado</td></tr>';
    }

    jQuery.each(data, (key, value) => {


               /*LOAD TABLE */
                    cols += "<tr>";
                    cols += '<td>' + value.name + '</td>';
                    cols += '<td>' + value.created_at + '</td>';
                    cols += '<td> <a href="/categories/'+value.id+'/edit"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span> </a>';
                    cols += '<i style="margin-left:3px"></i> <a data-confirm="Você tem certeza?" rel="nofollow" data-method="delete" href="/categories/'+value.id+'"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></a></td>';
                    cols += '</tr>';        
    }); 
    $("#tablerowcategory").html(cols);
  });
  

               

}
function searchSubCategory(input){
  var cols;
  $.post("/search/sub_categories", {queryString: "" + input + ""}, function(data) {

    if (data===false){

         cols = "";
         cols += "<tr>";
        cols += '<td colspan="4" style="text-align:center">Nada encontrado</td></tr>';
    }

    jQuery.each(data, (key, value) => {
      console.log(value);
  
               /*LOAD TABLE */
                    cols += "<tr>";
                    cols += '<td>' + value.name + '</td>';
                    cols += '<td>' + value.category.name + '</td>';
                    cols += '<td>' + value.created_at + '</td>';
                    cols += '<td> <span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span>';
                    cols += '<i style="margin-left:3px"></i><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></td>';
                    cols += '</tr>';        
    }); 
    $("#tablerowsub_category").html(cols);
  });
  

               

}
function searchUsers(input){
  var cols;
  $.post("/search/users", {queryString: "" + input + ""}, function(data) {

    if (data===false){

         cols = "";
         cols += "<tr>";
        cols += '<td colspan="8" style="text-align:center">Nada encontrado</td></tr>';
    }

    jQuery.each(data, (key, value) => {
      console.log(value);
  
               /*LOAD TABLE */
                    cols += "<tr>";
                    if (value.image===null){
                      cols += '<td><img class="circular" src="/images/default_user.jpeg"/></td>';
                    } else {
                      cols += '<td><img class="circular" src="'+ value.image+ '"/></td>';
                    }

                    cols += '<td>' + value.name + '</td>';
                    cols += '<td>' + value.email + '</td>';
                    cols += '<td>' + value.birthday + '</td>';
                    cols += '<td>' + value.blocked + '</td>';
                    cols += '<td>' + value.created_at + '</td>';
                    cols += '<td> <span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span>';
                    cols += '<i style="margin-left:3px"></i><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></td>';
                    cols += '</tr>';        
    }); 
    $("#tablerowusers").html(cols);
  });
  

               

}