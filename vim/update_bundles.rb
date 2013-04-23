#!/usr/bin/env ruby
# From https://github.com/tsaleh/dotfiles/blob/master/vim/update_bundles
# From https://github.com/gabebw/dotfiles/blob/master/vim/update_bundles.rb

require 'fileutils'
require 'open-uri'

$git_bundles = %w{
  git://github.com/scrooloose/nerdtree.git
  git://github.com/vim-ruby/vim-ruby.git
  git://github.com/tpope/vim-rails.git
  git://github.com/tsaleh/vim-supertab.git
  git://github.com/tomtom/tcomment_vim.git
  git://github.com/vim-scripts/IndexedSearch.git
  git://github.com/tpope/vim-fugitive.git
  git://github.com/tpope/vim-git.git
  git://github.com/mattn/zencoding-vim.git
  git://github.com/altercation/vim-colors-solarized.git
  git://github.com/kien/ctrlp.vim.git
  git://github.com/tpope/vim-surround.git
  git://github.com/tsaleh/vim-matchit.git
  git://github.com/godlygeek/tabular.git
  git://github.com/mileszs/ack.vim.git
  git://github.com/vim-scripts/FuzzyFinder.git
  git://github.com/vim-scripts/L9.git
  git://github.com/ap/vim-css-color.git
  git://github.com/kchmck/vim-coffee-script.git
  git://github.com/tpope/vim-haml.git
  git://github.com/nono/vim-handlebars.git
  git://github.com/tpope/vim-markdown.git
  git://github.com/briancollins/vim-jst.git
  git://github.com/pangloss/vim-javascript.git
  git://github.com/scottmcginness/vim-jquery.git
  git://github.com/briancollins/vim-jst.git
  git://github.com/tpope/vim-ragtag.git
  git://github.com/othree/html5.vim.git
  git://github.com/vim-scripts/simplefold.git
  git://github.com/scrooloose/syntastic.git
  git://github.com/tpope/vim-endwise.git
  git://github.com/reinh/vim-makegreen.git
  git://github.com/danro/rename.vim.git
  git://github.com/airblade/vim-rooter.git
  git://github.com/skwp/vim-rspec.git
  git://github.com/vim-scripts/taglist.vim.git
  git://github.com/vim-scripts/BufOnly.vim.git
  git://github.com/vim-scripts/bufexplorer.zip.git
  git://github.com/maxbrunsfeld/vim-yankstack.git
  git://github.com/jgdavey/vim-railscasts.git
}

# Where we put zip files from vim.org/scripts/
TEMP_ZIP_NAME = 'temp.zip'
# Where we extract the zipfile to
TEMP_ZIP_DIR = 'temp_zip_dir'

def update_pathogen
  # Not in bundle/, so do it by hand
  autoload_dir = File.join(File.dirname(__FILE__), "autoload")
 
  Dir.chdir(autoload_dir) do
    File.open('pathogen.vim', 'w') do |f|
      f << open('https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim').read
    end
  end
end

# [name, script_id, script type]
# e.g. ["jquery",        "12276", "syntax"]
# puts script id 12276 in bundle/jquery/syntax/jquery.vim
$vim_org_scripts = [
  # http://www.vim.org/scripts/script.php?script_id=42
  # 19481: v.7.3.5
  # ["bufexplorer", "19481",  "plugin"],
  # http://www.vim.org/scripts/script.php?script_id=2423
  # 14204: v4.5
  #["gist",          "14204", "plugin"],
  # http://www.vim.org/scripts/script.php?script_id=2416
  # 12276: v0.4
  #["jquery",        "12276", "syntax"],
  # highlight hex colors, so #FF0000 displays in red
  # 8846: v0.7 (2007-06-24)
  #["css", 8846, "syntax"],
  # http://www.vim.org/scripts/script.php?script_id=910
  # 14079: v1.3.3
  #["pydoc", 14079, "plugin"],

  # http://www.vim.org/scripts/script.php?script_id=2441
  # 14288: v3.0
  # 4-element array to mark it as a zip
  #["pyflakes", 14288, "ftplugin", "zip"],
]

=begin
git_bundles = %w{
git://github.com/fholgado/minibufexpl.vim.git
git://github.com/wincent/Command-T.git
git://github.com/garbas/vim-snipmate.git
git://github.com/rcyrus/snipmate-snippets-rubymotion.git
git://github.com/Shougo/neocomplcache.git
git://github.com/bingaman/vim-sparkup.git
git://github.com/astashov/vim-ruby-debugger.git
git://github.com/pangloss/vim-javascript.git
git://github.com/scrooloose/nerdtree.git
git://github.com/timcharper/textile.vim.git
git://github.com/tomtom/tcomment_vim.git
git://github.com/tpope/vim-cucumber.git
git://github.com/tpope/vim-fugitive.git
git://github.com/tpope/vim-git.git
git://github.com/tpope/vim-haml.git
git://github.com/tpope/vim-markdown.git
git://github.com/tpope/vim-repeat.git
git://github.com/tpope/vim-surround.git
git://github.com/tpope/vim-vividchalk.git
git://github.com/tsaleh/vim-matchit.git
git://github.com/tsaleh/vim-shoulda.git
git://github.com/tsaleh/vim-tmux.git
git://github.com/vim-ruby/vim-ruby.git
git://github.com/vim-scripts/Gist.vim.git
git://github.com/vim-scripts/IndexedSearch.git
git://github.com/vim-scripts/jQuery.git
git://github.com/kana/vim-textobj-user.git
git://github.com/nelstrom/vim-textobj-rubyblock.git
git://github.com/jgdavey/vim-blockle.git
git://github.com/Shougo/neocomplcache.git
git://github.com/sickill/vim-pasta.git
git://github.com/ecomba/vim-ruby-refactoring.git
git://github.com/int3/vim-taglist-plus.git
git://github.com/tpope/vim-unimpaired.git
}
=end

=begin
$git_bundles = [
  #"git://github.com/hallison/vim-rdoc.git",
  #"git://github.com/tsaleh/vim-tcomment.git",
  #"git://github.com/msanders/snipmate.vim.git",
]
=end

def setup
  bundles_dir = File.join(File.dirname(__FILE__), "bundle")

  puts "trashing everything (lookout!)"
  
  FileUtils.rm_rf(bundles_dir)
  FileUtils.mkdir(bundles_dir)
  FileUtils.cd(bundles_dir)
end


def update_git_bundles
  $git_bundles.each do |url|
    dir = url.split('/').last.sub(/\.git$/, '')
    puts "Unpacking #{url} into #{dir}"
    `git clone #{url} #{dir}`
    FileUtils.rm_rf(File.join(dir, ".git"))
  end
end

def update_vim_org_scripts
  $vim_org_scripts.each do |name, script_id, script_type, zip|
    puts "Downloading #{name}"
    if zip
      # pyflakes/ftplugin
      target_dir = File.join(name, script_type)
      FileUtils.mkdir_p(target_dir)
      File.open(TEMP_ZIP_NAME, "w") do |file|
        file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
      end
      `unzip #{TEMP_ZIP_NAME} -d #{TEMP_ZIP_DIR}`
      FileUtils.mv(Dir.glob(TEMP_ZIP_DIR + '/*'), target_dir)
      # Clean up
      FileUtils.rm(TEMP_ZIP_NAME)
      FileUtils.rm_rf(TEMP_ZIP_DIR)
    else
      # pyflakes/ftplugin/pyflakes.vim
      local_file = File.join(name, script_type, "#{name}.vim")
      FileUtils.mkdir_p(File.dirname(local_file))
      File.open(local_file, "w") do |file|
        file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
      end
    end
  end

  # Patch pydoc so that K doesn't call Python help in non-python files
  # Also: the first time I've actually found a use for Array#assoc
  pydoc = $vim_org_scripts.assoc('pydoc')
  if pydoc
    pydoc_type = pydoc[2]
    print "Patching pydoc..."
    STDOUT.flush
    # Currently in /bundle dir, so path is relative to that
    `sed -E -i '' -e 's/^(nnoremap .* K :call)/au FileType python \\1/' pydoc/#{pydoc_type}/pydoc.vim`
    puts "done."
  end
end

def update_all
  update_pathogen
  setup
  update_git_bundles
  #update_vim_org_scripts
end

update_all if $0 == __FILE__

