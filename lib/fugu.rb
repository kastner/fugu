require 'array'

class Fugu
  attr_accessor :text
  
  def puff
    @text.split('|').collect do |range|
      if range.match(/\{/)
        before, expand_string, after = range.scan(/(.*)(\{.*\})(.*)/)[0]
        expanded_string = puff_expression(expand_string)
        range = expanded_string.map { |piece| before + piece + after }
      end
      range
    end.flatten.join(",")
  end
  
  def puff!
    @text = puff
  end

  def puff_expression(string)
    string.gsub(/[\{\}]/, '').split(",").inject([]) do |a,v|
      v = Range.new(*v.split('-')).to_a if v[/-/]
      a << v
    end.flatten
  end
  
  def shrink
    @text = shrink_expression(@text)
  end

  def shrink!
    @text = shrink
  end

  def shrink_expression(string)
    pieces = string.split(",")
    first, base = pieces.first, pieces.first
    first.size.times do |len|
      base = first[0, first.size-len]
      break if pieces.all? {|p| p.match(base)}
    end
    diffs = pieces.map {|p| (p.scan(/./) - base.scan(/./)).join}
    extras = diffs.flatten.to_ranges.map do |r|
      if r.first == r.last
        r.first
      else
        "#{r.first}-#{r.last}"
      end
    end.join(",")
    base + "{#{extras}}"
  end  
end

