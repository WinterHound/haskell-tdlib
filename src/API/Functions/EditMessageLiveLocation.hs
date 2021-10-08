-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageLiveLocation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side
-- 
-- __chat_id__ The chat the message belongs to
-- 
-- __message_id__ Identifier of the message
-- 
-- __reply_markup__ The new message reply markup; pass null if none; for bots only
-- 
-- __location__ New location content of the message; pass null to stop sharing the live location
-- 
-- __heading__ The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
-- 
-- __proximity_alert_radius__ The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
data EditMessageLiveLocation = 

 EditMessageLiveLocation { proximity_alert_radius :: Maybe Int, heading :: Maybe Int, location :: Maybe Location.Location, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show EditMessageLiveLocation where
 show EditMessageLiveLocation { proximity_alert_radius=proximity_alert_radius, heading=heading, location=location, reply_markup=reply_markup, message_id=message_id, chat_id=chat_id } =
  "EditMessageLiveLocation" ++ cc [p "proximity_alert_radius" proximity_alert_radius, p "heading" heading, p "location" location, p "reply_markup" reply_markup, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EditMessageLiveLocation where
 toJSON EditMessageLiveLocation { proximity_alert_radius = proximity_alert_radius, heading = heading, location = location, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "editMessageLiveLocation", "proximity_alert_radius" A..= proximity_alert_radius, "heading" A..= heading, "location" A..= location, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON EditMessageLiveLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageLiveLocation" -> parseEditMessageLiveLocation v
   _ -> mempty
  where
   parseEditMessageLiveLocation :: A.Value -> T.Parser EditMessageLiveLocation
   parseEditMessageLiveLocation = A.withObject "EditMessageLiveLocation" $ \o -> do
    proximity_alert_radius <- mconcat [ o A..:? "proximity_alert_radius", readMaybe <$> (o A..: "proximity_alert_radius" :: T.Parser String)] :: T.Parser (Maybe Int)
    heading <- mconcat [ o A..:? "heading", readMaybe <$> (o A..: "heading" :: T.Parser String)] :: T.Parser (Maybe Int)
    location <- o A..:? "location"
    reply_markup <- o A..:? "reply_markup"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditMessageLiveLocation { proximity_alert_radius = proximity_alert_radius, heading = heading, location = location, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
