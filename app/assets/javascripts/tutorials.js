

$("#showNewChapterForm").on('click', function(event){
      var showButton = event.target;
      var chapterForm = document.getElementById("new_chapter_form");
      chapterForm.style.display = "";
      $("#showNewChapterForm").hide();
    });


$("#tutorialOverview").on('click', function() {
  $("#chapterTitlesAndDescriptions").show();
  $(".chapterDisplay").hide();
});

$(".showChapterTab").on('click', function(event) {
  var li = event.target;
  var currentChapter = li.parentElement.value;
  $("#chapterTitlesAndDescriptions").hide();
  $(".chapterDisplay").hide();
  $("#chapterContentDisplay" + currentChapter).show();
})


//   $('#tutorial').show();
//   // $('#chapterTitlesAndDescriptions').show();
//   $('#chapterDisplay').hide();

//   $('.showChapterTab').on('click', function (event) {
//     var chapterTab = event.target;
//     var chapterId = chapterTab.parentElement.value;
//     // var chapterDisplay = document.getElementById("chapter"+chapterId)
//     // var chapterDisplayDiv = document.getElementById(chapterId);
//     $('#chapterTitlesAndDescriptions').hide();
//     $('.chapterContentDisplay').hide();
//     $('#chapterContentDisplay'+chapterId).show();
//     // chapterDisplay.style.display = "";
//     // $('#chapter'+$(chapterId).val()).show();
//   // $('.showChapterTab').on('click', function(event) {
//   //   var tab = event.target;
//   //   var chapterNumber = tab.value;
//   //   $('#'+chapterNumber).show();
//   })

//   // $('#option1').show();
//   // $('#selectMe').change(function () {
//   //   $('.group').hide();
//   //   $('#'+$(this).val()).show();
//   });
// // });


// $(document).ready(function () {
//   $('.group').hide();
//   $('#option1').show();
//   $('#selectMe').change(function () {
//     $('.group').hide();
//     $('#'+$(this).val()).show();
//   })
// });