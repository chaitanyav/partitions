require 'minitest_helper'

describe "Partitions::VERSION" do
  it "should have a version numer" do
    refute_nil Partitions::VERSION
  end
end

describe "n.partitions" do
  it "should yield the partition for given n >= 0" do
    n = rand(4..8)
    n.partitions do |partition|
      assert_equal n, partition.reduce(:+)
    end
  end

  it "should print the partitions for the given n >=0" do
    n = rand(1..8)
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

  it "should yield the lexiographic partition  on each_partition" do
    n = 4
    sp = Partitions::SetPartitions.new(n)
    index = 0
    partitions = [
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 1, 0],
      [0, 0, 1, 1],
      [0, 0, 1, 2],
      [0, 1, 0, 0],
      [0, 1, 0, 1],
      [0, 1, 0, 2],
      [0, 1, 1, 0],
      [0, 1, 1, 1],
      [0, 1, 1, 2],
      [0, 1, 2, 0],
      [0, 1, 2, 1],
      [0, 1, 2, 2],
      [0, 1, 2, 3]
    ]
    sp.each_partition do |partition|
      assert partitions[index], partition
      index += 1
    end
  end

  it "should return the number of partitions on count" do
    num_partitions_by_n = {
        1 => 1,
        2 => 2,
        3 => 5,
        4 => 15,
        5 => 52,
        6 => 203,
        7 => 877,
        8 => 4140,
        9 => 21147,
        10 => 115975,
        11 => 678570,
        12 => 4213597}
    num_partitions_by_n.each do |n, num_partitions|
      sp = Partitions::SetPartitions.new(n)
      assert num_partitions, sp.count
    end
  end

  it "should return the next lexiographic partition on next_partition" do
    sp = Partitions::SetPartitions.new(4)
    partitions = [
      [0, 0, 0, 1],
      [0, 0, 1, 0],
      [0, 0, 1, 1],
      [0, 0, 1, 2],
      [0, 1, 0, 0],
      [0, 1, 0, 1],
      [0, 1, 0, 2],
      [0, 1, 1, 0],
      [0, 1, 1, 1],
      [0, 1, 1, 2],
      [0, 1, 2, 0],
      [0, 1, 2, 1],
      [0, 1, 2, 2],
      [0, 1, 2, 3]
    ]
    index = 0
    while !(partition= sp.next_partition).nil? do
      assert_equal  partitions[index], partition
      index += 1
    end
  end

  it "should return the previous lexiographic partition on previous_partition" do
    sp = Partitions::SetPartitions.new(4)
    partitions = [
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 1, 0],
      [0, 0, 1, 1],
      [0, 0, 1, 2],
      [0, 1, 0, 0],
      [0, 1, 0, 1],
      [0, 1, 0, 2],
      [0, 1, 1, 0],
      [0, 1, 1, 1],
      [0, 1, 1, 2],
      [0, 1, 2, 0],
      [0, 1, 2, 1],
      [0, 1, 2, 2],
    ]
    while !(partition = sp.next_partition).nil? do
    end

    index = 13
    while !(partition=sp.previous_partition).nil? do
      assert_equal partitions[index], partition
      index -= 1
    end
  end
end

describe "SetPartitions.new(n, p)" do
  it "should yield the lexiographic partition on each_partition" do
    partitions = [
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 1],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 1],
      [0, 0, 1, 1, 0],
      [0, 0, 1, 1, 1],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 1],
      [0, 1, 0, 1, 0],
      [0, 1, 0, 1, 1],
      [0, 1, 1, 0, 0],
      [0, 1, 1, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 1, 1, 1, 1]
    ]
    index = 0
    sp = Partitions::SetPartitions.new(5,2)
    sp.each_partition do |partition|
      assert_equal partitions[index], partition
      index += 1
    end
  end

  it "should return the number of partitions on count" do
    n = rand(3..12)
    sp = Partitions::SetPartitions.new(n)
    total_partitions = sp.count
    sum = 0
    (1..n).each do |i|
      sp = Partitions::SetPartitions.new(n,i)
      sum += sp.count
    end
    assert_equal total_partitions, sum
  end

  it "should the next lexiographic partition on next_partition" do
    partitions = [
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 1],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 1],
      [0, 0, 1, 1, 0],
      [0, 0, 1, 1, 1],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 1],
      [0, 1, 0, 1, 0],
      [0, 1, 0, 1, 1],
      [0, 1, 1, 0, 0],
      [0, 1, 1, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 1, 1, 1, 1]
    ]
    index = 0
    sp = Partitions::SetPartitions.new(5,2)
    while !(partition = sp.next_partition).nil?
      assert_equal partitions[index], partition
      index += 1
    end
  end

  it "should return the previous lexiographic partition on previous_partition" do
    partitions = [
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 1],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 1],
      [0, 0, 1, 1, 0],
      [0, 0, 1, 1, 1],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 1],
      [0, 1, 0, 1, 0],
      [0, 1, 0, 1, 1],
      [0, 1, 1, 0, 0],
      [0, 1, 1, 0, 1],
      [0, 1, 1, 1, 0],
    ]

    index = 13
    sp = Partitions::SetPartitions.new(5,2)

    while !(partition = sp.next_partition).nil? do
    end

    while !(partition = sp.previous_partition).nil?
      assert_equal partitions[index], partition
      index -= 1
    end
  end
end
