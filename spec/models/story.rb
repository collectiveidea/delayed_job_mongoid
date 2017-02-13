class Story
  include ::Mongoid::Document
  field :text

  def tell
    text
  end

  def whatever(n, _)
    tell * n
  end

  def self.count; end

  handle_asynchronously :whatever
end
