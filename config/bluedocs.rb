require 'rubygems'
require 'bluecloth'
require 'fileutils'
#require 'ftools'


home = ENV['HOME']
in_dir = "#{home}/documentation"
out_dir = "#{in_dir}/public"


namespace :bcdocs do

  task :bld_dir do 
     Dir.mkdir(in_dir) unless File.exists?(in_dir)
     Dir.mkdir(out_dir) unless File.exists?(out_dir)

  end

  task :bld_htm do

      Dir.chdir(in_dir)
      htm = Dir.glob("#{in_dir}/*.bc").to_a
      Dir.chdir(out_dir)

    htm.each do |files|
      in_file = "#{files}"
     
      out_file = "" << 
      files.gsub(/^(.*)\.bc$/,'\1') << ".html"
    
      File.open(out_file, 'w').puts BlueCloth::new(
              File.open(in_file).read
   	      ).to_html
      html = Dir.glob("#{in_dir}/*.html").to_a
      FileUtils.mv("#{html}", "#{out_dir}")

      puts "processing #{in_file} into #{out_file}"
    end

  end

end
  
