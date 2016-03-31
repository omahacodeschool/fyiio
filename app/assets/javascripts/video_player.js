window.onload = function() {
  var chapterPlayer = videojs('chapter-video');
  var stepPlayer = videojs('step-video');
  var chapterStartTime = document.getElementById("chapter_start_time");
  var chapterEndTime = document.getElementById("chapter_end_time");
  var stepStartTime = document.getElementById("step_start_time");
  var stepEndTime = document.getElementById("step_end_time");
  var chapterStartButton = document.getElementById("setChapterStartTime");
  var chapterEndButton = document.getElementById("setChapterEndTime");
  var stepStartButton = document.getElementById("setStepStartTime");
  var stepEndButton = document.getElementById("setStepEndTime");

  function captureVideoStartTime(start, player){
    start.value = player.currentTime();
    player.pause();
  };

  function captureVideoEndTime(end, player){
    end.value = player.currentTime();
    player.pause();
  };

  chapterStartButton.addEventListener("click", function(){
    var startOutcome = captureVideoStartTime(chapterStartTime, chapterPlayer);
  });

  chapterEndButton.addEventListener("click", function(){
    var endOutcome = captureVideoEndTime(chapterEndTime, chapterPlayer);
  });

  stepStartButton.addEventListener("click", function(){
    var startOutcome = captureVideoStartTime(stepStartTime, stepPlayer);
  });

  stepEndButton.addEventListener("click", function(){
    var endOutcome = captureVideoEndTime(stepEndTime, stepPlayer);
  });
};