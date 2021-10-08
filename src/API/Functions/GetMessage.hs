-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a message 
-- 
-- __chat_id__ Identifier of the chat the message belongs to
-- 
-- __message_id__ Identifier of the message to get
data GetMessage = 

 GetMessage { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessage where
 show GetMessage { message_id=message_id, chat_id=chat_id } =
  "GetMessage" ++ cc [p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessage where
 toJSON GetMessage { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessage" -> parseGetMessage v
   _ -> mempty
  where
   parseGetMessage :: A.Value -> T.Parser GetMessage
   parseGetMessage = A.withObject "GetMessage" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessage { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
