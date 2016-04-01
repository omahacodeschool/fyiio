window.addEventListener("load", function(){
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

    $("#setStepStartTime").on('click', function(){
      var stepStartTime = document.getElementById("step_start_time");
      captureVideoStartTime(stepStartTime);
    });

    $("#setStepEndTime").on('click', function(){
      var stepEndTime = document.getElementById("step_end_time");
      captureVideoEndTime(stepEndTime);
    });
  }

  if (document.getElementById('view-video') != undefined || document.getElementById('view-video') != null) {
    var myPlayer = videojs('view-video');

    $("stepVideoPlayerTrigger").on('click', function(){
      var startTime = $(".stepVideoPlayerTrigger").attr("value");
      myPlayer.currentTime(startTime);
    });
  }
});