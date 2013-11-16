class Generator
  attr_reader :ngram, :chain, :chain_length, :tree

  def initial_values
    (ngram - 1).times.inject(tree.next) do |node|
      chain << node.value
      node.next
    end
  end

  def next_value
    (1..ngram).reverse_each.inject(tree.dup) do |node, index|
      node[chain[-index]]
    end.value
  end

  def generate
    chain = []
    initial_values
    (chain_length - ngram).times { chain << next_value }
    chain
  end
end
