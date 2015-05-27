#!/usr/bin/env ruby

git_bundles = [ 
  "git://github.com/ervandew/supertab.git",
  "git://github.com/godlygeek/tabular.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/motemen/git-vim.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/chase/vim-ansible-yaml.git",
  "https://github.com/tpope/vim-sensible",
  "https://github.com/c9s/filetype-completion.vim.git",
  "https://github.com/scrooloose/syntastic.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/vim-scripts/taglist.vim.git",
  "https://github.com/editorconfig/editorconfig-vim.git",
  # ---- Code/project navigation ----
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/majutsushi/tagbar.git",
  # ---- Other ----
  #"https://github.com/bling/vim-airline.git",
  "https://github.com/fisadev/FixedTaskList.vim.git",
  "https://github.com/rosenfeld/conque-term.git",
  "https://github.com/tpope/vim-surround.git",
  # ---- Snippets support ----
  #"https://github.com/garbas/vim-snipmate.git",
  "https://github.com/MarcWeber/vim-addon-mw-utils.git",
  #"https://github.com/honza/vim-snippets.git",
  # ---- Languages support ----
  # -------- Python --------
  "git://github.com/klen/python-mode.git",
  #"https://github.com/davidhalter/jedi-vim.git",
  "https://github.com/mitsuhiko/vim-jinja.git",
  "https://github.com/mitsuhiko/vim-python-combined.git",
  # -------- Bash --------
  "https://github.com/vim-scripts/bash-support.vim.git",
  # -------- Puppet -------- 
  "git://github.com/rodjek/vim-puppet.git",
]

vim_org_scripts = [
 #   ["nginx", "1886", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end

