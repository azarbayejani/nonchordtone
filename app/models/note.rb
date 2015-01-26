require 'hashids'

class Note < ActiveRecord::Base

    after_create :create_uid

    def create_uid
        hashid = Hashids.new('salt blah blah')
        update_attribute(:uid, hashid.encode(self.id))
    end
end
