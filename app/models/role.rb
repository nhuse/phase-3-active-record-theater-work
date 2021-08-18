class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        self.all
    end

    def actors
        Audition.all.map do |audition|
            audition.actor
        end
    end

    def locations
        Audition.all.map do |audition|
            audition.location
        end
    end

    def lead
         if Audition.where(hired: true).length == 0
            "no actor has been hired for understudy for this role"
            # Audition.where(hired: true).first
         else 
            Audition.where(hired: true).first
         end
    end

    def understudy
        if Audition.where(hired: true).length <= 1
            'no actor has been hired for understudy for this role'
            # Audition.where(hired: true).first
         else 
            Audition.where(hired: true)[1]
         end
    end
end

# def actors
#     self.all.map do |audition|
#         audition.name
#     end
# end

        # if Audition.find_by("hired = true") == nil
        #   'no actor has been hired for this role'
        # end