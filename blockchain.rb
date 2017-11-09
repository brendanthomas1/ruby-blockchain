class Blockchain
  attr_reader :chain

  def initialize
    @chain = [Block.new(index: 0)]
  end

  def add_block
    index = @chain.length
    previous_hash = @chain.last.hash
    @chain << Block.new(index: index, previous_hash: previous_hash)
  end

  class Block
    require 'digest'

    attr_reader :hash

    def initialize(index:, previous_hash: nil)
      @index = index
      @timestamp = Time.now.utc
      @hash = calc_hash
      @previoush_hash = previous_hash
    end

    private

    def calc_hash
      Digest::SHA256.new.to_s
    end
  end
end

a = Blockchain.new
a.add_block
p a.chain