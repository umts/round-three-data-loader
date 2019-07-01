require 'pathname'
require 'yaml'

filename = Pathname(ARGF.file).expand_path
file = File.open(filename)

headers = ''
loop do
  headers << file.gets
  break if $_ =~ /^\s*records:/
end
field_count = YAML.load(headers).values.first['columns'].count

chunk_number = 0
records_per_chunk = ENV['RPC'].to_i || 10

loop do
  chunk_filename = filename.sub(filename.extname, "_#{'%04d' % chunk_number}#{filename.extname}")
  File.open(chunk_filename, 'w') do |outfile|
    outfile.write(headers)
    records_per_chunk.times do
      field_count.times do
        outfile.write file.gets
      end
    end
  end
  chunk_number += 1
  break if file.eof?
end
