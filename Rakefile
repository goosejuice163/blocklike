require 'fileutils'

task :run do
	sh "dragonruby ."
end

task :build do
	gtk_dir = "C:/dragonruby-windows-amd64/"
	game_name = "blocklike"

	FileUtils.rm_r "tmp", force: true if File.exist? "tmp"
	FileUtils.rm_r "builds", force: true if File.exist? "builds"

	FileUtils.cp_r gtk_dir, "tmp"
	FileUtils.mkdir "tmp/#{game_name}"
	FileUtils.cp_r Dir["app", "assets", "metadata"], "tmp/#{game_name}"

	Dir.chdir "tmp" do
		system "dragonruby-publish --only-package #{game_name}"
	end

	FileUtils.cp_r "tmp/builds", "builds"
	FileUtils.rm_r "tmp", force: true
end

task default: :run
