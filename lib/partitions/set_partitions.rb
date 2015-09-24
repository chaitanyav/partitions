module Partitions
  class SetPartitions
    attr_reader  :size

    def initialize(n, p=nil)
      @n = n
      @k = Array.new(n, 0)
      @m = Array.new(n, 0)
      @p = p
      pinitialize
      @size = partition_size
    end

    def next_partition
      if @p.nil?
        (@n - 1).downto(1) do |i|
          if @k[i] <= @m[i - 1]
            @k[i] = @k[i] + 1
            @m[i] = max(@m[i], @k[i])
            j = i + 1
            while j <= (n - 1) do
              @k[j] = @k[0]
              @m[j] = @m[i]
              j = j + 1
            end
            @size = partition_size
            return @k.clone
          end
        end
      else
        p = partition_size
        (@n - 1).downto(1) do |i|
          if (@k[i] < (p - 1)) && (@k[i] <= @m[i - 1])
            @k[i] = @k[i] + 1
            @m[i] = max(@m[i], @k[i])
            j = i + 1
            while j <= (@n - (p - @m[i])) do
              @k[j] = 0
              @m[j] = @m[i]
              j = j + 1
            end
            j = @n - (p - @m[i]) + 1
            while j <= (n - 1) do
              @k[j] = @m[j] = p - (@n - j)
              j = j + 1
            end
            @size = partition_size
            return @k.clone
          end
        end
      end

      @size = nil
      return 
    end

    def previous_partition
      if @p.nil?
        (@n - 1).downto(1) do |i|
          if @k[i] > @k[0]
            @k[i] = @k[i] - 1
            @m[i] = @m[i - 1]
            j = i + 1
            while j <= n - 1 do
              @k[j] = @m[j] = @m[i] + j - i;
              j = j + 1
            end
            @size = partition_size
            return @k.clone
          end
        end
      else
        p = partition_size
        (@n - 1).downto(1).each do |i|
          if (@k[i] > 0) && ((p - @m[i - 1]) <= (n - i))
            @k[i] = @k[i] - 1
            @m[i] = @m[i - 1]
            j = i + 1
            while j <= (i + (p - @m[i]) - 1) do
              @k[j] = @m[j] = @m[i] + j - i
              j = j + 1
            end
            j = i + (p - @m[i])
            while j <= (@n - 1) do
              @k[j] = @m[j] = p - 1
              j = j + 1
            end
            @size = partition_size
            return @k.clone
          end
        end
      end

      @size = nil
      return
    end

    def each_partition
      unless block_given?
        raise ArgumentError, "Missing block"
      end
      reinitialize
      yield @k.clone
      (count - 1).times do
        partition = next_partition
        yield partition
      end
      reinitialize
    end

    def count
      if @p.nil?
        sum = 0
        (1..n).each do |k|
          sum += sterling_second(@n, k)
        end
        return sum
      else
        sum = sterling_second(@n, @p)
      end
    end

    private

    attr_accessor :k, :m, :n
    attr_writer :size

    def sterling_second(n, k)
      if k == 1 || k == n
        return 1
      else
        return sterling_second(n - 1, k - 1) + k * sterling_second(n - 1, k)
      end
    end

    def partition_size
      @m[n - 1] - @m[0] + 1
    end

    def reinitialize
      @k = Array.new(n, 0)
      @m = Array.new(n, 0)
      pinitialize
      @size = partition_size
    end

    def pinitialize
      unless @p.nil?
        (0..(@n - @p)).each do |i|
          @k[i] = @m[i] = 0
        end
        i = (@n - @p + 1)
        while i <= (@n - 1) do
          @k[i] = @m[i] = i - (@n - @p)
          i = i + 1
        end
      end
    end

    def max a, b
      return (a < b) ? b : a
    end

  end
end
