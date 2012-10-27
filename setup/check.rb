#!/usr/bin/env ruby

module Dependencies
  class Section
    # A Section encapsulates a list of similar software dependecies
    # that should be available. A block, passed to the `check` method
    # is used to detect installed or missing dependencies. Handlers
    # for detection results are passed to the `found` and `missing`
    # methods.
    #
    # Defaults are configured on the class level, e.g.
    #
    #   Section.header { |title| puts "== #{title}" }
    #
    # or:
    #
    #   Section.defaults do |default|
    #     default.found   { |*args| puts "[x] #{args.first}" }
    #     default.missing { |*args| puts "[ ] #{args.first}" }
    #   end
    #
    # These defaults can be overriden in individual sections:
    #
    #   section "users" do
    #     check do |name, *args|
    #       File.directory?("/Users/#{name}")
    #     end
    #
    #     missing do |name, *args|
    #       puts "no user #{name} found"
    #     end
    #
    #     x "hypo"
    #   end

    def self.defaults(&block)
      block.call(self)
    end

    def self.header(&block)
      @@header = block
    end

    def self.found(&block)
      @@found = block
    end

    def self.missing(&block)
      @@missing = block
    end

    def initialize(title = nil)
      @title = title
      @items = []
    end

    def init(&block)
      instance_eval(&block)
      self
    end

    def header(&block)
      @header = block
    end

    def check(&block)
      @check = block
    end

    def found(&block)
      @found = block
    end

    def missing(&block)
      @missing = block
    end

    def x(*args)
      @items << args
    end

    def run
      (@header || @@header).call(@title)
      @items.each do |item|
        if @check.call(*item)
          (@found || @@found).call(*item)
        else
          (@missing || @@missing).call(*item)
        end
      end
    end
  end

  module DSL
    # A DSL mixin providing syntactic sugar for
    # creating structured dependency checklists.

    def section(title = nil, &block)
      section = Section.new(title)
      @sections ||= []
      @sections << [section, block]
      section
    end

    def run
      @sections.each { |(section, block)| section.init(&block).run }
    end
  end
end

include Dependencies::DSL

class String
  # Extensions to colorize terminal output:
  def bold;  "\033[0;1m#{self}\033[0m"; end
  def green; "\033[32m#{self}\033[0m";  end
  def red;   "\033[31m#{self}\033[0m";  end
end

# Configure default handlers, printing to the terminal.
Dependencies::Section.defaults do |default|
  default.header do |title|
    puts title.capitalize.bold
  end

  default.found do |name, *args|
    puts "+ #{name}".green
  end

  default.missing do |name, *args|
    puts "- #{name}".red
  end
end

# Define the actual checklists:

section "applications" do
  check do |name, *args|
    File.directory?("/Applications/#{name}.app")
  end
  
  x "Caffeine"
  x "Chromium"
  x "Cyberduck"
  x "Firefox"
  x "Google Chrome Canary"
  x "Google Chrome"
  x "OmniGraffle 5"
  x "iWork '09/Keynote"
  x "iWork '09/Numbers"
  x "iWork '09/Pages"
  x "Postgres"
  x "Remote Desktop Connection"
  x "Skype"
  x "Steam"
  x "TeamViewer 7/TeamViewer"
  x "TextMate"
  x "VirtualBox"
  x "VLC"
  x "VMware Fusion"
  x "Wireshark"
  x "Xcode"
  x "XMind"
end

section "commands" do
  check do |name, *args|
    system("which -s #{name}")
  end

  # compilers
  x "gcc"
  x "clang"
  # databases
  x "postgres_real"
  x "mysqld"
  x "mongod"
  x "redis-server"
  # runtimes
  x "node"
  # image processing
  x "pngcrush"
  x "mogrify"
  # video processing
  x "ffmpeg"
  # network utilities
  x "mtr"
  x "wireshark"
  # pen-testing
  x "nmap"
  x "kismet"
  x "msfconsole"
  # other
  x "rbenv"
  x "protoc"
end

section "libraries" do
  check do |name, *args|
    File.exists?("/usr/local/lib/#{name}.a")
  end

  # image formats
  x "libpng"
  x "libjpeg"
  x "libtiff"
end

section "frameworks" do
  check do |name, *args|
    # TODO
  end
end

section "files" do
  check do |path, mode, *args|
    path = File.expand_path(path)
    File.exists?(path) && File.stat(path).mode == mode
  end

  x "~/.ssh",             040700
  x "~/.ssh/id_rsa",     0100600
  x "~/.ssh/id_rsa.pub", 0100644
end

section "gems" do
  check do |name, *args|
    # TODO
  end
end

# Run through the checklists.

run
