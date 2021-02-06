class MyServer

    def call(env)
        return [ 200, {'Content-Type' => 'text/html'}, pretty_response ]
    end
    
    def pretty_response
      (Time.now.to_i % 2).zero? ?  ["<em>Hello</em>"] : ["<strong>Hello</strong>"]
    end

end
class Application

    def call(env)
        resp = Rack::Response.new
    
        hour_now = Time.now.hour
    
        if hour_now < 12
          resp.write "Good Morning!"
        else
          resp.write "Good Afternoon!"
        end
    
        resp.finish
      end
end
