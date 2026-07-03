if Gem.win_platform?
  Rake::Task["css:build"].clear
  Rake::Task["javascript:build"].clear

  namespace :css do
    task :build do
      sh "yarn build:css"
    end
  end

  namespace :javascript do
    task :build do
      sh "yarn build"
    end
  end
end
