module Hostman
  class Executor
    def exec

      opts = Slop.parse do |o|
        o.array '-b', '--block', 'a list of hostnames', delimiter: ','
        o.array '-u', '--unblock', 'a list of hostname', delimiter: ','
        o.string '-f', '--hosts-file', 'override hosts file path', default: '/etc/hosts'
        o.bool '-o', '--output-hosts', 'output hosts file contents after execution', default: false
        o.on '-h', '--help', 'print this help message' do
          puts o
          exit
        end
        o.on '--version', 'print the version' do
          puts Hostman::VERSION
          exit
        end
      end

      begin
        raise ArgumentError, ::Hostman::BLOCK_UNBLOCK_ERROR if !opts[:block].empty? and !opts[:unblock].empty?
      rescue ArgumentError => err
        puts err
        exit
      end

      if !opts[:block].empty?
        opts[:block].each do |domain|
          ::Hostman.block opts["hosts-file"], domain
        end
      end

      if !opts[:unblock].empty?
        opts[:unblock].each do |domain|
          ::Hostman.unblock opts["hosts-file"], domain
        end
      end

      if opts.output_hosts?
        puts File.read(opts["hosts-file"])
      end

    end
  end
end