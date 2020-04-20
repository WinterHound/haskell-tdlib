-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteMessages = 
 DeleteMessages { revoke :: Bool, message_ids :: [Int], chat_id :: Int }  -- deriving (Show)

instance T.ToJSON DeleteMessages where
 toJSON (DeleteMessages { revoke = revoke, message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteMessages", "revoke" A..= revoke, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]
-- deleteMessages DeleteMessages  { revoke :: Bool, message_ids :: [Int], chat_id :: Int } 

