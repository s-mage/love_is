class LoveIs::Node
  attr_reader :value
  attr_accessor :probability, :childs, :weight

  def initialize(value = nil, weight = 1, childs = [])
    @value = value
    @weight = weight
    set_childs(childs)
  end

  def set_childs(childs)
    @childs = childs
    probabilities unless @childs.all? { |x| x.probability }
  end

  def probabilities
    normalize_weights
    t = 0.0
    @childs.map! { |x| t += x.weight; x.probability = t; x }
    @childs.each(&:probabilities) if childs && childs.any?
  end

  def normalize_weights
    sum = weights.inject(&:+).to_f
    @childs.map! { |x| x.weight /= sum; x }
  end

  def child(key)
    childs.find { |x| x.value == key }
  end

  def [](*keys)
    keys.inject(self) { |r, x| break(nil) unless r; r.child(x) }
  end

  def []=(*keys, weight)
    keys.inject(self) do |r, x|
      r.childs << LoveIs::Node.new(x, 0, []) unless r.child(x)
      r.child(x).weight = weight
      r.child(x)
    end
  end

  def inc(*keys)
    keys.inject(self) do |r, x|
      r.childs << LoveIs::Node.new(x, 0, []) unless r.child(x)
      r.child(x).weight += 1
      r.child(x)
    end
  end

  def weights
    childs.map { |x| x.weight }
  end

  def next
    childs.find { |x| rand - x.probability <= 0 }
  end
end
