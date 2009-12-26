class Fugu
  attr_accessor :text
  
  def expand
    if @text.match(/\{/)
      before, expand_string, after = @text.scan(/(.*)(\{.*\})(.*)/)[0]
      expanded_string = expand_expression(expand_string)
      raise expanded_string.inspect
      @text = expanded_string.map { |piece| before + piece + after }.join(",")
    end
  end
  
  def expand_expression(string)
    out = string.dup
    out.gsub!(/[\{\}]/, '')
    range = out.split(",")
    Range.new(*range).to_a
  end

  def expand_range(string)
    out = string.dup
    out.gsub!(/[\-]/, '..')
    Range.new(*range).to_a
  end
end
