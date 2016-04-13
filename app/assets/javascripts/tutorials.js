

$("#showNewChapterForm").on('click', function(event){
      var showButton = event.target;
      var chapterForm = document.getElementById("new_chapter_form");
      chapterForm.style.display = "";
      $("#showNewChapterForm").hide();
    });

$(".chapterDisplay").hide();

$("#tutorialOverview").on('click', function() {
  $("#chapterTitlesAndDescriptions").show();
  $(".chapterDisplay").hide();
});

$(".showChapterTab").on('click', function(event) {
  var li = event.target;
  $("#tutorialOverview").parent().removeClass("active");
  li.className += " active";
  var currentChapter = li.parentElement.value;
  $("#chapterTitlesAndDescriptions").hide();
  $(".chapterDisplay").hide();
  $("#chapterContentDisplay" + currentChapter).show();
});

