class IndexController < ApplicationController

 def index
  #  find a random tip 
   offset = rand(Tip.count)
   @tip = Tip.offset(offset).first
 end
end
