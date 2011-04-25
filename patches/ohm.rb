require 'ohm'

class Ohm

  class Model
    # initialize: added ability to pass redis_id and have it
    # define the actual Ohm ID.  (new? is broken in Ohm, BTW)
    alias_method :initialize_without_redis_id, :initialize
    def initialize_with_redis_id(args={})
      @redis_id = args.delete(:redis_id)
      initialize_without_redis_id(args)
    end
    alias_method :initialize, :initialize_with_redis_id

    def initialize_id
      @id ||= (@redis_id || self.class.key[:id].incr.to_s)
    end
    private :initialize_id


    # List#push_id (regular push needed an Ohm model,
    # when we know the id's before the objects are 
    # saved, we still would like to push them).
    class List
      def push_id(model_id)
        key.rpush(model_id)      
      end
    end
    
    # Set#push_id -- same as above..
    class Set
      def push_id(model_id)
        key.sadd(model_id)
      end
    end
    
  end
end
