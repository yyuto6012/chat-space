json.message do
  json.body @message.body
  json.name @message.user.name
end
