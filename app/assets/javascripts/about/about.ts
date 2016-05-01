/// <reference path="../typings/angular.d.ts" />

function teamHideShowSections(elem) {
  var selected_section_id = elem.id.split("_")[0];
  var selected_section = document.getElementById(selected_section_id);


  if (!selected_section.classList.contains("section-active")) {
    var sections = document.getElementsByClassName("about-us-sections");
    var i;
  
    for (i = 0; i < sections.length; i++) {
       $('#' + sections[i].id).fadeOut(10);
       document.getElementById(sections[i].id).classList.remove("section-active");
    }
  
    selected_section.classList.add("section-active");
    setTimeout(function() {}, 200);
    $('#' + selected_section_id).fadeIn(500);
  }
}
