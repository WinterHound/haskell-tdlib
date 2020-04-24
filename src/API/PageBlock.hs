-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlock where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlockListItem as PageBlockListItem
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.PageBlockTableCell as PageBlockTableCell
import {-# SOURCE #-} qualified API.PageBlockRelatedArticle as PageBlockRelatedArticle
import {-# SOURCE #-} qualified API.RichText as RichText
import {-# SOURCE #-} qualified API.PageBlockCaption as PageBlockCaption
import {-# SOURCE #-} qualified API.Location as Location

data PageBlock = 
 PageBlockTitle { _title :: Maybe RichText.RichText }  
 | PageBlockSubtitle { subtitle :: Maybe RichText.RichText }  
 | PageBlockAuthorDate { publish_date :: Maybe Int, _author :: Maybe RichText.RichText }  
 | PageBlockHeader { header :: Maybe RichText.RichText }  
 | PageBlockSubheader { subheader :: Maybe RichText.RichText }  
 | PageBlockKicker { kicker :: Maybe RichText.RichText }  
 | PageBlockParagraph { text :: Maybe RichText.RichText }  
 | PageBlockPreformatted { language :: Maybe String, text :: Maybe RichText.RichText }  
 | PageBlockFooter { footer :: Maybe RichText.RichText }  
 | PageBlockDivider 
 | PageBlockAnchor { name :: Maybe String }  
 | PageBlockList { items :: Maybe [PageBlockListItem.PageBlockListItem] }  
 | PageBlockBlockQuote { credit :: Maybe RichText.RichText, text :: Maybe RichText.RichText }  
 | PageBlockPullQuote { credit :: Maybe RichText.RichText, text :: Maybe RichText.RichText }  
 | PageBlockAnimation { need_autoplay :: Maybe Bool, caption :: Maybe PageBlockCaption.PageBlockCaption, animation :: Maybe Animation.Animation }  
 | PageBlockAudio { caption :: Maybe PageBlockCaption.PageBlockCaption, audio :: Maybe Audio.Audio }  
 | PageBlockPhoto { url :: Maybe String, caption :: Maybe PageBlockCaption.PageBlockCaption, _photo :: Maybe Photo.Photo }  
 | PageBlockVideo { is_looped :: Maybe Bool, need_autoplay :: Maybe Bool, caption :: Maybe PageBlockCaption.PageBlockCaption, video :: Maybe Video.Video }  
 | PageBlockVoiceNote { caption :: Maybe PageBlockCaption.PageBlockCaption, voice_note :: Maybe VoiceNote.VoiceNote }  
 | PageBlockCover { cover :: Maybe PageBlock }  
 | PageBlockEmbedded { allow_scrolling :: Maybe Bool, is_full_width :: Maybe Bool, caption :: Maybe PageBlockCaption.PageBlockCaption, height :: Maybe Int, width :: Maybe Int, poster_photo :: Maybe Photo.Photo, html :: Maybe String, url :: Maybe String }  
 | PageBlockEmbeddedPost { caption :: Maybe PageBlockCaption.PageBlockCaption, page_blocks :: Maybe [PageBlock], date :: Maybe Int, author_photo :: Maybe Photo.Photo, author :: Maybe String, url :: Maybe String }  
 | PageBlockCollage { caption :: Maybe PageBlockCaption.PageBlockCaption, page_blocks :: Maybe [PageBlock] }  
 | PageBlockSlideshow { caption :: Maybe PageBlockCaption.PageBlockCaption, page_blocks :: Maybe [PageBlock] }  
 | PageBlockChatLink { username :: Maybe String, photo :: Maybe ChatPhoto.ChatPhoto, title :: Maybe String }  
 | PageBlockTable { is_striped :: Maybe Bool, is_bordered :: Maybe Bool, cells :: Maybe [PageBlockTableCell.PageBlockTableCell], _caption :: Maybe RichText.RichText }  
 | PageBlockDetails { is_open :: Maybe Bool, page_blocks :: Maybe [PageBlock], header :: Maybe RichText.RichText }  
 | PageBlockRelatedArticles { articles :: Maybe [PageBlockRelatedArticle.PageBlockRelatedArticle], header :: Maybe RichText.RichText }  
 | PageBlockMap { caption :: Maybe PageBlockCaption.PageBlockCaption, height :: Maybe Int, width :: Maybe Int, zoom :: Maybe Int, location :: Maybe Location.Location }  deriving (Show, Eq)

instance T.ToJSON PageBlock where
 toJSON (PageBlockTitle { _title = _title }) =
  A.object [ "@type" A..= T.String "pageBlockTitle", "title" A..= _title ]

 toJSON (PageBlockSubtitle { subtitle = subtitle }) =
  A.object [ "@type" A..= T.String "pageBlockSubtitle", "subtitle" A..= subtitle ]

 toJSON (PageBlockAuthorDate { publish_date = publish_date, _author = _author }) =
  A.object [ "@type" A..= T.String "pageBlockAuthorDate", "publish_date" A..= publish_date, "author" A..= _author ]

 toJSON (PageBlockHeader { header = header }) =
  A.object [ "@type" A..= T.String "pageBlockHeader", "header" A..= header ]

 toJSON (PageBlockSubheader { subheader = subheader }) =
  A.object [ "@type" A..= T.String "pageBlockSubheader", "subheader" A..= subheader ]

 toJSON (PageBlockKicker { kicker = kicker }) =
  A.object [ "@type" A..= T.String "pageBlockKicker", "kicker" A..= kicker ]

 toJSON (PageBlockParagraph { text = text }) =
  A.object [ "@type" A..= T.String "pageBlockParagraph", "text" A..= text ]

 toJSON (PageBlockPreformatted { language = language, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockPreformatted", "language" A..= language, "text" A..= text ]

 toJSON (PageBlockFooter { footer = footer }) =
  A.object [ "@type" A..= T.String "pageBlockFooter", "footer" A..= footer ]

 toJSON (PageBlockDivider {  }) =
  A.object [ "@type" A..= T.String "pageBlockDivider" ]

 toJSON (PageBlockAnchor { name = name }) =
  A.object [ "@type" A..= T.String "pageBlockAnchor", "name" A..= name ]

 toJSON (PageBlockList { items = items }) =
  A.object [ "@type" A..= T.String "pageBlockList", "items" A..= items ]

 toJSON (PageBlockBlockQuote { credit = credit, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockBlockQuote", "credit" A..= credit, "text" A..= text ]

 toJSON (PageBlockPullQuote { credit = credit, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockPullQuote", "credit" A..= credit, "text" A..= text ]

 toJSON (PageBlockAnimation { need_autoplay = need_autoplay, caption = caption, animation = animation }) =
  A.object [ "@type" A..= T.String "pageBlockAnimation", "need_autoplay" A..= need_autoplay, "caption" A..= caption, "animation" A..= animation ]

 toJSON (PageBlockAudio { caption = caption, audio = audio }) =
  A.object [ "@type" A..= T.String "pageBlockAudio", "caption" A..= caption, "audio" A..= audio ]

 toJSON (PageBlockPhoto { url = url, caption = caption, _photo = _photo }) =
  A.object [ "@type" A..= T.String "pageBlockPhoto", "url" A..= url, "caption" A..= caption, "photo" A..= _photo ]

 toJSON (PageBlockVideo { is_looped = is_looped, need_autoplay = need_autoplay, caption = caption, video = video }) =
  A.object [ "@type" A..= T.String "pageBlockVideo", "is_looped" A..= is_looped, "need_autoplay" A..= need_autoplay, "caption" A..= caption, "video" A..= video ]

 toJSON (PageBlockVoiceNote { caption = caption, voice_note = voice_note }) =
  A.object [ "@type" A..= T.String "pageBlockVoiceNote", "caption" A..= caption, "voice_note" A..= voice_note ]

 toJSON (PageBlockCover { cover = cover }) =
  A.object [ "@type" A..= T.String "pageBlockCover", "cover" A..= cover ]

 toJSON (PageBlockEmbedded { allow_scrolling = allow_scrolling, is_full_width = is_full_width, caption = caption, height = height, width = width, poster_photo = poster_photo, html = html, url = url }) =
  A.object [ "@type" A..= T.String "pageBlockEmbedded", "allow_scrolling" A..= allow_scrolling, "is_full_width" A..= is_full_width, "caption" A..= caption, "height" A..= height, "width" A..= width, "poster_photo" A..= poster_photo, "html" A..= html, "url" A..= url ]

 toJSON (PageBlockEmbeddedPost { caption = caption, page_blocks = page_blocks, date = date, author_photo = author_photo, author = author, url = url }) =
  A.object [ "@type" A..= T.String "pageBlockEmbeddedPost", "caption" A..= caption, "page_blocks" A..= page_blocks, "date" A..= date, "author_photo" A..= author_photo, "author" A..= author, "url" A..= url ]

 toJSON (PageBlockCollage { caption = caption, page_blocks = page_blocks }) =
  A.object [ "@type" A..= T.String "pageBlockCollage", "caption" A..= caption, "page_blocks" A..= page_blocks ]

 toJSON (PageBlockSlideshow { caption = caption, page_blocks = page_blocks }) =
  A.object [ "@type" A..= T.String "pageBlockSlideshow", "caption" A..= caption, "page_blocks" A..= page_blocks ]

 toJSON (PageBlockChatLink { username = username, photo = photo, title = title }) =
  A.object [ "@type" A..= T.String "pageBlockChatLink", "username" A..= username, "photo" A..= photo, "title" A..= title ]

 toJSON (PageBlockTable { is_striped = is_striped, is_bordered = is_bordered, cells = cells, _caption = _caption }) =
  A.object [ "@type" A..= T.String "pageBlockTable", "is_striped" A..= is_striped, "is_bordered" A..= is_bordered, "cells" A..= cells, "caption" A..= _caption ]

 toJSON (PageBlockDetails { is_open = is_open, page_blocks = page_blocks, header = header }) =
  A.object [ "@type" A..= T.String "pageBlockDetails", "is_open" A..= is_open, "page_blocks" A..= page_blocks, "header" A..= header ]

 toJSON (PageBlockRelatedArticles { articles = articles, header = header }) =
  A.object [ "@type" A..= T.String "pageBlockRelatedArticles", "articles" A..= articles, "header" A..= header ]

 toJSON (PageBlockMap { caption = caption, height = height, width = width, zoom = zoom, location = location }) =
  A.object [ "@type" A..= T.String "pageBlockMap", "caption" A..= caption, "height" A..= height, "width" A..= width, "zoom" A..= zoom, "location" A..= location ]

instance T.FromJSON PageBlock where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockTitle" -> parsePageBlockTitle v
   "pageBlockSubtitle" -> parsePageBlockSubtitle v
   "pageBlockAuthorDate" -> parsePageBlockAuthorDate v
   "pageBlockHeader" -> parsePageBlockHeader v
   "pageBlockSubheader" -> parsePageBlockSubheader v
   "pageBlockKicker" -> parsePageBlockKicker v
   "pageBlockParagraph" -> parsePageBlockParagraph v
   "pageBlockPreformatted" -> parsePageBlockPreformatted v
   "pageBlockFooter" -> parsePageBlockFooter v
   "pageBlockDivider" -> parsePageBlockDivider v
   "pageBlockAnchor" -> parsePageBlockAnchor v
   "pageBlockList" -> parsePageBlockList v
   "pageBlockBlockQuote" -> parsePageBlockBlockQuote v
   "pageBlockPullQuote" -> parsePageBlockPullQuote v
   "pageBlockAnimation" -> parsePageBlockAnimation v
   "pageBlockAudio" -> parsePageBlockAudio v
   "pageBlockPhoto" -> parsePageBlockPhoto v
   "pageBlockVideo" -> parsePageBlockVideo v
   "pageBlockVoiceNote" -> parsePageBlockVoiceNote v
   "pageBlockCover" -> parsePageBlockCover v
   "pageBlockEmbedded" -> parsePageBlockEmbedded v
   "pageBlockEmbeddedPost" -> parsePageBlockEmbeddedPost v
   "pageBlockCollage" -> parsePageBlockCollage v
   "pageBlockSlideshow" -> parsePageBlockSlideshow v
   "pageBlockChatLink" -> parsePageBlockChatLink v
   "pageBlockTable" -> parsePageBlockTable v
   "pageBlockDetails" -> parsePageBlockDetails v
   "pageBlockRelatedArticles" -> parsePageBlockRelatedArticles v
   "pageBlockMap" -> parsePageBlockMap v
   _ -> mempty
  where
   parsePageBlockTitle :: A.Value -> T.Parser PageBlock
   parsePageBlockTitle = A.withObject "PageBlockTitle" $ \o -> do
    _title <- optional $ o A..: "title"
    return $ PageBlockTitle { _title = _title }

   parsePageBlockSubtitle :: A.Value -> T.Parser PageBlock
   parsePageBlockSubtitle = A.withObject "PageBlockSubtitle" $ \o -> do
    subtitle <- optional $ o A..: "subtitle"
    return $ PageBlockSubtitle { subtitle = subtitle }

   parsePageBlockAuthorDate :: A.Value -> T.Parser PageBlock
   parsePageBlockAuthorDate = A.withObject "PageBlockAuthorDate" $ \o -> do
    publish_date <- optional $ o A..: "publish_date"
    _author <- optional $ o A..: "author"
    return $ PageBlockAuthorDate { publish_date = publish_date, _author = _author }

   parsePageBlockHeader :: A.Value -> T.Parser PageBlock
   parsePageBlockHeader = A.withObject "PageBlockHeader" $ \o -> do
    header <- optional $ o A..: "header"
    return $ PageBlockHeader { header = header }

   parsePageBlockSubheader :: A.Value -> T.Parser PageBlock
   parsePageBlockSubheader = A.withObject "PageBlockSubheader" $ \o -> do
    subheader <- optional $ o A..: "subheader"
    return $ PageBlockSubheader { subheader = subheader }

   parsePageBlockKicker :: A.Value -> T.Parser PageBlock
   parsePageBlockKicker = A.withObject "PageBlockKicker" $ \o -> do
    kicker <- optional $ o A..: "kicker"
    return $ PageBlockKicker { kicker = kicker }

   parsePageBlockParagraph :: A.Value -> T.Parser PageBlock
   parsePageBlockParagraph = A.withObject "PageBlockParagraph" $ \o -> do
    text <- optional $ o A..: "text"
    return $ PageBlockParagraph { text = text }

   parsePageBlockPreformatted :: A.Value -> T.Parser PageBlock
   parsePageBlockPreformatted = A.withObject "PageBlockPreformatted" $ \o -> do
    language <- optional $ o A..: "language"
    text <- optional $ o A..: "text"
    return $ PageBlockPreformatted { language = language, text = text }

   parsePageBlockFooter :: A.Value -> T.Parser PageBlock
   parsePageBlockFooter = A.withObject "PageBlockFooter" $ \o -> do
    footer <- optional $ o A..: "footer"
    return $ PageBlockFooter { footer = footer }

   parsePageBlockDivider :: A.Value -> T.Parser PageBlock
   parsePageBlockDivider = A.withObject "PageBlockDivider" $ \o -> do
    return $ PageBlockDivider {  }

   parsePageBlockAnchor :: A.Value -> T.Parser PageBlock
   parsePageBlockAnchor = A.withObject "PageBlockAnchor" $ \o -> do
    name <- optional $ o A..: "name"
    return $ PageBlockAnchor { name = name }

   parsePageBlockList :: A.Value -> T.Parser PageBlock
   parsePageBlockList = A.withObject "PageBlockList" $ \o -> do
    items <- optional $ o A..: "items"
    return $ PageBlockList { items = items }

   parsePageBlockBlockQuote :: A.Value -> T.Parser PageBlock
   parsePageBlockBlockQuote = A.withObject "PageBlockBlockQuote" $ \o -> do
    credit <- optional $ o A..: "credit"
    text <- optional $ o A..: "text"
    return $ PageBlockBlockQuote { credit = credit, text = text }

   parsePageBlockPullQuote :: A.Value -> T.Parser PageBlock
   parsePageBlockPullQuote = A.withObject "PageBlockPullQuote" $ \o -> do
    credit <- optional $ o A..: "credit"
    text <- optional $ o A..: "text"
    return $ PageBlockPullQuote { credit = credit, text = text }

   parsePageBlockAnimation :: A.Value -> T.Parser PageBlock
   parsePageBlockAnimation = A.withObject "PageBlockAnimation" $ \o -> do
    need_autoplay <- optional $ o A..: "need_autoplay"
    caption <- optional $ o A..: "caption"
    animation <- optional $ o A..: "animation"
    return $ PageBlockAnimation { need_autoplay = need_autoplay, caption = caption, animation = animation }

   parsePageBlockAudio :: A.Value -> T.Parser PageBlock
   parsePageBlockAudio = A.withObject "PageBlockAudio" $ \o -> do
    caption <- optional $ o A..: "caption"
    audio <- optional $ o A..: "audio"
    return $ PageBlockAudio { caption = caption, audio = audio }

   parsePageBlockPhoto :: A.Value -> T.Parser PageBlock
   parsePageBlockPhoto = A.withObject "PageBlockPhoto" $ \o -> do
    url <- optional $ o A..: "url"
    caption <- optional $ o A..: "caption"
    _photo <- optional $ o A..: "photo"
    return $ PageBlockPhoto { url = url, caption = caption, _photo = _photo }

   parsePageBlockVideo :: A.Value -> T.Parser PageBlock
   parsePageBlockVideo = A.withObject "PageBlockVideo" $ \o -> do
    is_looped <- optional $ o A..: "is_looped"
    need_autoplay <- optional $ o A..: "need_autoplay"
    caption <- optional $ o A..: "caption"
    video <- optional $ o A..: "video"
    return $ PageBlockVideo { is_looped = is_looped, need_autoplay = need_autoplay, caption = caption, video = video }

   parsePageBlockVoiceNote :: A.Value -> T.Parser PageBlock
   parsePageBlockVoiceNote = A.withObject "PageBlockVoiceNote" $ \o -> do
    caption <- optional $ o A..: "caption"
    voice_note <- optional $ o A..: "voice_note"
    return $ PageBlockVoiceNote { caption = caption, voice_note = voice_note }

   parsePageBlockCover :: A.Value -> T.Parser PageBlock
   parsePageBlockCover = A.withObject "PageBlockCover" $ \o -> do
    cover <- optional $ o A..: "cover"
    return $ PageBlockCover { cover = cover }

   parsePageBlockEmbedded :: A.Value -> T.Parser PageBlock
   parsePageBlockEmbedded = A.withObject "PageBlockEmbedded" $ \o -> do
    allow_scrolling <- optional $ o A..: "allow_scrolling"
    is_full_width <- optional $ o A..: "is_full_width"
    caption <- optional $ o A..: "caption"
    height <- optional $ o A..: "height"
    width <- optional $ o A..: "width"
    poster_photo <- optional $ o A..: "poster_photo"
    html <- optional $ o A..: "html"
    url <- optional $ o A..: "url"
    return $ PageBlockEmbedded { allow_scrolling = allow_scrolling, is_full_width = is_full_width, caption = caption, height = height, width = width, poster_photo = poster_photo, html = html, url = url }

   parsePageBlockEmbeddedPost :: A.Value -> T.Parser PageBlock
   parsePageBlockEmbeddedPost = A.withObject "PageBlockEmbeddedPost" $ \o -> do
    caption <- optional $ o A..: "caption"
    page_blocks <- optional $ o A..: "page_blocks"
    date <- optional $ o A..: "date"
    author_photo <- optional $ o A..: "author_photo"
    author <- optional $ o A..: "author"
    url <- optional $ o A..: "url"
    return $ PageBlockEmbeddedPost { caption = caption, page_blocks = page_blocks, date = date, author_photo = author_photo, author = author, url = url }

   parsePageBlockCollage :: A.Value -> T.Parser PageBlock
   parsePageBlockCollage = A.withObject "PageBlockCollage" $ \o -> do
    caption <- optional $ o A..: "caption"
    page_blocks <- optional $ o A..: "page_blocks"
    return $ PageBlockCollage { caption = caption, page_blocks = page_blocks }

   parsePageBlockSlideshow :: A.Value -> T.Parser PageBlock
   parsePageBlockSlideshow = A.withObject "PageBlockSlideshow" $ \o -> do
    caption <- optional $ o A..: "caption"
    page_blocks <- optional $ o A..: "page_blocks"
    return $ PageBlockSlideshow { caption = caption, page_blocks = page_blocks }

   parsePageBlockChatLink :: A.Value -> T.Parser PageBlock
   parsePageBlockChatLink = A.withObject "PageBlockChatLink" $ \o -> do
    username <- optional $ o A..: "username"
    photo <- optional $ o A..: "photo"
    title <- optional $ o A..: "title"
    return $ PageBlockChatLink { username = username, photo = photo, title = title }

   parsePageBlockTable :: A.Value -> T.Parser PageBlock
   parsePageBlockTable = A.withObject "PageBlockTable" $ \o -> do
    is_striped <- optional $ o A..: "is_striped"
    is_bordered <- optional $ o A..: "is_bordered"
    cells <- optional $ o A..: "cells"
    _caption <- optional $ o A..: "caption"
    return $ PageBlockTable { is_striped = is_striped, is_bordered = is_bordered, cells = cells, _caption = _caption }

   parsePageBlockDetails :: A.Value -> T.Parser PageBlock
   parsePageBlockDetails = A.withObject "PageBlockDetails" $ \o -> do
    is_open <- optional $ o A..: "is_open"
    page_blocks <- optional $ o A..: "page_blocks"
    header <- optional $ o A..: "header"
    return $ PageBlockDetails { is_open = is_open, page_blocks = page_blocks, header = header }

   parsePageBlockRelatedArticles :: A.Value -> T.Parser PageBlock
   parsePageBlockRelatedArticles = A.withObject "PageBlockRelatedArticles" $ \o -> do
    articles <- optional $ o A..: "articles"
    header <- optional $ o A..: "header"
    return $ PageBlockRelatedArticles { articles = articles, header = header }

   parsePageBlockMap :: A.Value -> T.Parser PageBlock
   parsePageBlockMap = A.withObject "PageBlockMap" $ \o -> do
    caption <- optional $ o A..: "caption"
    height <- optional $ o A..: "height"
    width <- optional $ o A..: "width"
    zoom <- optional $ o A..: "zoom"
    location <- optional $ o A..: "location"
    return $ PageBlockMap { caption = caption, height = height, width = width, zoom = zoom, location = location }