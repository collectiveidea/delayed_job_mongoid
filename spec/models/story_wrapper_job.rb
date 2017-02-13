class StoryWrapperJob < SimpleJob
  def initialize
    @story = Story.create!(text: 'My great story')
    @story_again = @story
  end

  def perform
    @story.tell
    super
  end
end
