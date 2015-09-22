require 'minitest_helper'

  describe "Partitions::VERSION" do
    it "should have a version numer" do
      refute_nil Partitions::VERSION
    end
  end

  describe "Partitions::all" do
    it "should return the partitions for given n" do
      Partitions::all(8) do |partition|
        p "partition is #{partition}"
      end
    end
  end
