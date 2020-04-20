-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DiscardCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DiscardCall = 
 DiscardCall { connection_id :: Int, duration :: Int, is_disconnected :: Bool, call_id :: Int }  -- deriving (Show)

instance T.ToJSON DiscardCall where
 toJSON (DiscardCall { connection_id = connection_id, duration = duration, is_disconnected = is_disconnected, call_id = call_id }) =
  A.object [ "@type" A..= T.String "discardCall", "connection_id" A..= connection_id, "duration" A..= duration, "is_disconnected" A..= is_disconnected, "call_id" A..= call_id ]
-- discardCall DiscardCall  { connection_id :: Int, duration :: Int, is_disconnected :: Bool, call_id :: Int } 

