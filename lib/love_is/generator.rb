class LoveIs::Generator
  include LoveIs::Parser
  attr_reader :ngram, :chain, :tree

  def initialize(ngram = 3)
    @tree = LoveIs::Node.new(nil, 1, [])
    @ngram = ngram
    @chain = []
  end

  def generate(chain_length = 1000)
    @chain = []
    initial_values
    (chain_length - ngram).times do
      break unless word = next_value
      @chain << word
    end
    chain[1..-1].join(' ')
  end

  def initial_values
    ngram.times.inject(@tree.child('*')) do |node|
      @chain << node.value
      node.next
    end
  end

  def next_value
    node = @tree[*chain[(-ngram + 1)..-1]]
    node ? node.next.value : nil
  end
end
