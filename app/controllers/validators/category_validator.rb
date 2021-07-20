class CategoryValidator < ActiveModel::Validator
  def validate(record)
    unless record.category == "Fiction" || record.category == "Non-Fiction"
      record.errors[:category] << "The post category must be either `Fiction` or `Non-Fiction`"
    end
  end
end