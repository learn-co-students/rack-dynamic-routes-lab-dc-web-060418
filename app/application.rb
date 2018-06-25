
class Application
  @@items =[]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      #-----Theory: this doesn't quite work because the 400 acts as a return? and will stop the process if it isn't the first item.
       # @@items.each do |item_obj|
       #    if item_obj.name == item_name
       #      resp.write item_obj.price
       #    else
       #      resp.write "Item not found"
       #      resp.status = 400
       #    end
       #  end
       #instead use the condintion of the find first so that it doesn't move to the 400 unless it can't find any matching object
       if item_obj = @@items.find{|item_obj| item_obj.name == item_name}
         resp.write item_obj.price
       else
         resp.write "Item not found"
         resp.status = 400
       end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end


end
