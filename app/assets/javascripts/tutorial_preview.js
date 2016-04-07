// Once user has completed a search and its search results have 
// been displayed on the page, the user should be able to click 
// on the word 'preview' and get a preview in the
// form of an overlay window that shows info such as:
// description, number of  chapters, estimated completion time.

// What triggers the preview info? Clicking on 'preview'
// For now, we can still display the info we need without
// the use of XHR.



//   var results = document.getElementsByClassName("results");

//   for (i = 0; i < results.length; i++) {
//     results[i].firstChild.addEventListener("mouseover", function(event){ 
//       var previewWindow = event.target.parentElement.nextElementSibling;    
//       previewWindow.style.display = "block";
//     });

//     results[i].firstChild.addEventListener("mouseout", function(event) { 
//       var previewWindow = event.target.parentElement.nextElementSibling;      
//       previewWindow.style.display = "none";          
//     });
//   }


// Here's how I imagine this will have to work. 

// Event listeners will have to be set up so that when a link (or preferably a thumbnail image of a tutorial) is clicked:
// 1. a new div is created. 
// 2. We would need to have a view file that contains all of the data needed to fill the div with. 
//    a). An HXR would be triggered that would request all the data from the view designated for the XHR, and this data would be stored in a variable?
//    b). We would then use some JQuery magic to create said div taking in the variable (containing the data) so that the data gets put inside of the div.
// 3. I have no idea what will need to be done CSS-wise to make it look like a little window box... thing.
// The above order is not necessarily accurate or meaningful. 

window.addEventListener("load", function(){

  var results = document.getElementsByClassName("results");
  for (i = 0; i < results.length; i++) {
    results[i].childNodes[2].addEventListener("click", function(event){
      var previewWindow = event.target.parentElement.nextElementSibling;
      var tutorialUrl = event.target. parentElement.firstChild.href;

      var loadTutorialPreview = function(){
        var tutorialRequest = new XMLHttpRequest();
        tutorialRequest.open ("GET", tutorialUrl);

        tutorialRequest.addEventListener("load", function(event) {
          var thisRequest = event.target;
          var data = thisRequest.responseText; 
          previewWindow.style.display = "block";
          previewWindow.innerHTML = data; 
        });
        tutorialRequest.send();
      };
      loadTutorialPreview();
    });
    results[i].childNodes[2].addEventListener("mouseleave", function(event){
      var previewWindow = event.target.parentElement.nextElementSibling;
      previewWindow.style.display = "none";
    });
  }
});






