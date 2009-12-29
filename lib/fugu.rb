require 'array'

class Fugu
  attr_accessor :text, :delimiter

  def self.puff(string)
    f = self.new
    f.text = string
    f.puff
  end
 
  def puff
    @text.split('|').collect do |range|
      if range.match(/\{/)
        before, expand_string, after = range.scan(/(.*)\{(.*)\}(.*)/)[0]
        expanded_string = puff_expression(expand_string)
        range = expanded_string.map { |piece| before + piece + after }
      end
      range
    end.flatten
  end
  
  def puff!
    @text = puff
  end
  
  def puff_expression(string)
    string.split(",").collect do |v|
      (v[/-/]) ? Range.new(*pad_expression(v).split('-')).to_a : v
    end.flatten
  end
  
  def self.shrink(string, delimiter)
    f = self.new
    f.text = string
    f.delimiter = delimiter
    f.shrink
  end
  
  def shrink
    pieces = @text.split("#{@delimiter}")
    first, base = pieces.first, pieces.first
    first.size.times do |len|
      base = first[0, first.size-len]
      break if pieces.all? {|p| p.match(base)}
    end
    diffs = pieces.map {|p| (p.scan(/./) - base.scan(/./)).join}
    base + "{#{shrink_array(diffs)}}"
  end
  
  def shrink!
    @text = shrink
  end
  
  def shrink_array(array)
    array.flatten.to_ranges.map do |r|
      if r.first == r.last
        r.first
      else
        "#{r.first}-#{r.last}"
      end
    end.join(",")
  end
  
  def pad_expression(string)
    fat = string.split('-')
    "%0#{fat.last.length}d-#{fat.last}" % fat.first.to_i
  end
end

