#!/usr/bin/ruby

require 'rsync'

def check(res)
  if res.success?
    if res.changes.any?
      res.changes.each{ |change| puts "#{change.filename} - #{change.summary}" }
    else
      puts 'No Change'
    end
  else
    puts res.error
  end
end

args = ['-auv']
puts "--Remote -> Local--"
check Rsync.run('pc.nobbele.dev:~/sdata/', '~/sdata', args)
puts "\n--Local -> Remote--"
check Rsync.run('~/sdata/', 'pc.nobbele.dev:~/sdata', args)
