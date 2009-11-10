class Vi
  class << self
    attr_accessor :instance
  end

  def self.use(*args, &block)
    Vi.instance = new(*args, &block)
  end

  def self.reset
    instance.reset
  end

  def self.teardown
    instance.teardown
  end

  # Called after each example to clean up created buffers.
  def reset
  end

  # Called after all examples are complete to clean up created servers, etc.
  def teardown
  end

  # Create and enter a buffer with the given contents
  # @param contents [String] the contents for the buffer
  def create_buffer(contents)
  end
  undef_method :create_buffer

  # Enter the given key sequence in the active buffer
  # @param key_sequence [String] a vi-like string of keys, such as "iTest<Esc>"
  def press(key_sequence)
  end
  undef_method :press

  # Return the contents of the line with the given number in the active buffer
  # @param number [Fixnum] the line number to return
  # @return [String] the contents of the line
  def line(number)
  end
  undef_method :line
end

Before do
  @vim = Vi.instance
end

After do
  Vi.reset
end

at_exit do
  Vi.teardown
end
