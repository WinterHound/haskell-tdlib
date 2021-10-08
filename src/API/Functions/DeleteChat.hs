-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes a chat along with all messages in the corresponding chat for all chat members; requires owner privileges. For group chats this will release the username and remove all members. Chats with more than 1000 members can't be deleted using this method 
-- 
-- __chat_id__ Chat identifier
data DeleteChat = 

 DeleteChat { chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteChat where
 show DeleteChat { chat_id=chat_id } =
  "DeleteChat" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteChat where
 toJSON DeleteChat { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteChat", "chat_id" A..= chat_id ]

instance T.FromJSON DeleteChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChat" -> parseDeleteChat v
   _ -> mempty
  where
   parseDeleteChat :: A.Value -> T.Parser DeleteChat
   parseDeleteChat = A.withObject "DeleteChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteChat { chat_id = chat_id }
 parseJSON _ = mempty
