-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPinnedChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Changes the order of pinned chats 
-- 
-- __chat_list__ Chat list in which to change the order of pinned chats
-- 
-- __chat_ids__ The new list of pinned chats
data SetPinnedChats = 

 SetPinnedChats { chat_ids :: Maybe [Int], chat_list :: Maybe ChatList.ChatList }  deriving (Eq)

instance Show SetPinnedChats where
 show SetPinnedChats { chat_ids=chat_ids, chat_list=chat_list } =
  "SetPinnedChats" ++ cc [p "chat_ids" chat_ids, p "chat_list" chat_list ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetPinnedChats where
 toJSON SetPinnedChats { chat_ids = chat_ids, chat_list = chat_list } =
  A.object [ "@type" A..= T.String "setPinnedChats", "chat_ids" A..= chat_ids, "chat_list" A..= chat_list ]

instance T.FromJSON SetPinnedChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPinnedChats" -> parseSetPinnedChats v
   _ -> mempty
  where
   parseSetPinnedChats :: A.Value -> T.Parser SetPinnedChats
   parseSetPinnedChats = A.withObject "SetPinnedChats" $ \o -> do
    chat_ids <- o A..:? "chat_ids"
    chat_list <- o A..:? "chat_list"
    return $ SetPinnedChats { chat_ids = chat_ids, chat_list = chat_list }
 parseJSON _ = mempty
