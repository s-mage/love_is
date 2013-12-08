module LoveIs::Parser
  SENTENCE_BEGIN = '*'

  def parse_file(filename)
    text = File.read(File.expand_path(filename))
    parse(text, ngram)
  end

  def parse(text, length)
    text.split("\n").map { |x| sentence2array(x) }.each do |sentence|
      sentence.each_cons(length) { |sequence| tree.inc(*sequence) }
    end
    @tree.probabilities
    self
  end

  def sentence2array(sentence)
    sentence.split(/\s/).unshift(SENTENCE_BEGIN)
  end

  def data_to_yaml(filename)
    File.open(File.expand_path(filename), 'w') { |f| f.puts tree.to_yaml }
  end

  def data_from_yaml(filename)
    @tree = YAML.load(File.read(File.expand_path(filename)))
  end
end
