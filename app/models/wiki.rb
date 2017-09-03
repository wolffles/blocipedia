class Wiki < ApplicationRecord
  belongs_to :user


  default_scope { order(created_at: :desc) }

  #trying to add option to change order of scope
  scope :ordered_by_title, -> { reorder(title: :asc) }
  scope :ordered_by_reverse_created_at, -> { reorder(created_at: :ASC)}
  #scope :user_order, lambda { order("#{current_user.order_column} #{current_user.order_direction}")}


end
