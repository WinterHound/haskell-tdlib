-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendMessageAlbum where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

--main = putStrLn "ok"

data SendMessageAlbum = 
 SendMessageAlbum { input_message_contents :: [InputMessageContent.InputMessageContent], options :: SendMessageOptions.SendMessageOptions, reply_to_message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendMessageAlbum where
 toJSON (SendMessageAlbum { input_message_contents = input_message_contents, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendMessageAlbum", "input_message_contents" A..= input_message_contents, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "chat_id" A..= chat_id ]
-- sendMessageAlbum SendMessageAlbum  { input_message_contents :: [InputMessageContent.InputMessageContent], options :: SendMessageOptions.SendMessageOptions, reply_to_message_id :: Int, chat_id :: Int } 

