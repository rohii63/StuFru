import Collapse from 'bootstrap/js/src/collapse';
import {navbarCollapse} from "../lib";

$(function() {
  navbarCollapse();
  
  $.ajax({
    url: location.href,
    type: "GET", 
    dataType: "script"
  })
});