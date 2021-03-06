# Used to test slug behavior in general
class Article < ActiveRecord::Base
  slug :headline  
end

# Used to test alternate slug column
class Person < ActiveRecord::Base
  slug :name, :column => :web_slug
end

# Used to test invalid method names
class Company < ActiveRecord::Base
  slug :name
end

class Post < ActiveRecord::Base
  slug :headline, :validate_uniqueness_if => Proc.new { false } 
end

# Used to test slugs based on methods rather than database attributes
class Event < ActiveRecord::Base
  slug :title_for_slug
  
  def title_for_slug
    "#{title}-#{location}"
  end
end  

class Portfolio < ActiveRecord::Base
  has_many :projects
end

class Project < ActiveRecord::Base
  
  belongs_to :portfolio
  slug :title, :validate_uniqueness_scope => :portfolio_id
  
end