require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_sal_has_no_jokes
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_it_can_learn_jokes
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal [joke_1, joke_2], sal.jokes
  end

  def test_it_can_tell_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

    assert_equal [joke_1, joke_2], ali.jokes
  end

  def test_it_can_return_jokes_by_id
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(17, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.tell(ali, joke_2)
    sal.tell(ali, joke_1)

    assert_equal joke_1, ali.joke_by_id(17)
    assert_equal joke_2, ali.joke_by_id(2)
  end
end
