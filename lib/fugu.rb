class Fugu
  attr_accessor :text
  
  def expand
    tmp_a = []
    if @text[/\|/]
      @text.split('|').each do |range|
        if range.match(/\{/)
          before, expand_string, after = range.scan(/(.*)(\{.*\})(.*)/)[0]
          expanded_string = expand_expression(expand_string)
          tmp_a << expanded_string.map { |piece| before + piece + after }
        else
          tmp_a << range
        end
      end
    else
      if @text.match(/\{/)
        before, expand_string, after = @text.scan(/(.*)(\{.*\})(.*)/)[0]
        expanded_string = expand_expression(expand_string)
        tmp_a << expanded_string.map { |piece| before + piece + after }
      end
    end
    return tmp_a.flatten.join(',')
  end
  
  def expand_expression(string)
    string.gsub(/[\{\}]/, '').split(",").inject([]) do |a,v|
      v = Range.new(*v.split('-')).to_a if v[/-/]
      a << v
    end.flatten
  end
end

