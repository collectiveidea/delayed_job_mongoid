class StoryWrapperJob < SimpleJob
  # TODO: remove this line once a delayed_job release includes
  # https://github.com/collectiveidea/delayed_job/pull/1166
  self.runs = 0

  def initialize
    super
    @story = Story.create!(text: 'My great story')
    @story_again = @story
  end

  def perform
    @story.tell
    super
  end
end
