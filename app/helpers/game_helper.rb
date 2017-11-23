module GameHelper
  def show_clue(clue)
    clue.map { |char| char ? char : "_" }.join(" ")
  end
end
