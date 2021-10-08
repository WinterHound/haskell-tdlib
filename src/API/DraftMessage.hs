-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DraftMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent

-- |
-- 
-- Contains information about a message draft
-- 
-- __reply_to_message_id__ Identifier of the message to reply to; 0 if none
-- 
-- __date__ Point in time (Unix timestamp) when the draft was created
-- 
-- __input_message_text__ Content of the message draft; must be of the type inputMessageText
data DraftMessage = 

 DraftMessage { input_message_text :: Maybe InputMessageContent.InputMessageContent, date :: Maybe Int, reply_to_message_id :: Maybe Int }  deriving (Eq)

instance Show DraftMessage where
 show DraftMessage { input_message_text=input_message_text, date=date, reply_to_message_id=reply_to_message_id } =
  "DraftMessage" ++ cc [p "input_message_text" input_message_text, p "date" date, p "reply_to_message_id" reply_to_message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DraftMessage where
 toJSON DraftMessage { input_message_text = input_message_text, date = date, reply_to_message_id = reply_to_message_id } =
  A.object [ "@type" A..= T.String "draftMessage", "input_message_text" A..= input_message_text, "date" A..= date, "reply_to_message_id" A..= reply_to_message_id ]

instance T.FromJSON DraftMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "draftMessage" -> parseDraftMessage v
   _ -> mempty
  where
   parseDraftMessage :: A.Value -> T.Parser DraftMessage
   parseDraftMessage = A.withObject "DraftMessage" $ \o -> do
    input_message_text <- o A..:? "input_message_text"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DraftMessage { input_message_text = input_message_text, date = date, reply_to_message_id = reply_to_message_id }
 parseJSON _ = mempty
