class LoveIs::Node
  attr_reader :value
  attr_accessor :probability, :childs, :weight

  def initialize(value = nil, weight = 1, childs = nil)
    @value = value
    @weight = weight
    set_childs(childs) if childs
  end

  def set_childs(childs)
    @childs = childs
    unless @childs.all? { |x| x.probability }
      probabilities
    end
  end

  def probabilities
    normalize_weights
    t = 0.0
    @childs.map! { |x| t += x.weight; x.probability = t; x }
  end

  def normalize_weights
    sum = weights.inject(&:+).to_f
    @childs.map! { |x| x.weight /= sum; x }
  end

  def [](key)
    childs.find { |x| x.value == key }
  end

  def weights
    childs.map { |x| x.weight }
  end

  def next
    random_value = Random.new.rand
    childs.find { |x| random_value - x.probability <= 0 }
  end
end
