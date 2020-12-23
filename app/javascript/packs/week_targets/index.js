import 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../../src/lib";

$(function() {
  navbarCollapse();
  
  $.ajax({
    url: location.href,
    type: "GET", 
    dataType: "script"
  })
});