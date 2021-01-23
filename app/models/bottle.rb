class Bottle < ApplicationRecord
    belongs_to :unit
    belongs_to :wine
end
