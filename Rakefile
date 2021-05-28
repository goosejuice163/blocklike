require 'fileutils'

task :run do
	sh "dragonruby ."
end

task :build do
	FileUtils.rm_r "tmp", force: true if File.exist? "tmp"
	FileUtils.rm_r "builds", force: true if File.exist? "builds"

	FileUtils.cp_r "C:/dragonruby-windows-amd64/", "tmp"
	FileUtils.mkdir "tmp/blocklike"
	FileUtils.cp_r Dir["app", "assets", "metadata"], "tmp/blocklike"

	Dir.chdir "tmp" do
		system "dragonruby-publish --only-package blocklike"
	end

	FileUtils.cp_r "tmp/builds", "builds"
	FileUtils.rm_r "tmp", force: true
end

task default: :run
