class Wit < Formula
  desc "Wiimms ISO Tool is a command-line tools to manipulate Wii Image files"
  homepage "https://wit.wiimm.de/"
  url "https://github.com/Wiimm/wiimms-iso-tools/archive/master.zip"
  version "latest"
  license "GPL-2.0-or-later"

  uses_from_macos "ncurses"

  def install
    cd "project" do
      system_command "/usr/bin/sed",
                     args: [
                       "-i",
                       "-e", "s|INSTALL_PATH=.*|INSTALL_PATH=#{prefix}|g",
                       "setup.sh"
                     ]
      system "make"
      system "/bin/bash", "install.sh", "--no-sudo"
    end
  end

  test do
    system "wit", "--version"
  end
end