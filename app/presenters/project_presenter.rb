class ProjectPresenter < SimpleDelegator

  def self.wrap(collection)
    collection.map { |o| new(o) }
  end

  def hourly_rate_or_empty
    @hourly_rate ||= model.billable.blank? ? "---" : model.hourly_rate
  end

  def currency_or_empty
    @currency ||= model.billable.blank? ? "---" : model.currency
  end

  def members
    model.users.map{|u| u.first_name}.join(", ")
  end

  def model
    __getobj__
  end
end