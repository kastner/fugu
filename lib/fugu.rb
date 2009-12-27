class Fugu
  attr_accessor :text
  
  def expand
    if @text.match(/\{/)
      before, expand_string, after = @text.scan(/(.*)(\{.*\})(.*)/)[0]
      expanded_string = expand_expression(expand_string)
      @text = expanded_string.map { |piece| before + piece + after }.join(",")
    end
  end
  
  def expand_expression(string)
    string.gsub(/[\{\}]/, '').split(",").inject([]) do |a,v|
      v = Range.new(*v.split('-')).to_a if v[/-/]
      a << v
    end.flatten
  end
end

