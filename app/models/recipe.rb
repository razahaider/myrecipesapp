class Recipe<ActiveRecord::Base
    belongs_to:chef
    validates :chef_id, presence: true
    validates :name, presence: true, length:{minimum:5, maximum:100}
    
    validates :summary, presence: true, length:{minimum:5, maximum:100}
    
    validates :description, presence: true, length:{minimum:5, maximum:100}
    
    validate:picture_size
 
    private 
    def picture_size
        if picture_size > 5.megabytes
            errors.add(:picture,"Should be less than 5mb")
        end
    end
end


