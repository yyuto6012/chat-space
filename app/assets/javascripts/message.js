$(document).on('turbolinks:load', function(){

  function buildHTML(message) {
    if (message.image) {
      var image = "<img src=" + message.image + ">";
    }
    else  {
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
      $('.messages').append(html);
  };

  function auto_load(newHTML){
    $('.messages').append(newHTML);
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
      buildHTML(data);
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
        var old_messages = $('.message').length;
        var new_messages = data.messages.length;
        var newHTML = '';
        for( i = old_messages; i < new_messages; i++ ) {
          newHTML += buildHTML(data.messages[i]);
          auto_load(newHTML);
          }
        })
  }, 30000);

});
