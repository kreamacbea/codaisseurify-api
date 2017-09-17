// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .
function submitSong() {
  var inputField = document.getElementById("new-song");
  var newSong = inputField.value;
  createSong(newSong);
  inputField.value = null;

  function createSong(title) {
    var listItem = document.createElement("li");
    listItem.className = "song-list-item";
    var newSong = document.createElement("label");
    label.innerHTML = title;

    listItem.appendChild(newSong);

    var list = document.getElementById("song-list");
    list.appendChild(listItem);

    function nextSongId() {
      return document.getElementsByClassName("song-list-item").length + 1;
    }
  }
  console.log();
}

function toggleDelete() {
  var checkbox = this;

  if (checkbox.checked) {
    checkbox.parentElement.className = "song-list-item selected";
  } else {
    checkbox.parentElement.className = "song-list-item";
  }
  console.log();
}

// function selectAll() {
//   var checkbox = this;
//   checkbox.checked
// }

function deleteSongs() {
  var list = document.getElementById("song-list");
  var songsToDelete = document.getElementsByClassName("song-list-item selected");

  for (var i = songsToDelete.length; i > 0; i--) {
    list.removeChild(songsToDelete[i-1]);
  }
  console.log();
}
