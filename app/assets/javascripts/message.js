$(function(){
  function buildHTML(message) {
    var html = "<li class='message'>" +
               "<div class='user_name'>" +
               message.name +
               "</div>" +
               "<div class='message_body'>" +
               message.body +
               message.image +
               "</div>" +
               "</li>";
    $('.messages').append(html);
  };

  $('.send-message').on('submit', function(e){
     e.preventDefault();
    // var fd = new FormData($(this).get(0));
    // var $file = $('.input_image');
    // var $textarea = $('.input_message');
    // fd.append('body', $textarea.val());
    // fd.append('image', $file.prop("files")[0]);
    $.ajax({
      type: 'POST',
      url: './messages',
      data: new FormData($(this).get(0)),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      buildHTML(data['fd']);
    })
    .fail(function(){
      alert('error');
    });
  });
});
