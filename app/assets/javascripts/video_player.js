var myPlayer = videojs('my-video');
var startTime = document.getElementById("chapter_start_time");
var endTime = document.getElementById("chapter_end_time");

document.getElementById("setStartTime").addEventListener("click", function(){
  startTime.value = myPlayer.currentTime();
  myPlayer.pause()

});

document.getElementById("setEndTime").addEventListener("click", function(){
  endTime.value = myPlayer.currentTime();
  myPlayer.pause()
});