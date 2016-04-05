function addStepField() {
 
    //create Date object
    var date = new Date();
 
    //get number of milliseconds since midnight Jan 1, 1970 
    //and use it for address key
    var mSec = date.getTime(); 
 
    //Replace 0 with milliseconds
    idAttributTitle =  
          "chapter_steps_attributes_0_title".replace("0", mSec);
    nameAttributTitle =  
          "chapter[steps_attributes][0][title]".replace("0", mSec);
 
    idAttributDraft =  
          "chapter_steps_attributes_0_draft".replace("0", mSec);
    nameAttributDraft =  
          "chapter[steps_attributes][0][draft]".replace("0", mSec);

    idAttributWarning =  
          "chapter_steps_attributes_0_warning".replace("0", mSec);
    nameAttributWarning =  
          "chapter[steps_attributes][0][warning]".replace("0", mSec);

    idAttributDescription =  
          "chapter_steps_attributes_0_description".replace("0", mSec);
    nameAttributDescription =  
          "chapter[steps_attributes][0][description]".replace("0", mSec);
 
    idAttributStartTime =  
          "chapter_steps_attributes_0_start_time".replace("0", mSec);
    nameAttributStartTime =  
          "chapter[steps_attributes][0][start_time]".replace("0", mSec);

    idAttributEndTime =  
          "chapter_steps_attributes_0_end_time".replace("0", mSec);
    nameAttributEndTime =  
          "chapter[steps_attributes][0][end_time]".replace("0", mSec);
  
        
    //create <li> tag
    var li = document.createElement("li");
 
    //create label for Title, set it's for attribute, 
    //and append it to <li> element
    var labelTitle = document.createElement("label");
    labelTitle.setAttribute("for", idAttributTitle);
    var titleLabelText = document.createTextNode("Title");
    labelTitle.appendChild(titleLabelText);
    li.appendChild(labelTitle);
 
    //create input for Title, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputTitle = document.createElement("INPUT");
    inputTitle.setAttribute("type", "text");
    inputTitle.setAttribute("id", idAttributTitle);
    inputTitle.setAttribute("name", nameAttributTitle);
    li.appendChild(inputTitle);
 
    //create label for Street, set it's for attribute, 
    //and append it to <li> element
    var labelStreet = document.createElement("label");
    labelStreet.setAttribute("for", idAttributStreet);
    var streetLabelText = document.createTextNode("Street");
    labelStreet.appendChild(streetLabelText);
    li.appendChild(labelStreet);
 
    //create input for Street, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputStreet = document.createElement("INPUT");
    inputStreet.setAttribute("type", "text");
    inputStreet.setAttribute("id", idAttributStreet);
    inputStreet.setAttribute("name", nameAttributStreet);
    li.appendChild(inputStreet);
 
    //add created <li> element with its child elements 
    //(label and input) to myList (<ul>) element
    document.getElementById("myList").appendChild(li);
 
    //show address header
    $("#stepHeader").show(); 
}