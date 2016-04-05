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
  
        
    var ul = document.getElementById("myList");


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

    //append the Title li to the <ul> element
    ul.appendChild(li);

    //create <li> tag
    var draftLi = document.createElement("li");

 
    //create label for Draft, set it's for attribute, 
    //and append it to <li> element
    var labelDraft = document.createElement("label");
    labelDraft.setAttribute("for", idAttributDraft);
    var draftLabelText = document.createTextNode("Draft");
    labelDraft.appendChild(draftLabelText);
    draftLi.appendChild(labelDraft);
 
    //create input for Draft, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputDraft = document.createElement("INPUT");
    inputDraft.setAttribute("type", "checkbox");
    inputDraft.setAttribute("id", idAttributDraft);
    inputDraft.setAttribute("name", nameAttributDraft);
    draftLi.appendChild(inputDraft);

    //append the Title li to the <ul> element
    ul.appendChild(draftLi);

    //create <li> tag
    var warningLi = document.createElement("li");

 
    //create label for Warning, set it's for attribute, 
    //and append it to <li> element
    var labelWarning = document.createElement("label");
    labelWarning.setAttribute("for", idAttributWarning);
    var warningLabelText = document.createTextNode("Warning");
    labelWarning.appendChild(warningLabelText);
    warningLi.appendChild(labelWarning);
 
    //create input for Warning, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputWarning = document.createElement("INPUT");
    inputWarning.setAttribute("type", "checkbox");
    inputWarning.setAttribute("id", idAttributWarning);
    inputWarning.setAttribute("name", nameAttributWarning);
    warningLi.appendChild(inputWarning);

    //append the Title li to the <ul> element
    ul.appendChild(warningLi);


    //create <li> tag
    var descriptionLi = document.createElement("li");
 
    //create label for Description, set it's for attribute, 
    //and append it to <li> element
    var labelDescription = document.createElement("label");
    labelDescription.setAttribute("for", idAttributDescription);
    var descriptionLabelText = document.createTextNode("Description");
    labelDescription.appendChild(descriptionLabelText);
    descriptionLi.appendChild(labelDescription);
 
    //create input for Description, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputDescription = document.createElement("INPUT");
    inputDescription.setAttribute("type", "textarea");
    inputDescription.setAttribute("id", idAttributDescription);
    inputDescription.setAttribute("name", nameAttributDescription);
    descriptionLi.appendChild(inputDescription);

    //append the description li to the <ul> element
    ul.appendChild(descriptionLi);

     //create <li> tag
    var startTimeLi = document.createElement("li");
 
    //create label for StartTime, set it's for attribute, 
    //and append it to <li> element
    var labelStartTime = document.createElement("label");
    labelStartTime.setAttribute("for", idAttributStartTime);
    var startTimeLabelText = document.createTextNode("Start Time");
    labelStartTime.appendChild(startTimeLabelText);
    startTimeLi.appendChild(labelStartTime);
 
    //create input for StartTime, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputStartTime = document.createElement("INPUT");
    inputStartTime.setAttribute("type", "text");
    inputStartTime.setAttribute("id", idAttributStartTime);
    inputStartTime.setAttribute("name", nameAttributStartTime);
    startTimeLi.appendChild(inputStartTime);

    //append the StartTime li to the <ul> element
    ul.appendChild(startTimeLi);

    //create <li> tag
    var endTimeLi = document.createElement("li");
 
    //create label for EndTime, set it's for attribute, 
    //and append it to <li> element
    var labelEndTime = document.createElement("label");
    labelEndTime.setAttribute("for", idAttributEndTime);
    var endTimeLabelText = document.createTextNode("End Time");
    labelEndTime.appendChild(endTimeLabelText);
    endTimeLi.appendChild(labelEndTime);
 
    //create input for EndTime, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputEndTime = document.createElement("INPUT");
    inputEndTime.setAttribute("type", "text");
    inputEndTime.setAttribute("id", idAttributEndTime);
    inputEndTime.setAttribute("name", nameAttributEndTime);
    endTimeLi.appendChild(inputEndTime);

    //append the EndTime li to the <ul> element
    ul.appendChild(endTimeLi);

 
    //show step header
    $("#stepHeader").show(); 
}