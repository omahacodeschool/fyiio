

$("#showNewChapterForm").on('click', function(event){
      var showButton = event.target;
      var chapterForm = document.getElementById("new_chapter_form");
      chapterForm.style.display = "";
      $("#showNewChapterForm").hide();
    });

$(document).ready(function () {
  $('.chapterContentDisplay').hide();
  $('#chapterTitlesAndDescriptions').show();
  $('.showChapterTab').on('click', function (event) {
    var tabLink = event.target;
    var chapterId = tabLink.parent.value;
    var chapterDisplayDiv = document.getElementById(chapterId);
    $('#chapterTitlesAndDescriptions').hide();
    $('.chapterContentDisplay').hide();
    chapterDisplayDiv.show();
  // $('.showChapterTab').on('click', function(event) {
  //   var tab = event.target;
  //   var chapterNumber = tab.value;
  //   $('#'+chapterNumber).show();
  })

  // $('#option1').show();
  // $('#selectMe').change(function () {
  //   $('.group').hide();
  //   $('#'+$(this).val()).show();
  });
// });


// $(document).ready(function () {
//   $('.group').hide();
//   $('#option1').show();
//   $('#selectMe').change(function () {
//     $('.group').hide();
//     $('#'+$(this).val()).show();
//   })
// });