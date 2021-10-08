-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageMedia where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only
-- 
-- __inline_message_id__ Inline message identifier
-- 
-- __reply_markup__ The new message reply markup; pass null if none; for bots only
-- 
-- __input_message_content__ New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
data EditInlineMessageMedia = 

 EditInlineMessageMedia { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, inline_message_id :: Maybe String }  deriving (Eq)

instance Show EditInlineMessageMedia where
 show EditInlineMessageMedia { input_message_content=input_message_content, reply_markup=reply_markup, inline_message_id=inline_message_id } =
  "EditInlineMessageMedia" ++ cc [p "input_message_content" input_message_content, p "reply_markup" reply_markup, p "inline_message_id" inline_message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EditInlineMessageMedia where
 toJSON EditInlineMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id } =
  A.object [ "@type" A..= T.String "editInlineMessageMedia", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON EditInlineMessageMedia where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageMedia" -> parseEditInlineMessageMedia v
   _ -> mempty
  where
   parseEditInlineMessageMedia :: A.Value -> T.Parser EditInlineMessageMedia
   parseEditInlineMessageMedia = A.withObject "EditInlineMessageMedia" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    inline_message_id <- o A..:? "inline_message_id"
    return $ EditInlineMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }
 parseJSON _ = mempty
