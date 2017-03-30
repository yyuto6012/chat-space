$(function() {

  function buildAddList(user) {
    var id = user.id;
    var name = user.name;
    var list = "<div class='add-user' clearfix>" +
                  "<p class='add-user__name'>" +
                  name +
                  "</p>" +
                  "<a id='add-user__btn' data-id=" + id + " data-name=" + name + ">追加</a>" +
                  "<hr class='add-user__line'>" +
                "</div>";
    return list;
  };

  function buildAddUser(user_id, user_name) {
    var list = "<div class='users' clearfix>" +
               "<input type='hidden' name='group[user_ids][]' value="+ user_id +" />" +
               "<p class='users__name'>" +
               user_name +
               "</p>" +
               "<a id='remove-user__btn' data-id=" + user_id + " data-name=" + user_name + ">削除</a>" +
               "</div>"
    return list;
  };

  function AddUser(user_id, user_name) {
        var list = buildAddUser(user_id, user_name);
        $('.add-users').append(list);
  };

  $('.chat-group-form__field--right').on('keyup', '.chat-users-form', function(e){
      var textField = $('.chat-users-form');
      var keyword = textField.val();
      $.ajax({
          type: 'GET',
          url:  '/users/search',
          data: { keyword: keyword },
          dataType: 'json'
        })
      .done(function(data){
        $(".add-user").remove();
        $.each(data.users, function(i, user){
            var list = buildAddList(user);
            $('.results').append(list);
          return false;
        });
      });
  });

  $('.chat-group-form__field--right').on('click', '#add-user__btn', function() {
      var user_id = $(this).data('id')
      var user_name = $(this).data('name')
      AddUser(user_id, user_name);
  });

  $('.chat-group-form__field--right').on('click', '#remove-user__btn',  function(){
    var user = $(this).parent();
    user.remove();
  });

});

