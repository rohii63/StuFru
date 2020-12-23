import 'bootstrap/js/src/collapse';
import Tab from 'bootstrap/js/src/tab';
import {navbarCollapse} from "../../src/lib";

$(function(){
  navbarCollapse();

  if (location.search.substring(5) == "following" ) {
    $("#pills-following-tab").tab('show');
  };
})