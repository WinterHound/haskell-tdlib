-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendInlineQueryResultMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

--main = putStrLn "ok"

data SendInlineQueryResultMessage = 
 SendInlineQueryResultMessage { hide_via_bot :: Bool, result_id :: String, query_id :: Int, options :: SendMessageOptions.SendMessageOptions, reply_to_message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendInlineQueryResultMessage where
 toJSON (SendInlineQueryResultMessage { hide_via_bot = hide_via_bot, result_id = result_id, query_id = query_id, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendInlineQueryResultMessage", "hide_via_bot" A..= hide_via_bot, "result_id" A..= result_id, "query_id" A..= query_id, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "chat_id" A..= chat_id ]
-- sendInlineQueryResultMessage SendInlineQueryResultMessage  { hide_via_bot :: Bool, result_id :: String, query_id :: Int, options :: SendMessageOptions.SendMessageOptions, reply_to_message_id :: Int, chat_id :: Int } 

