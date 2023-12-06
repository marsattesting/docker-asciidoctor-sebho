#require 'logger'

require_relative './map-emoji-noto-en'
require_relative './map-emoji-noto-fr'
require_relative './map-emoji-noto-pl'

include Asciidoctor

class EmojiInlineMacroIsoEmojiJS < Extensions::InlineMacroProcessor
  include Asciidoctor::Logging
  use_dsl

  named :emoji
  name_positional_attributes 'size', 'lang', 'url-emoji'

  SIZE_MAP = { '1x' => 17, 'lg' => 24, '2x' => 34, '3x' => 50, '4x' => 68, '5x' => 85 }
  SIZE_MAP.default = 24

  def process(parent, target, attributes)
    #logger = Logger.new($stdout)
    doc = parent.document
    lang = (doc.attr 'lang') || 'en'
    lang_attr = attributes['lang']
    if lang_attr
      lang = lang_attr
    end
    size_attr = attributes['size']
    size = SIZE_MAP.default
    if size_attr && size_attr.strip.end_with?("px")
      size = size_attr
    elsif size_attr && SIZE_MAP[size_attr]
      size = SIZE_MAP[size_attr]
    end
    urlemoji =  (doc.attr 'url-emoji') || 'https://raw.githubusercontent.com/googlefonts/noto-emoji/main'
    urlemoji_attr = attributes['url-emoji']
    if urlemoji_attr
      urlemoji = urlemoji_attr
    end

    #logger.info("size: #{size} - lang: #{lang}")

    unicodeEmoji = ""
    if lang == "en"
      unicodeEmoji = MAPEMOJINOTOEN[target]
    elsif lang == "fr"
      unicodeEmoji = MAPEMOJINOTOFR[target]
    elsif lang == "pl"
      unicodeEmoji = MAPEMOJINOTOPL[target]
    else
      logger.warn("Skipping emoji inline macro. #{lang} not implemented.")
    end

    #logger.info("unicodeEmoji: #{unicodeEmoji}")
    if unicodeEmoji.nil?
      logger.warn("Skipping emoji inline macro. #{target} not found in '#{lang}'")
      create_inline parent, :image, nil , target: target,  attributes: { 'alt' => target + "-" + lang, 'width' => size.to_s, 'height' => size.to_s }
    else
      #logger.warn("target: #{target} - unicodeEmoji: #{unicodeEmoji} - size: #{size}")
      qtarget = "#{urlemoji}/svg/emoji_u#{unicodeEmoji}.svg"
      create_inline parent, :image, nil , target: qtarget,  attributes: { 'alt' => target, 'width' => size.to_s, 'height' => size.to_s }
    end
  end
end