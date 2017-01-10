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

function searchCategory(input) {
    var cols;
    $.post("/search/categories", {
        queryString: "" + input + ""
    }, function(data) {
        if (data === false) {
            cols = "";
            cols += "<tr>";
            cols += '<td colspan="3" style="text-align:center">Nada encontrado</td></tr>';
        }
        jQuery.each(data, (key, value) => {
            cols += "<tr>";
            cols += '<td>' + value.name + '</td>';
            cols += '<td>' + moment.parseZone(value.created_at).format('DD/MM/YYYY HH:mm:ss'); + '</td>';
            cols += '<td> <a href="/categories/' + value.id + '/edit"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span> </a>';
            cols += '<i style="margin-left:3px"></i> <a data-confirm="Você tem certeza?" rel="nofollow" data-method="delete" href="/categories/' + value.id + '"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></a></td>';
            cols += '</tr>';
        });
        $("#tablerowcategory").html(cols);
    });
}

function searchsubcategory(input) {
    var cols;
    $.post("/search/subcategories", {
        queryString: "" + input + ""
    }, function(data) {
        if (data === false) {
            cols = "";
            cols += "<tr>";
            cols += '<td colspan="4" style="text-align:center">Nada encontrado</td></tr>';
        }
        jQuery.each(data, (key, value) => {
            /*LOAD TABLE */
            cols += "<tr>";
            cols += '<td>' + value.name + '</td>';
            cols += '<td>' + value.category.name + '</td>';
            cols += '<td>' + moment.parseZone(value.created_at).format('DD/MM/YYYY HH:mm:ss'); + '</td>';
            cols += '<td> <a href="/subcategories/' + value.id + '/edit"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span> </a>';
            cols += '<i style="margin-left:3px"></i> <a data-confirm="Você tem certeza?" rel="nofollow" data-method="delete" href="/subcategories/' + value.id + '"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></a></td>';
            cols += '</tr>';
        });
        $("#tablerowsubcategory").html(cols);
    });
}

function searchContents(input) {
    var cols;
    $.post("/search/contents", {
        queryString: "" + input + ""
    }, function(data) {
        if (data === false) {
            cols = "";
            cols += "<tr>";
            cols += '<td colspan="5" style="text-align:center">Nada encontrado. Pesquise pelo nome ou subcategoria.</td></tr>';
        }
        jQuery.each(data, (key, value) => {
            /*LOAD TABLE */
            cols += "<tr>";
            cols += '<td>' + value.title + '</td>';
            cols += '<td>' + value.subcategory.name + '</td>';
            var url_file = value.file.url;
            cols += "<td><a href=\"javascript:void(0)\" onclick=\"popup('"+url_file+"','"+value.title+"')\">Abrir Arquivo</a></td>";
            cols += '<td>' + moment.parseZone(value.created_at).format('DD/MM/YYYY HH:mm:ss'); + '</td>';
            cols += '<td> <a href="/contents/' + value.id + '/edit"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span> </a>';
            cols += '<i style="margin-left:3px"></i> <a data-confirm="Você tem certeza?" rel="nofollow" data-method="delete" href="/contents/' + value.id + '"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></a></td>';
            cols += '</tr>';
        });
        $("#contents_search").html(cols);
    });
}
function searchTeachers(input) {
    var cols;
    $.post("/search/teachers", {
        queryString: "" + input + ""
    }, function(data) {
        if (data === false) {
            cols = "";
            cols += "<tr>";
            cols += '<td colspan="4" style="text-align:center">Nada encontrado.</td></tr>';
        }
        jQuery.each(data, (key, value) => {
            /*LOAD TABLE */
            cols += "<tr>";
            cols += '<td>' + value.name + '</td>';
            cols += '<td>' + value.category.name + '</td>';
            cols += '<td>' + moment.parseZone(value.created_at).format('DD/MM/YYYY HH:mm:ss'); + '</td>';
            cols += '<td> <a href="/teachers/' + value.id + '/edit"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span> </a>';
            cols += '<i style="margin-left:3px"></i> <a data-confirm="Você tem certeza?" rel="nofollow" data-method="delete" href="/teachers/' + value.id + '"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></a></td>';
            cols += '</tr>'; 
        });
        $("#tablerowteachers").html(cols);
    });
}
function searchlesson(input) {
    var cols;
    $.post("/search/lessons", {
        queryString: "" + input + ""
    }, function(data) {
        if (data === false) {
            cols = "";
            cols += "<tr>";
            cols += '<td colspan="8" style="text-align:center">Nada encontrado.</td></tr>';
        }
        jQuery.each(data, (key, value) => {
            /*LOAD TABLE */
            cols += "<tr>";
            //cols += '<td>' + value.subcategory.category.name + '</td>';
            cols += '<td>' + value.subcategory.name + '</td>';
            cols += '<td>' + value.teacher.name + '</td>';
            cols += '<td>' + moment.parseZone(value.date).format('L'); + '</td>';
            cols += '<td>' + moment.parseZone(value.lesson_hour_start).format('HH:mm') + '-' + moment.parseZone(value.lesson_hour_end).format('HH:mm') + '</td>';
            cols += '<td>' + value.limit + '</td>';
            cols += '<td>' + moment.parseZone(value.created_at).format('DD/MM/YYYY HH:mm:ss'); + '</td>';
            cols += '<td> <a href="/lessons/' + value.id + '/edit"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span> </a>';
            cols += '<i style="margin-left:3px"></i> <a data-confirm="Você tem certeza?" rel="nofollow" data-method="delete" href="/lessons/' + value.id + '"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></a></td>';
            cols += '</tr>'; 
        });
        $("#tablerowlessons").html(cols);
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
                    cols += '<td>' + moment.parseZone(value.birthday).format('DD/MM/YYYY'); + '</td>';
                    if(value.blocked===false){
                      cols +='<td>' + 'Ativo' + '</td>';
                    } else {
                      cols += '<td>' + 'Inativo' + '</td>';
                    }
                    cols += '<td>' + moment.parseZone(value.created_at).format('DD/MM/YYYY HH:mm:ss'); + '</td>';
                    cols += '<td> <a href="/users/' + value.id + '/edit"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-left: 5px"></span> </a>';
                    cols += '<i style="margin-left:3px"></i> <a data-confirm="Você tem certeza?" rel="nofollow" data-method="delete" href="/users/' + value.id + '"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-left: 20px"></span></a></td>';
                    cols += '</tr>';        
    }); 
    $("#tablerowusers").html(cols);
  });
}
               


function popup(mylink, windowname) {
    if (!window.focus) return true;
    var href;
    if (typeof(mylink) == 'string') href = mylink;
    else href = mylink.href;
    window.open(href, windowname, 'width=800,height=600,scrollbars=yes');
    return false;

}