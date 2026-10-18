class StoryWrapperJob < SimpleJob
  # TODO: remove this line when https://github.com/collectiveidea/delayed_job/pull/1166 is merged
  @@runs = 0

  def initialize
    @story = Story.create!(text: 'My great story')
    @story_again = @story
  end

  def perform
    @story.tell
    super
  end
end
