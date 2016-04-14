// This bit of code toggles the visibility of search results based on their category

if ($(".resultsPresent").length > 0){
  $('#CATEGORY1').click(function(){
    $('.results').hide()
    $('.category1').toggle();
  });

  $('#CATEGORY2').click(function(){
    $('.results').hide()
    $('.category2').toggle();
  });

  $('#CATEGORY3').click(function(){
    $('.results').hide()
    $('.category3').toggle();

  });

  $('#CATEGORY4').click(function(){
    $('.results').hide()  
    $('.category4').toggle();

  });

  $('#CATEGORY5').click(function(){
    $('.results').hide()
    $('.category5').toggle();
  });
}
       