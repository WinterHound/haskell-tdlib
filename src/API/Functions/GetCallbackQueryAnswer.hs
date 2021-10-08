-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCallbackQueryAnswer where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.CallbackQueryPayload as CallbackQueryPayload

-- |
-- 
-- Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires 
-- 
-- __chat_id__ Identifier of the chat with the message
-- 
-- __message_id__ Identifier of the message from which the query originated
-- 
-- __payload__ Query payload
data GetCallbackQueryAnswer = 

 GetCallbackQueryAnswer { payload :: Maybe CallbackQueryPayload.CallbackQueryPayload, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetCallbackQueryAnswer where
 show GetCallbackQueryAnswer { payload=payload, message_id=message_id, chat_id=chat_id } =
  "GetCallbackQueryAnswer" ++ cc [p "payload" payload, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetCallbackQueryAnswer where
 toJSON GetCallbackQueryAnswer { payload = payload, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getCallbackQueryAnswer", "payload" A..= payload, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetCallbackQueryAnswer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCallbackQueryAnswer" -> parseGetCallbackQueryAnswer v
   _ -> mempty
  where
   parseGetCallbackQueryAnswer :: A.Value -> T.Parser GetCallbackQueryAnswer
   parseGetCallbackQueryAnswer = A.withObject "GetCallbackQueryAnswer" $ \o -> do
    payload <- o A..:? "payload"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetCallbackQueryAnswer { payload = payload, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
