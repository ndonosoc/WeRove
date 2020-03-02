class Interest < ApplicationRecord
  belongs_to :parent, class_name: "Interest", optional: true
  has_many :subinterests, class_name: "Interest", foreign_key: :parent_id
end
