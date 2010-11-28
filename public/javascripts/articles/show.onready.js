$.template('commentTemplate', "<li><p class='content'>${content}</p><p class='meta'>by ${author}</p></li>");

$(document).ready(function() {

  var addComment = function(parent, comment) {
    var li = $.tmpl('commentTemplate', comment);
    li.hide().appendTo(parent).fadeIn();
  };

  $.getJSON($('[data-comments]').attr('data-comments'), function(data) {
    $(data).each(function() {
      addComment($('.comments'), this.comment);
    });
  });

  var jug = new Juggernaut();
  jug.subscribe($('[data-channel]').attr('data-channel'), function(data) {
    addComment($('.comments'), $.parseJSON(data).comment);
  });

  $('#new_comment').ajaxForm({
    success: function() {
      $('#comment_content').val('');
    }
  });

});
