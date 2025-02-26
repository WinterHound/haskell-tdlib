{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputInlineQueryResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Contact as Contact
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.Location as Location
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.Venue as Venue
import qualified Utils as U

-- | Represents a single result of an inline query; for bots only
data InputInlineQueryResult
  = -- | Represents a link to an animated GIF or an animated (i.e., without sound) H.264/MPEG-4 AVC video
    InputInlineQueryResultAnimation
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        video_height :: Maybe Int,
        -- |
        video_width :: Maybe Int,
        -- | Duration of the video, in seconds @video_width Width of the video @video_height Height of the video
        video_duration :: Maybe Int,
        -- |
        video_mime_type :: Maybe String,
        -- | The URL of the video file (file size must not exceed 1MB) @video_mime_type MIME type of the video file. Must be one of "image/gif" and "video/mp4"
        video_url :: Maybe String,
        -- |
        thumbnail_mime_type :: Maybe String,
        -- | URL of the result thumbnail (JPEG, GIF, or MPEG4), if it exists @thumbnail_mime_type MIME type of the video thumbnail. If non-empty, must be one of "image/jpeg", "image/gif" and "video/mp4"
        thumbnail_url :: Maybe String,
        -- |
        title :: Maybe String,
        -- | Unique identifier of the query result @title Title of the query result
        _id :: Maybe String
      }
  | -- | Represents a link to an article or web page @id Unique identifier of the query result @url URL of the result, if it exists @hide_url True, if the URL must be not shown @title Title of the result
    InputInlineQueryResultArticle
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        thumbnail_height :: Maybe Int,
        -- |
        thumbnail_width :: Maybe Int,
        -- |
        thumbnail_url :: Maybe String,
        -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        hide_url :: Maybe Bool,
        -- |
        url :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a link to an MP3 audio file @id Unique identifier of the query result @title Title of the audio file @performer Performer of the audio file
    InputInlineQueryResultAudio
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAudio, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        audio_duration :: Maybe Int,
        -- | The URL of the audio file @audio_duration Audio file duration, in seconds
        audio_url :: Maybe String,
        -- |
        performer :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a user contact @id Unique identifier of the query result @contact User contact @thumbnail_url URL of the result thumbnail, if it exists @thumbnail_width Thumbnail width, if known @thumbnail_height Thumbnail height, if known
    InputInlineQueryResultContact
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        thumbnail_height :: Maybe Int,
        -- |
        thumbnail_width :: Maybe Int,
        -- |
        thumbnail_url :: Maybe String,
        -- |
        contact :: Maybe Contact.Contact,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a link to a file @id Unique identifier of the query result @title Title of the resulting file @param_description Short description of the result, if known @document_url URL of the file @mime_type MIME type of the file content; only "application/pdf" and "application/zip" are currently allowed
    InputInlineQueryResultDocument
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageDocument, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        thumbnail_height :: Maybe Int,
        -- |
        thumbnail_width :: Maybe Int,
        -- | The URL of the file thumbnail, if it exists @thumbnail_width Width of the thumbnail @thumbnail_height Height of the thumbnail
        thumbnail_url :: Maybe String,
        -- |
        mime_type :: Maybe String,
        -- |
        document_url :: Maybe String,
        -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a game @id Unique identifier of the query result @game_short_name Short name of the game @reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    InputInlineQueryResultGame
      { -- |
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        game_short_name :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a point on the map @id Unique identifier of the query result @location Location result
    InputInlineQueryResultLocation
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        thumbnail_height :: Maybe Int,
        -- |
        thumbnail_width :: Maybe Int,
        -- |
        thumbnail_url :: Maybe String,
        -- | Title of the result @thumbnail_url URL of the result thumbnail, if it exists @thumbnail_width Thumbnail width, if known @thumbnail_height Thumbnail height, if known
        title :: Maybe String,
        -- | Amount of time relative to the message sent time until the location can be updated, in seconds
        live_period :: Maybe Int,
        -- |
        location :: Maybe Location.Location,
        -- |
        _id :: Maybe String
      }
  | -- | Represents link to a JPEG image @id Unique identifier of the query result @title Title of the result, if known @param_description A short description of the result, if known @thumbnail_url URL of the photo thumbnail, if it exists
    InputInlineQueryResultPhoto
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessagePhoto, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        photo_height :: Maybe Int,
        -- |
        photo_width :: Maybe Int,
        -- | The URL of the JPEG photo (photo size must not exceed 5MB) @photo_width Width of the photo @photo_height Height of the photo
        photo_url :: Maybe String,
        -- |
        thumbnail_url :: Maybe String,
        -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a link to a WEBP, TGS, or WEBM sticker @id Unique identifier of the query result @thumbnail_url URL of the sticker thumbnail, if it exists
    InputInlineQueryResultSticker
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageSticker, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        sticker_height :: Maybe Int,
        -- |
        sticker_width :: Maybe Int,
        -- | The URL of the WEBP, TGS, or WEBM sticker (sticker file size must not exceed 5MB) @sticker_width Width of the sticker @sticker_height Height of the sticker
        sticker_url :: Maybe String,
        -- |
        thumbnail_url :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents information about a venue @id Unique identifier of the query result @venue Venue result @thumbnail_url URL of the result thumbnail, if it exists @thumbnail_width Thumbnail width, if known @thumbnail_height Thumbnail height, if known
    InputInlineQueryResultVenue
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        thumbnail_height :: Maybe Int,
        -- |
        thumbnail_width :: Maybe Int,
        -- |
        thumbnail_url :: Maybe String,
        -- |
        venue :: Maybe Venue.Venue,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a link to a page containing an embedded video player or a video file @id Unique identifier of the query result @title Title of the result @param_description A short description of the result, if known
    InputInlineQueryResultVideo
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVideo, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        video_duration :: Maybe Int,
        -- |
        video_height :: Maybe Int,
        -- | Width of the video @video_height Height of the video @video_duration Video duration, in seconds
        video_width :: Maybe Int,
        -- |
        mime_type :: Maybe String,
        -- |
        video_url :: Maybe String,
        -- | The URL of the video thumbnail (JPEG), if it exists @video_url URL of the embedded video player or video file @mime_type MIME type of the content of the video URL, only "text/html" or "video/mp4" are currently supported
        thumbnail_url :: Maybe String,
        -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a link to an opus-encoded audio file within an OGG container, single channel audio @id Unique identifier of the query result @title Title of the voice note
    InputInlineQueryResultVoiceNote
      { -- | The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVoiceNote, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
        input_message_content :: Maybe InputMessageContent.InputMessageContent,
        -- | The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
        reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
        -- |
        voice_note_duration :: Maybe Int,
        -- | The URL of the voice note file @voice_note_duration Duration of the voice note, in seconds
        voice_note_url :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        _id :: Maybe String
      }
  deriving (Eq)

instance Show InputInlineQueryResult where
  show
    InputInlineQueryResultAnimation
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        video_height = video_height_,
        video_width = video_width_,
        video_duration = video_duration_,
        video_mime_type = video_mime_type_,
        video_url = video_url_,
        thumbnail_mime_type = thumbnail_mime_type_,
        thumbnail_url = thumbnail_url_,
        title = title_,
        _id = _id_
      } =
      "InputInlineQueryResultAnimation"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "video_height" video_height_,
            U.p "video_width" video_width_,
            U.p "video_duration" video_duration_,
            U.p "video_mime_type" video_mime_type_,
            U.p "video_url" video_url_,
            U.p "thumbnail_mime_type" thumbnail_mime_type_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "title" title_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultArticle
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        description = description_,
        title = title_,
        hide_url = hide_url_,
        url = url_,
        _id = _id_
      } =
      "InputInlineQueryResultArticle"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "thumbnail_height" thumbnail_height_,
            U.p "thumbnail_width" thumbnail_width_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "hide_url" hide_url_,
            U.p "url" url_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultAudio
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        audio_duration = audio_duration_,
        audio_url = audio_url_,
        performer = performer_,
        title = title_,
        _id = _id_
      } =
      "InputInlineQueryResultAudio"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "audio_duration" audio_duration_,
            U.p "audio_url" audio_url_,
            U.p "performer" performer_,
            U.p "title" title_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultContact
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        contact = contact_,
        _id = _id_
      } =
      "InputInlineQueryResultContact"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "thumbnail_height" thumbnail_height_,
            U.p "thumbnail_width" thumbnail_width_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "contact" contact_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultDocument
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        mime_type = mime_type_,
        document_url = document_url_,
        description = description_,
        title = title_,
        _id = _id_
      } =
      "InputInlineQueryResultDocument"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "thumbnail_height" thumbnail_height_,
            U.p "thumbnail_width" thumbnail_width_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "mime_type" mime_type_,
            U.p "document_url" document_url_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultGame
      { reply_markup = reply_markup_,
        game_short_name = game_short_name_,
        _id = _id_
      } =
      "InputInlineQueryResultGame"
        ++ U.cc
          [ U.p "reply_markup" reply_markup_,
            U.p "game_short_name" game_short_name_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultLocation
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        title = title_,
        live_period = live_period_,
        location = location_,
        _id = _id_
      } =
      "InputInlineQueryResultLocation"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "thumbnail_height" thumbnail_height_,
            U.p "thumbnail_width" thumbnail_width_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "title" title_,
            U.p "live_period" live_period_,
            U.p "location" location_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultPhoto
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        photo_height = photo_height_,
        photo_width = photo_width_,
        photo_url = photo_url_,
        thumbnail_url = thumbnail_url_,
        description = description_,
        title = title_,
        _id = _id_
      } =
      "InputInlineQueryResultPhoto"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "photo_height" photo_height_,
            U.p "photo_width" photo_width_,
            U.p "photo_url" photo_url_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultSticker
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        sticker_height = sticker_height_,
        sticker_width = sticker_width_,
        sticker_url = sticker_url_,
        thumbnail_url = thumbnail_url_,
        _id = _id_
      } =
      "InputInlineQueryResultSticker"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "sticker_height" sticker_height_,
            U.p "sticker_width" sticker_width_,
            U.p "sticker_url" sticker_url_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultVenue
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        venue = venue_,
        _id = _id_
      } =
      "InputInlineQueryResultVenue"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "thumbnail_height" thumbnail_height_,
            U.p "thumbnail_width" thumbnail_width_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "venue" venue_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultVideo
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        video_duration = video_duration_,
        video_height = video_height_,
        video_width = video_width_,
        mime_type = mime_type_,
        video_url = video_url_,
        thumbnail_url = thumbnail_url_,
        description = description_,
        title = title_,
        _id = _id_
      } =
      "InputInlineQueryResultVideo"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "video_duration" video_duration_,
            U.p "video_height" video_height_,
            U.p "video_width" video_width_,
            U.p "mime_type" mime_type_,
            U.p "video_url" video_url_,
            U.p "thumbnail_url" thumbnail_url_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "_id" _id_
          ]
  show
    InputInlineQueryResultVoiceNote
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        voice_note_duration = voice_note_duration_,
        voice_note_url = voice_note_url_,
        title = title_,
        _id = _id_
      } =
      "InputInlineQueryResultVoiceNote"
        ++ U.cc
          [ U.p "input_message_content" input_message_content_,
            U.p "reply_markup" reply_markup_,
            U.p "voice_note_duration" voice_note_duration_,
            U.p "voice_note_url" voice_note_url_,
            U.p "title" title_,
            U.p "_id" _id_
          ]

instance T.FromJSON InputInlineQueryResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputInlineQueryResultAnimation" -> parseInputInlineQueryResultAnimation v
      "inputInlineQueryResultArticle" -> parseInputInlineQueryResultArticle v
      "inputInlineQueryResultAudio" -> parseInputInlineQueryResultAudio v
      "inputInlineQueryResultContact" -> parseInputInlineQueryResultContact v
      "inputInlineQueryResultDocument" -> parseInputInlineQueryResultDocument v
      "inputInlineQueryResultGame" -> parseInputInlineQueryResultGame v
      "inputInlineQueryResultLocation" -> parseInputInlineQueryResultLocation v
      "inputInlineQueryResultPhoto" -> parseInputInlineQueryResultPhoto v
      "inputInlineQueryResultSticker" -> parseInputInlineQueryResultSticker v
      "inputInlineQueryResultVenue" -> parseInputInlineQueryResultVenue v
      "inputInlineQueryResultVideo" -> parseInputInlineQueryResultVideo v
      "inputInlineQueryResultVoiceNote" -> parseInputInlineQueryResultVoiceNote v
      _ -> mempty
    where
      parseInputInlineQueryResultAnimation :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultAnimation = A.withObject "InputInlineQueryResultAnimation" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        video_height_ <- o A..:? "video_height"
        video_width_ <- o A..:? "video_width"
        video_duration_ <- o A..:? "video_duration"
        video_mime_type_ <- o A..:? "video_mime_type"
        video_url_ <- o A..:? "video_url"
        thumbnail_mime_type_ <- o A..:? "thumbnail_mime_type"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultAnimation {input_message_content = input_message_content_, reply_markup = reply_markup_, video_height = video_height_, video_width = video_width_, video_duration = video_duration_, video_mime_type = video_mime_type_, video_url = video_url_, thumbnail_mime_type = thumbnail_mime_type_, thumbnail_url = thumbnail_url_, title = title_, _id = _id_}

      parseInputInlineQueryResultArticle :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultArticle = A.withObject "InputInlineQueryResultArticle" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        thumbnail_height_ <- o A..:? "thumbnail_height"
        thumbnail_width_ <- o A..:? "thumbnail_width"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        hide_url_ <- o A..:? "hide_url"
        url_ <- o A..:? "url"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultArticle {input_message_content = input_message_content_, reply_markup = reply_markup_, thumbnail_height = thumbnail_height_, thumbnail_width = thumbnail_width_, thumbnail_url = thumbnail_url_, description = description_, title = title_, hide_url = hide_url_, url = url_, _id = _id_}

      parseInputInlineQueryResultAudio :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultAudio = A.withObject "InputInlineQueryResultAudio" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        audio_duration_ <- o A..:? "audio_duration"
        audio_url_ <- o A..:? "audio_url"
        performer_ <- o A..:? "performer"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultAudio {input_message_content = input_message_content_, reply_markup = reply_markup_, audio_duration = audio_duration_, audio_url = audio_url_, performer = performer_, title = title_, _id = _id_}

      parseInputInlineQueryResultContact :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultContact = A.withObject "InputInlineQueryResultContact" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        thumbnail_height_ <- o A..:? "thumbnail_height"
        thumbnail_width_ <- o A..:? "thumbnail_width"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        contact_ <- o A..:? "contact"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultContact {input_message_content = input_message_content_, reply_markup = reply_markup_, thumbnail_height = thumbnail_height_, thumbnail_width = thumbnail_width_, thumbnail_url = thumbnail_url_, contact = contact_, _id = _id_}

      parseInputInlineQueryResultDocument :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultDocument = A.withObject "InputInlineQueryResultDocument" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        thumbnail_height_ <- o A..:? "thumbnail_height"
        thumbnail_width_ <- o A..:? "thumbnail_width"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        mime_type_ <- o A..:? "mime_type"
        document_url_ <- o A..:? "document_url"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultDocument {input_message_content = input_message_content_, reply_markup = reply_markup_, thumbnail_height = thumbnail_height_, thumbnail_width = thumbnail_width_, thumbnail_url = thumbnail_url_, mime_type = mime_type_, document_url = document_url_, description = description_, title = title_, _id = _id_}

      parseInputInlineQueryResultGame :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultGame = A.withObject "InputInlineQueryResultGame" $ \o -> do
        reply_markup_ <- o A..:? "reply_markup"
        game_short_name_ <- o A..:? "game_short_name"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultGame {reply_markup = reply_markup_, game_short_name = game_short_name_, _id = _id_}

      parseInputInlineQueryResultLocation :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultLocation = A.withObject "InputInlineQueryResultLocation" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        thumbnail_height_ <- o A..:? "thumbnail_height"
        thumbnail_width_ <- o A..:? "thumbnail_width"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        title_ <- o A..:? "title"
        live_period_ <- o A..:? "live_period"
        location_ <- o A..:? "location"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultLocation {input_message_content = input_message_content_, reply_markup = reply_markup_, thumbnail_height = thumbnail_height_, thumbnail_width = thumbnail_width_, thumbnail_url = thumbnail_url_, title = title_, live_period = live_period_, location = location_, _id = _id_}

      parseInputInlineQueryResultPhoto :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultPhoto = A.withObject "InputInlineQueryResultPhoto" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        photo_height_ <- o A..:? "photo_height"
        photo_width_ <- o A..:? "photo_width"
        photo_url_ <- o A..:? "photo_url"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultPhoto {input_message_content = input_message_content_, reply_markup = reply_markup_, photo_height = photo_height_, photo_width = photo_width_, photo_url = photo_url_, thumbnail_url = thumbnail_url_, description = description_, title = title_, _id = _id_}

      parseInputInlineQueryResultSticker :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultSticker = A.withObject "InputInlineQueryResultSticker" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        sticker_height_ <- o A..:? "sticker_height"
        sticker_width_ <- o A..:? "sticker_width"
        sticker_url_ <- o A..:? "sticker_url"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultSticker {input_message_content = input_message_content_, reply_markup = reply_markup_, sticker_height = sticker_height_, sticker_width = sticker_width_, sticker_url = sticker_url_, thumbnail_url = thumbnail_url_, _id = _id_}

      parseInputInlineQueryResultVenue :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultVenue = A.withObject "InputInlineQueryResultVenue" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        thumbnail_height_ <- o A..:? "thumbnail_height"
        thumbnail_width_ <- o A..:? "thumbnail_width"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        venue_ <- o A..:? "venue"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultVenue {input_message_content = input_message_content_, reply_markup = reply_markup_, thumbnail_height = thumbnail_height_, thumbnail_width = thumbnail_width_, thumbnail_url = thumbnail_url_, venue = venue_, _id = _id_}

      parseInputInlineQueryResultVideo :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultVideo = A.withObject "InputInlineQueryResultVideo" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        video_duration_ <- o A..:? "video_duration"
        video_height_ <- o A..:? "video_height"
        video_width_ <- o A..:? "video_width"
        mime_type_ <- o A..:? "mime_type"
        video_url_ <- o A..:? "video_url"
        thumbnail_url_ <- o A..:? "thumbnail_url"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultVideo {input_message_content = input_message_content_, reply_markup = reply_markup_, video_duration = video_duration_, video_height = video_height_, video_width = video_width_, mime_type = mime_type_, video_url = video_url_, thumbnail_url = thumbnail_url_, description = description_, title = title_, _id = _id_}

      parseInputInlineQueryResultVoiceNote :: A.Value -> T.Parser InputInlineQueryResult
      parseInputInlineQueryResultVoiceNote = A.withObject "InputInlineQueryResultVoiceNote" $ \o -> do
        input_message_content_ <- o A..:? "input_message_content"
        reply_markup_ <- o A..:? "reply_markup"
        voice_note_duration_ <- o A..:? "voice_note_duration"
        voice_note_url_ <- o A..:? "voice_note_url"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ InputInlineQueryResultVoiceNote {input_message_content = input_message_content_, reply_markup = reply_markup_, voice_note_duration = voice_note_duration_, voice_note_url = voice_note_url_, title = title_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON InputInlineQueryResult where
  toJSON
    InputInlineQueryResultAnimation
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        video_height = video_height_,
        video_width = video_width_,
        video_duration = video_duration_,
        video_mime_type = video_mime_type_,
        video_url = video_url_,
        thumbnail_mime_type = thumbnail_mime_type_,
        thumbnail_url = thumbnail_url_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultAnimation",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "video_height" A..= video_height_,
          "video_width" A..= video_width_,
          "video_duration" A..= video_duration_,
          "video_mime_type" A..= video_mime_type_,
          "video_url" A..= video_url_,
          "thumbnail_mime_type" A..= thumbnail_mime_type_,
          "thumbnail_url" A..= thumbnail_url_,
          "title" A..= title_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultArticle
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        description = description_,
        title = title_,
        hide_url = hide_url_,
        url = url_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultArticle",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "thumbnail_height" A..= thumbnail_height_,
          "thumbnail_width" A..= thumbnail_width_,
          "thumbnail_url" A..= thumbnail_url_,
          "description" A..= description_,
          "title" A..= title_,
          "hide_url" A..= hide_url_,
          "url" A..= url_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultAudio
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        audio_duration = audio_duration_,
        audio_url = audio_url_,
        performer = performer_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultAudio",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "audio_duration" A..= audio_duration_,
          "audio_url" A..= audio_url_,
          "performer" A..= performer_,
          "title" A..= title_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultContact
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        contact = contact_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultContact",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "thumbnail_height" A..= thumbnail_height_,
          "thumbnail_width" A..= thumbnail_width_,
          "thumbnail_url" A..= thumbnail_url_,
          "contact" A..= contact_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultDocument
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        mime_type = mime_type_,
        document_url = document_url_,
        description = description_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultDocument",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "thumbnail_height" A..= thumbnail_height_,
          "thumbnail_width" A..= thumbnail_width_,
          "thumbnail_url" A..= thumbnail_url_,
          "mime_type" A..= mime_type_,
          "document_url" A..= document_url_,
          "description" A..= description_,
          "title" A..= title_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultGame
      { reply_markup = reply_markup_,
        game_short_name = game_short_name_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultGame",
          "reply_markup" A..= reply_markup_,
          "game_short_name" A..= game_short_name_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultLocation
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        title = title_,
        live_period = live_period_,
        location = location_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultLocation",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "thumbnail_height" A..= thumbnail_height_,
          "thumbnail_width" A..= thumbnail_width_,
          "thumbnail_url" A..= thumbnail_url_,
          "title" A..= title_,
          "live_period" A..= live_period_,
          "location" A..= location_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultPhoto
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        photo_height = photo_height_,
        photo_width = photo_width_,
        photo_url = photo_url_,
        thumbnail_url = thumbnail_url_,
        description = description_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultPhoto",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "photo_height" A..= photo_height_,
          "photo_width" A..= photo_width_,
          "photo_url" A..= photo_url_,
          "thumbnail_url" A..= thumbnail_url_,
          "description" A..= description_,
          "title" A..= title_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultSticker
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        sticker_height = sticker_height_,
        sticker_width = sticker_width_,
        sticker_url = sticker_url_,
        thumbnail_url = thumbnail_url_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultSticker",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "sticker_height" A..= sticker_height_,
          "sticker_width" A..= sticker_width_,
          "sticker_url" A..= sticker_url_,
          "thumbnail_url" A..= thumbnail_url_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultVenue
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        thumbnail_height = thumbnail_height_,
        thumbnail_width = thumbnail_width_,
        thumbnail_url = thumbnail_url_,
        venue = venue_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultVenue",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "thumbnail_height" A..= thumbnail_height_,
          "thumbnail_width" A..= thumbnail_width_,
          "thumbnail_url" A..= thumbnail_url_,
          "venue" A..= venue_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultVideo
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        video_duration = video_duration_,
        video_height = video_height_,
        video_width = video_width_,
        mime_type = mime_type_,
        video_url = video_url_,
        thumbnail_url = thumbnail_url_,
        description = description_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultVideo",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "video_duration" A..= video_duration_,
          "video_height" A..= video_height_,
          "video_width" A..= video_width_,
          "mime_type" A..= mime_type_,
          "video_url" A..= video_url_,
          "thumbnail_url" A..= thumbnail_url_,
          "description" A..= description_,
          "title" A..= title_,
          "id" A..= _id_
        ]
  toJSON
    InputInlineQueryResultVoiceNote
      { input_message_content = input_message_content_,
        reply_markup = reply_markup_,
        voice_note_duration = voice_note_duration_,
        voice_note_url = voice_note_url_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inputInlineQueryResultVoiceNote",
          "input_message_content" A..= input_message_content_,
          "reply_markup" A..= reply_markup_,
          "voice_note_duration" A..= voice_note_duration_,
          "voice_note_url" A..= voice_note_url_,
          "title" A..= title_,
          "id" A..= _id_
        ]
