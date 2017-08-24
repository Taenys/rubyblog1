class NameValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value.nil? || value.length != 2
      message = options[:message] || 'Le champ doit contenir 2 caractères'
      record.errors.add(attribute, message)
    end

  end


end