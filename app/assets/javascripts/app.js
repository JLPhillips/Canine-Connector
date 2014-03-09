$(document.ready(function() {

  $("#box").click(clickedBody());

  var clickedBody = function(){
    $("#box").css("background-color", "red");
  }

});