#! /usr/bin/ruby

def add_gram_to_multi_word(token)
  pron = token.split("-").collect {| w | w.chomp.strip}.join(" ")

  stories =  Dir.glob('stories/*')
  stories.each do |story|
    story_changed = false
    File.open story do |file|
      arr = file.collect do |line|
              if line =~ /<w .* t="#{token}" .*\/>/
                gram = "<gram t=\"#{pron}\" />"
                puts line
                story_changed = true
                num_of_white_space = line.index(/<w/)
                puts num_of_white_space
                prefix_t = " " * (num_of_white_space + 4)
                prefix_w = " " * num_of_white_space
                line.gsub!(/\s*\/>/, ">")
                gram =  prefix_t + gram + "\n"
                sub_w = prefix_w + "</w>\n"
                puts line + gram + sub_w
                line + gram + sub_w
              else
                line
              end
            end
      if story_changed
        File.open(story, "w") do |f|
          arr.each do |a|
            f.write(a)
          end
        end
      end
    end
  end
end

token_list = ["multi-vitamin"]
token_list.each do |token|
  add_gram_to_multi_word token
end

