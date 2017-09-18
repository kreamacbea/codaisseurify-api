function toggleSelect() {
  var checkbox = this;
  var listItem = $(this).parent().parent();

  var songId = listItem.data('id');
  var isSelected = !listItem.hasClass("succes");

  $.ajax({
    type: "PUT",
    url: "/artist/songs/" + songId + ".json",
    data: JSON.stringify({
      song: { selected: isSelected }
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .select(function(data) {
    console.log(data);

    listItem.toggleClass("success", data.selected);
  });
}

function createSong(title) {
  var newSong = { title: title, selected: false };

  $.ajax({
    type: "POST",
    url: "/artists/songs.json",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .select(function(data) {
    console.log(data);

    var checkboxId = data.id;

    var label = $('<label></label>')
      .attr('for', checkboxId)
      .html(title);

    var checkbox = $('<input type="checkbox" value="1" />')
      .attr('id', checkboxId)
      .bind('change', toggleSelect);

    var listItem = $('<li class="song"></ul>')
      .attr('data-id', checkboxId)
      .append($('<ul>').append(checkbox))
      .append($('<ul>').append(label));

    $("#songList").append(listItem);
  })

  .fail(function(error) {
    console.log(error)
    error_message = error.responseJSON.title[0];
    showError(error_message);
  });
}

function showError(message) {
  var errorHelpBlock = $('<span class="help-block"></span>')
    .attr('id', 'error_message')
    .text(message);

  $("#formgroup-title")
    .addClass("has-error")
    .append(errorHelpBlock);
}

function resetErrors() {
  $("#error_message").remove();
  $("#formgroup-title").removeClass("has-error");
}

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#song_title").val());
  $("#song_title").val(null);
}

function deleteSelectedSongs(event) {
  event.preventDefault();

  $.each($(".success"), function(show, listItem) {
    songId = $(listItem).data('id');
    deleteSong(songId);
  });
}

function deleteSong(songId) {
  $.ajax({
    type: "DELETE",
    url: "/artists/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"
  })
  .select(function(data) {
    $('li[data-id="'+songId+'"]').remove();
  });
}


$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleSelect);
  $("form").bind('submit', submitSong);
  $("#delete").bind('click', deleteSelectedSongs);
});
