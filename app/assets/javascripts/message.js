$(document).on('turbolinks:load', function(){

  function buildHTML(message) {
    if (message.image) {
      var image = "<img src=" + message.image + ">";
    } else {
      var image = "";
    }

      var html = "<li class='message'>" +
                 "<div class='user_name'>" +
                 message.name +
                 "</div>" +
                 "<div class='message_body'>" +
                 message.body +
                 image +
                 "</div>" +
                 "</li>";
      return html;
      console.log(html);
  };

  $('.send-message').on('submit', function(e){
     e.preventDefault();
    $.ajax({
      type: 'POST',
      url: './messages',
      data: new FormData($(this).get(0)),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      $('#new_message')[0].reset();
      var html = buildHTML(data);
      $('.messages').append(html);
    })
    .fail(function(){
      alert('error');
    });
  });

  setInterval(function(){
    $.ajax({
        type: 'GET',
        url: './messages',
        dataType: 'json',
        })
        .done(function(data){
        var messages = data.messages;
        var newHTML = '';
        $('.messages').empty(messages);
        $.each(messages, function(i, message) {
          newHTML = buildHTML(message);
          $('.messages').append(newHTML);
          });
        })
  }, 10000);

});
