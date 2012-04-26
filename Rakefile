require "rake"

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob("*/**{.symlink}")

  home = ENV["HOME"]

  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = File.basename(linkable.split("/").last, ".symlink")
    target = "#{home}/.#{file}"

    if File.exists?(target) or File.symlink?(target)
      unless overwrite_all or backup_all
        puts "File already exists: #{target}, what do you want to do?\n" <<
          "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when "o" then overwrite = true
        when "b" then backup = true
        when "O" then overwrite_all = true
        when "B" then backup_all = true
        when "S" then break
        when "s" then next
        else next
        end
      end

      FileUtils.rm_rf(target) if overwrite or overwrite_all
      FileUtils.mv("#{home}/.#{file}", "#{home}/.#{file}.backup") if backup or backup_all
    end

    FileUtils.ln_s("#{ENV["PWD"]}/#{linkable}", "#{target}")
  end
end

task :uninstall do
  Dir.glob("**/*.symlink").each do |linkable|
    filename = File.basename(linkable.split("/").last, ".symlink")
    target = "#{ENV["HOME"]}/.#{filename}"
    backup = "#{target}.backup"

    # Remove all symlinks created during installation
    if File.symlink? target
      FileUtils.rm target
    end

    # Replace any backups made during installation
    if File.exists? backup
      FileUtils.mv backup, target
    end
  end
end

task :default => "install"
