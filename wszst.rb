class Wszst < Formula
  desc "Wiimms SZS Toolset is a set of command-line tools to manipulate Wii files"
  homepage "https://szs.wiimm.de/"
  url "https://github.com/Wiimm/wiimms-szs-tools/archive/master.zip"
  version "latest"
  license "GPL-2.0-or-later"

  depends_on "libpng" => :build
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
    system "mkdir", "test_dir"
    system "wszst", "CREATE", "test_dir"
    system "rmdir", "test_dir"
    system "rm", "test_dir.szs"
  end
end