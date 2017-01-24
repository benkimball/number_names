require_relative './number_names.rb'

EXPECTATIONS = {
  -5781 => "negative five thousand seven hundred eighty one",
  0 => "zero",
  1 => "one",
  2 => "two",
  8 => "eight",
  10 => "ten",
  12 => "twelve",
  19 => "nineteen",
  22 => "twenty two",
  40 => "forty",
  99 => "ninety nine",
  100 => "one hundred",
  105 => "one hundred five",
  512 => "five hundred twelve",
  164 => "one hundred sixty four",
  582 => "five hundred eighty two",
  4707 => "four thousand seven hundred seven",
  4_500_105 => "four million five hundred thousand one hundred five",
  6_000_001 => "six million one",
  673_457_575_991_004_050_012_100 => "six hundred seventy three sextillion four hundred fifty seven quintillion five hundred seventy five quadrillion nine hundred ninety one trillion four billion fifty million twelve thousand one hundred",
  1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000 => "one quadragintillion"
}

EXPECTATIONS.each do |number, word|
  result = Converter.num_to_words(number)
  puts (result == word ? "PASS " : "FAIL ") + "'#{number}' => '#{result}'"
end
