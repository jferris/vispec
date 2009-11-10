class Vim < Vi
  def initialize
    start_vim_server
  end

  def teardown
    kill_vim_server
  end

  def create_buffer(contents)
    content_keys = contents.gsub("\n", "<Enter>")
    press "i#{content_keys}<Esc>gg"
  end

  def press(key_sequence)
    remote_command("--remote-send #{key_sequence.inspect}")
  end

  def line(number)
    remote_command(%{--remote-expr "getline('#{number}')"}).chop
  end

  def reset
    press "enew!"
  end

  private

  def start_vim_server
    pid = Process.fork do
      exec("mvim --servername vispec-server")
    end
    Process.wait(pid)
  end

  def kill_vim_server
    remote_command("--remote-send '<C-C>:qa!<Enter>'")
  end

  def remote_command(command)
    `mvim --servername vispec-server #{command}`
  end
end

Vim.use
