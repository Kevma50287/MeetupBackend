class Chat < ApplicationRecord
    has_many :messages

    def last_message 
        self.messages[-1]
    end

    def last_user
        self.last_message.user
    end
end
