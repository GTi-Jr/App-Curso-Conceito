


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
var dataFULL;
function searchlesson(input,datat) {
    var cols;
    $.post("/search/lessons", {
        queryString: "" + input + "",
        date_range: "" + datat + ""
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
            cols += '<td>' + moment.parseZone(value.date_t).format('DD/MM/YYYY') + '</td>';
            cols += '<td>' + moment.parseZone(value.lesson_hour_start).format('HH:mm') + ' até ' + moment.parseZone(value.lesson_hour_end).format('HH:mm') + '</td>';
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
               
function searchSubscribeds(input, lesson_id) {
  var cols;
  $.post("/search/subscribeds", {queryString: "" + input + "",lesson_id: lesson_id}, function(data) {
    if (data===false){

        cols = "";
        cols += "<tr>";
        cols += '<td colspan="3" style="text-align:center">Nada encontrado</td></tr>';
    }

    jQuery.each(data, (key, value) => {
               /*LOAD TABLE */
                    cols += "<tr>";
                    if (value.user.image===null){
                      cols += '<td><img class="circular" src="/images/default_user.jpeg"/></td>';
                    } else {
                      cols += '<td><img class="circular" src="'+ value.user.image+ '"/></td>';
                    }
                    cols += '<td>' + value.user.name + '</td>';
                    if(value.is_present===true) {
                        cols += '<td> <input type="checkbox" name="present" id="present" value="true" onclick="change_presence('+value.id+', this)" checked > </td>';
                    } else {
                        cols += '<td> <input type="checkbox" name="present" id="present" value="true" onclick="change_presence('+value.id+', this)" > </td>';
                    }
                    cols += '</tr>';        
    }); 
    $("#tablerow").html(cols);
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

/* date */
$(document).ready(function() {
    var start = moment();
    var end = moment();
    function cb(start, end) {
        $('#reportrange span').html(start.format('DD/MM/YYYY') + '-' + end.format('DD/MM/YYYY'));
    }
    $('#reportrange').daterangepicker({
        locale: {
            format: 'DD/MM/YYYY',
            applyLabel: 'Pesquisar',
            cancelLabel: 'Cancelar',
            fromLabel: 'De',
            toLabel: 'Para',
            customRangeLabel: 'Personalizado',
            daysOfWeek: ['Do', 'Se', 'Te', 'Qua', 'Qui', 'Sex', 'Sa'],
            monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'JUlho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        },
        showDropdowns: true,
        showWeekNumbers: true,
        startDate: start,
        endDate: end,
        ranges: {
            'Hoje': [moment(), moment()],
            'Amanhã': [moment().add(1, 'days'), moment().add(1, 'days')],
            'Ontem': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Últimos 7 dias': [moment().subtract(6, 'days'), moment()],
            'Este mês': [moment().startOf('month'), moment().endOf('month')],
        }
    }, cb);
     cb(start, end);

     $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
          dataFULL = picker.startDate.format('DD/MM/YYYY') +'-'+picker.endDate.format('DD/MM/YYYY')
          searchlesson($('#inputsearch').val(),dataFULL);
         // console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
    });

     $('input[id="lesson_date_t"]').daterangepicker({
        locale: {
            format: 'YYYY-MM-DD'
        }, 
        showDropdowns: true,
        singleDatePicker: true
       
    });

    $('#hour_aulas_s').daterangepicker({
        locale: {
            format: 'YYYY-MM-DD HH:mm'
        },
        timePicker: true,
        timePicker24Hour: true,
        singleDatePicker: true,
        showDropdowns: true
    });

     $('#hour_aulas_e').daterangepicker({
        locale: {
            format: 'YYYY-MM-DD HH:mm'
        },
        timePicker: true,
        timePicker24Hour: true,
        singleDatePicker: true,
        showDropdowns: true
    });




});

/* CHECKBOX PARA MARCAR SE O ALUNO ESTAVA OU NÃO PRESENTE NA AULA */

function change_presence(id_subscribed, check) {

    $.post("/updatesubs/subscribeds", {id: id_subscribed, is_present: check.checked}, function(data) {
        alert("Alterado com sucesso.");

    });

}
;
