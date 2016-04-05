// Once user has completed a search and its search results have 
// been displayed on the page, the user should be able to click 
// on the word 'preview' and get a preview in the
// form of an overlay window that shows info such as:
// description, number of  chapters, estimated completion time.

// What triggers the preview info? Clicking on 'preview'
// For now, we can still display the info we need without
// the use of XHR.

window.addEventListener("load", function(){

  var previewLinks = document.getElementsByClassName("previewLink");
  
  for (i = 0; i < previewLinks.length; i++) {
    previewLinks[i].addEventListener("click", function(event){ 
    var previewWindow = event.target.nextSibling;    
    previewWindow.style.display = "block";
    });
  }
});
