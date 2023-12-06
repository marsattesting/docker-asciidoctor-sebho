require_relative 'emoji-multilang/extension'

Asciidoctor::Extensions.register do
    if @document.basebackend? 'html'
      inline_macro EmojiInlineMacroIsoEmojiJS
    end
end