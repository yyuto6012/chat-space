$(function(){
  function buildHTML(message) {
    var html1 = $('.user_name').append(message.name);
    var html2 = $('.message_body').append(message.body);
    return html1, html2 ;
  }

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
      var html = buildHTML(data);
    $('.message').append(html);
      textField.val('');
    })
    .fail(function(){
      alert('error')
    });
  });
});
