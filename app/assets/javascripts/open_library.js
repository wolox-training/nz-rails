$('form#isbn_form').ready(function(){
  $('form#isbn_form').bind("ajax:success",function(data){
      $(".main-section").empty();
      $(".main-section" ).append("<ul><li>Author: " + data.detail[0].authors[0].name +
        "</li><li>Title: "+ data.detail[0].title +
        "</li><li>Subtitle: "+ data.detail[0].subtitle +
        "</li><li>Number of pages : "+ data.detail[0].number_of_pages +
        "</li></ul>");
  });

  $('form#isbn_form').bind("ajax:error",function(){
      $(".main-section").empty();
      alert("Book NOT found");
  });
});
