class Audition < ActiveRecord::Base
    belongs_to :roles

    def role
        Role.where(id: self.role_id)
    end

    def call_back
        self.hired = true
    end

    def self.all_false
        self.all.each do |audition|
            audition.hired = false
            audition.save
        end
    end
end