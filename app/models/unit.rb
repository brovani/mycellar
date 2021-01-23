class Unit < ApplicationRecord
    belongs_to :place
    has_many :bottles
    has_many :wines, through: :bottles
end
