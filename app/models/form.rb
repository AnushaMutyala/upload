class Form < ApplicationRecord
    validates :firstname ,:lastname, presence: true
end
