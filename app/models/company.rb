class Company < ApplicationRecord
    belongs_to :position, optional: true
end