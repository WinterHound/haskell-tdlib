-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ReplyMarkup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.KeyboardButton as KeyboardButton
import {-# SOURCE #-} qualified API.InlineKeyboardButton as InlineKeyboardButton

--main = putStrLn "ok"

data ReplyMarkup = 
 ReplyMarkupRemoveKeyboard { is_personal :: Bool }  
 | ReplyMarkupForceReply { is_personal :: Bool }  
 | ReplyMarkupShowKeyboard { is_personal :: Bool, one_time :: Bool, resize_keyboard :: Bool, _rows :: [KeyboardButton.KeyboardButton] }  
 | ReplyMarkupInlineKeyboard { rows :: [InlineKeyboardButton.InlineKeyboardButton] }  -- deriving (Show)

instance T.ToJSON ReplyMarkup where
 toJSON (ReplyMarkupRemoveKeyboard { is_personal = is_personal }) =
  A.object [ "@type" A..= T.String "replyMarkupRemoveKeyboard", "is_personal" A..= is_personal ]

 toJSON (ReplyMarkupForceReply { is_personal = is_personal }) =
  A.object [ "@type" A..= T.String "replyMarkupForceReply", "is_personal" A..= is_personal ]

 toJSON (ReplyMarkupShowKeyboard { is_personal = is_personal, one_time = one_time, resize_keyboard = resize_keyboard, _rows = _rows }) =
  A.object [ "@type" A..= T.String "replyMarkupShowKeyboard", "is_personal" A..= is_personal, "one_time" A..= one_time, "resize_keyboard" A..= resize_keyboard, "rows" A..= _rows ]

 toJSON (ReplyMarkupInlineKeyboard { rows = rows }) =
  A.object [ "@type" A..= T.String "replyMarkupInlineKeyboard", "rows" A..= rows ]
-- replyMarkupRemoveKeyboard ReplyMarkup  { is_personal :: Bool } 

-- replyMarkupForceReply ReplyMarkup  { is_personal :: Bool } 

-- replyMarkupShowKeyboard ReplyMarkup  { is_personal :: Bool, one_time :: Bool, resize_keyboard :: Bool, _rows :: [KeyboardButton.KeyboardButton] } 

-- replyMarkupInlineKeyboard ReplyMarkup  { rows :: [InlineKeyboardButton.InlineKeyboardButton] } 

