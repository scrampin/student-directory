def s
  "def s end puts s[0..5] + 34.chr + s + 34.chr + s[6, 63]"
end

puts s[0..5] + 34.chr + s + 34.chr + s[6, 63]
