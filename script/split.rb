require 'pathname'

filename = Pathname(ARGF.file).expand_path
file = File.open(filename)

headers = ''
loop do
  headers << file.gets
  break if $_ =~ /^\s*records:/
end

chunk_number = 0
records_per_chunk = ENV['RPC'].to_i || 10
line = nil

loop do
  chunk_filename = filename.sub(filename.extname, "_#{'%04d' % chunk_number}#{filename.extname}")
  File.open(chunk_filename, 'w') do |outfile|
    records_in_chunk = 0
    outfile.write(headers)
    loop do
      outfile.write line if line
      loop do
        line = file.gets
        break if line =~ /^  - -/
        outfile.write line
        exit if file.eof?
      end
      records_in_chunk += 1
      break if records_in_chunk >= records_per_chunk
    end
  end
  chunk_number += 1
end
