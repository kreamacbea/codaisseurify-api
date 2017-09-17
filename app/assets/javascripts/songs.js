function submitSong() {
  var inputFieldTitle = document.getElementById("new-song-title");
  var newSongTitle = inputFieldTitle.value;
  var inputFieldLength = document.getElementById("new-song-length");
  var newSongLength = inputFieldLength.value;
  createSong(newSongTitle, newSongLength);

  inputField.value = null;

  function createSong(title) {
    var listItemTitle = document.createElement("li");
    listItemTitle.className = "song-list-title";
    var newSongTitle = document.createElement("p");
    p.innerHTML = title;

    var listItemLength = document.createElement("li");
    listItemLength.className = "song-list-length";
    var newSongLength = document.createElement("p");
    p.innerHTML = length;

    listItem.appendChild(newSongTitle, newSongLength);

    var list = document.getElementById("song-list");
    list.appendChild(listItemTitle, listItemLength);
  }
}
