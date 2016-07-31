require "hostman/version"
require "slop"

module Hostman
  BLOCK_UNBLOCK_ERROR = "Both --block and --unblock set, doing nothing..."

  class Executor
    def exec

      opts = Slop.parse do |o|
        o.string '-b', '--block', 'a hostname'
        o.string '-u', '--unblock', 'a hostname'
        o.string '-f', '--hosts-file', 'override hosts file path', default: '/etc/hosts'
        o.bool '-o', '--output-hosts', 'output hosts file contents after execution', default: false
        o.on '--version', 'print the version' do
          puts Hostman::VERSION
          exit
        end
      end

      opts.inspect
      begin
        raise ArgumentError, ::Hostman::BLOCK_UNBLOCK_ERROR if !opts[:block].nil? and !opts[:unblock].nil?
      rescue ArgumentError => err
        puts err
        exit
      end

      if !opts[:block].nil?
        not_blocked = true

        File.open(opts["hosts-file"], "r") do |f|
          f.each_line do |line|
            not_blocked = false if line == "127.0.0.1\t#{opts[:block]}\n"
          end
        end

        if not_blocked
          File.open(opts["hosts-file"], "a") do |f|
            f.puts "127.0.0.1\t#{opts[:block]}"
          end
        end
      end

      if !opts[:unblock].nil?
        contents = ""
        File.open(opts["hosts-file"], "r") do |f|
          f.each_line do |line|
            contents += line unless line == "127.0.0.1\t#{opts[:unblock]}\n"
          end
        end

        File.open(opts["hosts-file"], "w") do |f|
          f.puts contents
        end
      end

      if opts["output-hosts"]
        puts File.read(opts["hosts-file"])
      end

    end
  end
end