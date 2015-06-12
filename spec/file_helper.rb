module Helpers
  def comment_proxy_yml
    process_file :comment
  end

  def uncomment_proxy_yml
    process_file :uncomment
  end

  def process_file action
    file_path = './lib/rents/config/proxy.yml'
    file = File.open(file_path, 'r+')
    old_lines = file.readlines
    new_lines = []

    # Create the new lines
    if action == :comment
      old_lines.each do |old_line|
        unless old_line[0] == '#'
          old_line = '#' + old_line
        end

        new_lines << old_line
      end
    elsif action == :uncomment
      old_lines.each do |old_line|
        new_lines << old_line.remove('#')
      end
    end

    write_lines file_path, new_lines
  end

  # Write the new lines
  def write_lines file_path, new_lines
    File.open(file_path, 'w') do |file|
      new_lines.each do |new_line|
        file.puts new_line
      end
    end
  end
end