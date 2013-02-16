require "rake"

desc "Hook our dotfiles into system-standard positions"
task :install do
  # Home and working directory paths
  home = ENV["HOME"]
  pwd  = ENV["PWD"]

  overwrite_all = false
  backup_all = false

  # Command shortcut help for handling file collisions
  help = [
    "s - skip",
    "S - skip all",
    "b - backup",
    "B - backup all",
    "o - overwrite",
    "O - overwrite all",
    "d - show diff",
    "? - print help"
  ].join("\n")

  Dir.glob("*/**{.symlink}").each do |linkable|
    overwrite = false
    backup = false

    name = File.basename(linkable, ".symlink")
    dest = "#{home}/.#{name}"

    # Handle collisions with existing dotfiles
    if File.exists?(dest) or File.symlink?(dest)
      unless overwrite_all or backup_all
        print "#{dest.sub(home, "~")} exists: [s,S,b,B,o,O,d,?]? "
        case STDIN.gets.chomp
        when "d" then system "diff #{pwd}/#{linkable} #{dest} | less"; redo
        when "o" then overwrite = true
        when "b" then backup = true
        when "O" then overwrite_all = true
        when "B" then backup_all = true
        when "?" then puts help; redo
        when "S" then break
        when "s" then next
        else redo
        end
      end

      FileUtils.rm_rf(dest) if overwrite or overwrite_all
      FileUtils.mv(dest, "#{dest}.backup") if backup or backup_all
    end

    # Symlink the file into our home directory
    FileUtils.ln_s("#{pwd}/#{linkable}", dest)
  end
end

task :uninstall do
  Dir.glob("**/*.symlink").each do |linkable|
    name   = File.basename(linkable, ".symlink")
    dest   = "#{ENV["HOME"]}/.#{name}"
    backup = "#{dest}.backup"

    # Remove all symlinks created during installation
    FileUtils.rm(dest) if File.symlink?(dest)

    # Restore any backups made during installation
    FileUtils.mv(backup, dest) if File.exists?(backup)
  end
end

task :default => :install
