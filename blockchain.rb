class Blockchain
  require 'pp'

  def initialize
    @chain = [Block.new(index: 0)]
  end

  def chain
    @chain.dup
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
      @previous_hash = previous_hash
    end

    private

    def calc_hash
      Digest::SHA256.new.to_s
    end
  end
end
