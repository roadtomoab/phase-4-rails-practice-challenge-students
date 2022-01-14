class Student < ApplicationRecord
    belongs_to :instructor

    validates :name, presence: true
    validate :must_be_18_or_older

    def must_be_18_or_older
        unless age >= 18
            errors.add("students must be at least 18 years old")
        end
    end
end
