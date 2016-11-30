class Human
  attr :name, :last_name

  def initialize(name, last_name)
    @name = name
    @last_name = last_name
  end

  def test(*args)
    puts args.join(" ")
  end

  def try_try(*a, &b)
    if a.empty?
      b.call if block_given?
    elsif a.first
      public_send(*a, &b)
    end
  end

end


=begin
# for test in irb

require "./try_try_method"
human = Human.new("Vasya", "Pupkin")
human.try_try(:test, human.name, human.last_name)
human.try_try(:test, "q", "w", "e", "r", "t", "y")

human.try_try{puts "some block"}

=end