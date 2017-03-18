json.messages @messages do |message|
  json.body message.body
  json.image message.image.url
  json.name message.user.name
end
