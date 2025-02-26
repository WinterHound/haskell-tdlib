{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.OpenWebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Informs TDLib that a Web App is being opened from attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button.
-- For each bot, a confirmation alert about data sent to the bot must be shown once
data OpenWebApp = OpenWebApp
  { -- | Identifier of the replied message for the message sent by the Web App; 0 if none
    reply_to_message_id :: Maybe Int,
    -- | Preferred Web App theme; pass null to use the default theme
    theme :: Maybe ThemeParameters.ThemeParameters,
    -- | The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, or an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
    url :: Maybe String,
    -- | Identifier of the bot, providing the Web App
    bot_user_id :: Maybe Int,
    -- | Identifier of the chat in which the Web App is opened
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show OpenWebApp where
  show
    OpenWebApp
      { reply_to_message_id = reply_to_message_id_,
        theme = theme_,
        url = url_,
        bot_user_id = bot_user_id_,
        chat_id = chat_id_
      } =
      "OpenWebApp"
        ++ U.cc
          [ U.p "reply_to_message_id" reply_to_message_id_,
            U.p "theme" theme_,
            U.p "url" url_,
            U.p "bot_user_id" bot_user_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON OpenWebApp where
  toJSON
    OpenWebApp
      { reply_to_message_id = reply_to_message_id_,
        theme = theme_,
        url = url_,
        bot_user_id = bot_user_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "openWebApp",
          "reply_to_message_id" A..= reply_to_message_id_,
          "theme" A..= theme_,
          "url" A..= url_,
          "bot_user_id" A..= bot_user_id_,
          "chat_id" A..= chat_id_
        ]
