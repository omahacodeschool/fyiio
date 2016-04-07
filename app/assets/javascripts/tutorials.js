

$("#showNewChapterForm").on('click', function(event){
      var showButton = event.target;
      var chapterForm = document.getElementById("new_chapter_form");
      chapterForm.style.display = "";
      $("#showNewChapterForm").hide();
    });
