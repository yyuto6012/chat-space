$(function(){
  function buildHTML(message) {
    var html = "<li class='message'>" +
               "<div class='user_name'>" +
               message.name +
               "</div>" +
               "<div class='message_body'>" +
               message.body +
               "</div>" +
               "</li>";
    $('.messages').append(html);
  };

  $('.send-message').on('submit', function(e){
    e.preventDefault();
    var textField = $('.input_message');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: './messages.json',
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      buildHTML(data['message']);
      textField.val('');
    })
    .fail(function(){
      alert('error')
    });
  });
});
