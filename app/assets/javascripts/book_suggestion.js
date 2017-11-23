$(document).ready(function(){
  $("input").click(function(){
    var id =$('form').attr('id');
    debugger
    $.ajax({
      url : '/book_suggestions/' + id,
      type : 'GET',
      dataType : 'json',
      success : function(book_suggestion) {
          $('table').append("<tr><td>" + book_suggestion.title +
                            "</td><td>" + book_suggestion.author +
                            "</td><td>" + book_suggestion.link +
                            "</td><td>" + book_suggestion.year +
                            "</td><td>" + book_suggestion.publisher +
                            "</td><td>" + book_suggestion.editorial +
                            "</td><td>" + book_suggestion.price +"</td></tr>");
      },
      error : function() {
          var id =$('form').attr('id');
          console.log("story", id, "story");
      }
    });
  });
});
