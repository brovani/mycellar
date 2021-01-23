class Wine < ApplicationRecord
    belongs_to :producer
    has_many :bottles
    has_many :units, through: :bottles
end
