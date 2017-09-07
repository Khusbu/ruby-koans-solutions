require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Fixnum, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?

    # Answer:
    # Pattern : 2*i + 1
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal true, obj           != copy
    assert_equal true, obj.object_id != copy.object_id
  end
#
# Subclasses may override these methods to provide different semantics. In Object itself, there are two key differences.
#
# First, clone copies the singleton class, while dup does not.
#
# o = Object.new
# def o.foo
#   42
# end
#
# o.dup.foo   # raises NoMethodError
# o.clone.foo # returns 42
# Second, clone preserves the frozen state, while dup does not.
#
# class Foo
#   attr_accessor :bar
# end
# o = Foo.new
# o.freeze
#
# o.dup.bar = 10   # succeeds
# o.clone.bar = 10 # raises RuntimeError
# The Rubinius implementation for these methods is often my source for answers to these questions, since it is quite clear, and a fairly compliant Ruby implementation.
end
