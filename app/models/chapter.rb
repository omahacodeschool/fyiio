class Chapter < ActiveRecord::Base
  belongs_to(:tutorial)
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  validates_presence_of :title, :tutorial_id

  # Converts video time for tutorial chapters.
  #
  # Uses Time Class.
  # Converts start time and endtime to UTC (GMT).
  # Formats times according to the directives in the given format String ("%H:%M:%S").
  #
  # Returns a String.
  def video_time_conversion_for_chapters
    start_time = Time.at(self.start_time).utc.strftime("%H:%M:%S")
    end_time = Time.at(self.end_time).utc.strftime("%H:%M:%S")

    return "#{start_time} - #{end_time}"
  end

  # Gets the draft title for a chapter, displays as draft if the chapter is a draft, otherwise displays with the word "EDIT"
  #
  # Returns a String.
  def get_draft_title_for_chapter
    return self.draft == true ? "DRAFT: #{self.title.upcase}" : "EDIT: #{self.title.upcase}"
  end

  # Gets the start time for a step in a chapter.
  #
  # Populates an Array of start_times for all Steps that belong to a Chapter.
  #
  # Returns an Integer.
  def get_start_time_step_array_for_chapter
     start_times = self.steps.pluck(:start_time)
     # binding.pry
     return start_times.empty? ? 0 : start_times.min
    # Returns 0 if the array is empty (no Steps) OR the minimum value in the array (the beginning time of the first Step)
  end

  # Gets the end time for a step in a chapter.
  #
  # Populates end_times Array for all Steps that belong to a Chapter.
  #
  # Returns an Integer.
  def get_end_time_step_array_for_chapter
     end_times = self.steps.pluck(:end_time)
    return end_times.empty? ? 0 : end_times.max
    # Returns 0 if the array is empty (no Steps) OR the maximum value in the array (the ending time of the last Step)
  end

  # Sets a chapter start and end time based on step times.
  #
  # Using previous methods, updates a Chapter's start_time and end_time to be the beginning time of the Chapter's first Step and the ending time of the Chapter's last step, respectively.
  #
  # Saves Chapter table object.
  def set_chapter_start_and_end_time_based_on_step_times
    starts = get_start_time_step_array_for_chapter
    ends = get_end_time_step_array_for_chapter
    self.update(start_time: starts, end_time: ends)
    self.save
  end

  def create_many_steps(params)
    @new_steps = []
    params.each do |key, value|
      step = self.steps.new(title: params[key][:title], description: params[key][:description], draft: params[key][:draft], warning: params[key][:warning], start_time: (params[key][:start_time]).to_i, end_time: (params[key][:end_time]).to_i)
      @new_steps << step 
    end
  end

  def save_valid_steps
    @invalid_steps = []
    @valid_steps = []
    @new_steps.each do |step|
      if step.valid?
        step.save
        @valid_steps << step
      else
        @invalid_steps << step
      end
    end
  end

  def get_invalid_steps
    @invalid_steps
  end

  def get_valid_steps
    @valid_steps
  end

  def get_all_new_steps
    @new_steps
  end

end

