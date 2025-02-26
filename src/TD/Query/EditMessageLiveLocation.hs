{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditMessageLiveLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side
data EditMessageLiveLocation = EditMessageLiveLocation
  { -- | The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
    proximity_alert_radius :: Maybe Int,
    -- | The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    heading :: Maybe Int,
    -- | New location content of the message; pass null to stop sharing the live location
    location :: Maybe Location.Location,
    -- | The new message reply markup; pass null if none; for bots only
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | The chat the message belongs to
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditMessageLiveLocation where
  show
    EditMessageLiveLocation
      { proximity_alert_radius = proximity_alert_radius_,
        heading = heading_,
        location = location_,
        reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "EditMessageLiveLocation"
        ++ U.cc
          [ U.p "proximity_alert_radius" proximity_alert_radius_,
            U.p "heading" heading_,
            U.p "location" location_,
            U.p "reply_markup" reply_markup_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON EditMessageLiveLocation where
  toJSON
    EditMessageLiveLocation
      { proximity_alert_radius = proximity_alert_radius_,
        heading = heading_,
        location = location_,
        reply_markup = reply_markup_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "editMessageLiveLocation",
          "proximity_alert_radius" A..= proximity_alert_radius_,
          "heading" A..= heading_,
          "location" A..= location_,
          "reply_markup" A..= reply_markup_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
