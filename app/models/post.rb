class Post < ApplicationRecord

  include Sluggable

  scope :online, -> (online) { where(online: online)}
  scope :published, -> {where(online: 1)}
  scope :offline, -> {where(online: 0)}
  scope :alpha, -> {order(name: :asc)}

  def as_json(options = nil)
    super(only:[:name, :id, :created_at])
  end

end