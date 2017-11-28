$(document).ready(function(){
    $(document).bind("ajax:success",function(){
      $('table').append("<tr><td>" + $("input[name='book_suggestion[title]'").val() +
                        "</td><td>" + $("input[name='book_suggestion[author]'").val() +
                        "</td><td>" + $("input[name='book_suggestion[link]'").val() +
                        "</td><td>" + $("input[name='book_suggestion[year]'").val() +
                        "</td><td>" + $("input[name='book_suggestion[publisher]'").val() +
                        "</td><td>" + $("input[name='book_suggestion[editorial]'").val() +
                        "</td><td>" + $("input[name='book_suggestion[price]'").val() +"</td></tr>");
  });
  $(document).bind("ajax:error",function(e){
    alert(e.originalEvent.detail[0].errors[0]);
  });
});
