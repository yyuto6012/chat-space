$(function(){
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
      console.log(data)
    })
    .fail(function(){
      alert('error');
    });
  });
});
