class UpdateNews
    def self.main
        begin
        Thread.new{
            GuardianFeed.main
        }
        rescue
        end
        
        begin
        Thread.new{
            CnnFeed.main
        }
        rescue
        end
        
        
        begin
        Thread.new{
            FoxnewsFeed.main
        }
        rescue
        end
        
        
        begin
        Thread.new{
            ExtremetechFeed.main
        }
        rescue
        end
    end
end
