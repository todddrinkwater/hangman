module GameHelper
  def show_clue(clue)
    clue_display_format = clue.map { |char| char ? char : "_" }

    clue_display_format.join(" ")
  end
end
