# Partitions

Partitions is a rubygem to list integer, set and multiset partitions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'partitions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install partitions

## Usage
    >> require 'partitions' #=> true
    >> 5.partitions #=> nil
    [1, 1, 1, 1, 1]
    [1, 1, 1, 2]
    [1, 1, 3]
    [1, 2, 2]
    [1, 4]
    [2, 3]
    [5]

    >> 5.partitions{|partition| p partition};nil #=> nil
    [1, 1, 1, 1, 1]
    [1, 1, 1, 2]
    [1, 1, 3]
    [1, 2, 2]
    [1, 4]
    [2, 3]
    [5]

    irb(main):001:0> sp = Partitions::SetPartitions.new(4)
    => #<Partitions::SetPartitions:0x007fedab516f58 @n=4, @k=[0, 0, 0, 0], @m=[0, 0, 0, 0], @p=nil, @size=0>
    irb(main):002:0> sp.each_partition{|partition| p partition};nil
    [0, 0, 0, 0]
    [0, 0, 0, 1]
    [0, 0, 1, 0]
    [0, 0, 1, 1]
    [0, 0, 1, 2]
    [0, 1, 0, 0]
    [0, 1, 0, 1]
    [0, 1, 0, 2]
    [0, 1, 1, 0]
    [0, 1, 1, 1]
    [0, 1, 1, 2]
    [0, 1, 2, 0]
    [0, 1, 2, 1]
    [0, 1, 2, 2]
    [0, 1, 2, 3]
    => nil
    irb(main):003:0> sp = Partitions::SetPartitions.new(3)
    => #<Partitions::SetPartitions:0x007fedab4fea48 @n=3, @k=[0, 0, 0], @m=[0, 0, 0], @p=nil, @size=0>
    irb(main):004:0> sp.next_partition
    => [0, 0, 1]
    irb(main):005:0> sp.next_partition
    => [0, 1, 0]
    irb(main):006:0> sp.next_partition
    => [0, 1, 1]
    irb(main):007:0> sp.next_partition
    => [0, 1, 2]
    irb(main):008:0> sp.next_partition
    => nil
    irb(main):009:0> sp.previous_partition
    => [0, 1, 1]
    irb(main):010:0> sp.previous_partition
    => [0, 1, 0]
    irb(main):011:0> sp.previous_partition
    => [0, 0, 1]
    irb(main):012:0> sp.previous_partition
    => [0, 0, 0]
    irb(main):013:0> sp.previous_partition
    => nil
##References
###Integer Partitions
---------------------------
[Generating All Partitions: A Comparison Of Two Encodings Jerome Kelleher, Barry O'Sullivan](http://arxiv.org/abs/0909.2331v2)
http://jeromekelleher.net/partitions.php

###Set Partitions
---------------------------
[Orlov, M.: Efficient generation of set partitions. Tech. rep., Engineering and Computer Sciences, University of Ulm (2002)](http://www.informatik.uni-ulm.de/ni/Lehre/WS03/DMM/Software/partitions.pdf)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

1. Fork it ( https://github.com/chaitanyav/partitions/)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
