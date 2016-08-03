require "hostman/version"
require "hostman/executor"
require "slop"

module Hostman
  BLOCK_UNBLOCK_ERROR = "Both --block and --unblock set, doing nothing..."

  def self.block hosts_file, domain
      not_blocked = true

      File.open(hosts_file, "r") do |f|
        f.each_line do |line|
          not_blocked = false if line == "127.0.0.1\t#{domain}\n"
        end
      end

      if not_blocked
        File.open(hosts_file, "a") do |f|
          f.puts "127.0.0.1\t#{domain}"
        end
      end
  end

  def self.unblock hosts_file, domain
    contents = ""
    File.open(hosts_file, "r") do |f|
      f.each_line do |line|
        contents += line unless line == "127.0.0.1\t#{domain}\n"
      end
    end

    File.open(hosts_file, "w") do |f|
      f.puts contents
    end
  end
end