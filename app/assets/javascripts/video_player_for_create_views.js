window.onload = function() {
  if (document.getElementById('my-video') != undefined || document.getElementById('my-video') != null) {
  var myPlayer = videojs('my-video');

  function captureVideoStartTime(start){
    start.value = myPlayer.currentTime();
    myPlayer.pause();
  };

  function captureVideoEndTime(end){
    end.value = myPlayer.currentTime();
    myPlayer.pause();
  };

  $("#setChapterStartTime").on('click', function(){
    var chapterStartTime = document.getElementById("chapter_start_time");
    captureVideoStartTime(chapterStartTime);
  });

  $("#setChapterEndTime").on('click', function(){
    var chapterEndTime = document.getElementById("chapter_end_time");
    captureVideoEndTime(chapterEndTime);
  });

  $("#setStepStartTime").on('click', function(){
    var stepStartTime = document.getElementById("step_start_time");
    captureVideoStartTime(stepStartTime);
  });

  $("#setStepEndTime").on('click', function(){
    var stepEndTime = document.getElementById("step_end_time");
    captureVideoEndTime(stepEndTime);
  });
}
}
