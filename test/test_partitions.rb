require 'minitest_helper'

describe "Partitions::VERSION" do
  it "should have a version numer" do
    refute_nil Partitions::VERSION
  end
end

describe "n.partitions" do
  it "should yield the partition for given n >= 0" do
    n = rand(10)
    n.partitions do |partition|
      assert_equal n, partition.reduce(:+)
    end
  end

  it "should print the partitions for the given n >=0" do
    n = rand(5)
    n.partitions
  end

  it "should raise error when n < 0" do
    assert_raises ArgumentError do
      -10.partitions
    end
  end
end

describe "SetPartitions.new" do
  it "should raise an error if n(number of elements) is not specified" do
    assert_raises ArgumentError do
      Partitions::SetPartitions.new
    end
  end
end

describe "SetPartitions.new(n)" do
  it "should raise error if block is not given to each_partition" do
    assert_raises ArgumentError do
      sp = Partitions::SetPartitions.new(4)
      sp.each_partition
    end
  end

  it "should yield the partition on each_partition" do
    n = 4
    sp = Partitions::SetPartitions.new(n)
    sp.each_partition do |partition|
      refute partition.nil?
      refute partition.empty?
      assert n, partition.length
    end
  end
end
