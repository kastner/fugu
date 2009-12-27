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
    out = string.dup
    out.gsub!(/[\{\}]/, '')
    tmp_a = []
    if out =~ /,/
      out.split(",").each do |v|
        # Test for a range
        if v =~ /-/
          tmp_a << Range.new(*v.split('-')).to_a
        else
          tmp_a << v
        end
      end
    elsif out =~ /-/
      tmp_a << Range.new(*out.split('-')).to_a
    else
      tmp_a << out
    end
    return tmp_a.flatten
  end
end

