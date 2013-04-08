module Helpers  
  def rating_for(rateable_obj, dimension=nil, options={})                             
 
    userid = options[:userid]

    if dimension.nil?
      klass = rateable_obj.rates.where(:rater_id => userid).first
    else             
      klass = rateable_obj.rates(dimension).where(:rater_id => userid).first
    end
    
    if klass.nil?
      stars = 0
    else
      stars = klass.stars
    end
    
    star = options[:star] || 5
    
    content_tag :div, "", "data-dimension" => dimension, :class => "star", "data-rating" => stars, 
                          "data-id" => rateable_obj.id, "data-classname" => rateable_obj.class.name,
                          "data-star-count" => star           
    
    
  end
     
end

class ActionView::Base
  include Helpers
end