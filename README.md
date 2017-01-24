# Number Names

A quick exercise in Ruby to generate names of numbers using the [short scale](https://en.wikipedia.org/wiki/Long_and_short_scales) and the [Conway/Guy nomenclature](https://en.wikipedia.org/wiki/Names_of_large_numbers#cite_note-a-14). The maximum number that can be named will depend on how many group names exist in the dictionary being used. An English short-scale dictionary is provided in `english.yml`; other dictionaries following the same organization can be easily substituted.

While it is possible to generate names of large numbers algorithmically using the Conway/Guy or another selected nomenclature, I decided on this dictionary-based approach to increase portability between languages.

# Usage

    $ irb -rnumber_names -I.
    irb(main):001:0> Converter.num_to_words(42442)
    => "forty two thousand four hundred forty two"

    Converter.num_to_words(467)
    => four hundred sixty seven

    Converter.num_to_words(9, :francais)
    => 'neuf' // assuming existence of ./francais.yml

    Converter.num_to_words(3482000)
    => three million four hundred eighty two thousand

    Converter.num_to_words(673457575991004050012100)
    => "six hundred seventy three sextillion four hundred fifty seven
    quintillion five hundred seventy five quadrillion nine hundred ninety
    one trillion four billion fifty million twelve thousand one hundred"

# Tests

    ruby test.rb
