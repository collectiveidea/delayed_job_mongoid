class Story
  include ::Mongoid::Document

  field :text

  def tell
    text
  end

  def whatever(times, _)
    tell * times
  end

  def self.count; end

  handle_asynchronously :whatever
end
