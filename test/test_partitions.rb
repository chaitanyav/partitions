require 'minitest_helper'

  describe "Partitions::VERSION" do
    it "should have a version numer" do
      refute_nil Partitions::VERSION
    end
  end

  describe "Partitions::all" do
    it "should return the partitions for given n >= 0" do
      n = rand(10)
      Partitions::all(n) do |partition|
        assert_equal n, partition.reduce(:+)
      end
    end

    it "should raise error when n < 0" do
      assert_raises ArgumentError do
        Partitions.all(-10)
      end
    end
  end
