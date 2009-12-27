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
end

