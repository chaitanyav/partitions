require 'minitest_helper'

  describe "Partitions::VERSION" do
    it "should have a version numer" do
      refute_nil Partitions::VERSION
    end
  end

  describe "n.partitions" do
    it "should return the partitions for given n >= 0" do
      n = rand(10)
      n.partitions do |partition|
        assert_equal n, partition.reduce(:+)
      end
    end

    it "should raise error when n < 0" do
      assert_raises ArgumentError do
        -10.partitions
      end
    end
  end
