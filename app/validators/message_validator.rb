class MessageValidator < ActiveModel::Validator
  def validate(record)  
    if record.body.blank? && record.image.blank?
      record.errors[:base] << "テキストまたはイメージを入力してください。"
    end
  end
end