require 'yaml'

class Converter

  def self.num_to_words(number, language: :english)
    new(number, language).translate
  end

  def initialize(number, language)
    @number = number
    @name_of = Dictionary.new(language)
  end

  def translate
    raise ArgumentError, "Cannot translate number" unless @name_of.representable?(@number)
    return @name_of.zero if @number == 0
    words = []
    reversed_triples(@number).each_with_index do |triple, index|
      triple_name = @name_of.triple(triple)
      group_name = @name_of.group(index)
      if !triple_name.empty?
        subwords = [triple_name, group_name]
        words.unshift subwords.compact.join(' ')
      end
    end
    words.unshift "negative" if @number < 0
    words.compact.join(' ')
  end

  private

  # 5634391 => [391, 634, 5]
  def reversed_triples(n)
    n.to_s.reverse.scan(/.?.?./).map(&:reverse).map(&:to_i)
  end
end

class Converter
  class Dictionary
    # one could just look for #{language}.yml and avoid the hash,
    # but I don't like using user input to reference the file system directly
    DICTIONARY_FILES = {
      :english => './english.yml'.freeze
    }

    def initialize(language)
      dictionary_file = DICTIONARY_FILES[language]
      @dictionary = ::YAML.load(File.read(dictionary_file))
    end

    def representable?(n)
      n.to_s.length <= @dictionary['groups'].length * 3
    end

    # where by 'triple' I mean a 1-3 digit number
    def triple(n)
      words = []
      digits = n.to_s.split('').map(&:to_i)
      triple_length = digits.length
      digits.each_with_index do |d, index|
        place = triple_length - index
        # special case: teens
        if d == 1 && place == 2
          words.push teen(n % 100 - 10)
          break
        else
          case place
          when 3 then words.push digit(d) + " hundred"
          when 2 then words.push ten(d)
          when 1 then words.push digit(d)
          end
        end
      end
      words.compact.join(' ')
    end

    def group(index)
      @dictionary['groups'][index]
    end

    def zero
      @dictionary['zero']
    end

    def digit(index)
      @dictionary['digits'][index]
    end

    def teen(index)
      @dictionary['teens'][index] # NB not the same as "tens"
    end

    def ten(index)
      @dictionary['tens'][index]
    end

  end
end
