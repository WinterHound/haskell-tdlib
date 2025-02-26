{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatsNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatNearby as ChatNearby
import qualified Utils as U

-- |
data ChatsNearby = -- | Represents a list of chats located nearby @users_nearby List of users nearby @supergroups_nearby List of location-based supergroups nearby
  ChatsNearby
  { -- |
    supergroups_nearby :: Maybe [ChatNearby.ChatNearby],
    -- |
    users_nearby :: Maybe [ChatNearby.ChatNearby]
  }
  deriving (Eq)

instance Show ChatsNearby where
  show
    ChatsNearby
      { supergroups_nearby = supergroups_nearby_,
        users_nearby = users_nearby_
      } =
      "ChatsNearby"
        ++ U.cc
          [ U.p "supergroups_nearby" supergroups_nearby_,
            U.p "users_nearby" users_nearby_
          ]

instance T.FromJSON ChatsNearby where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatsNearby" -> parseChatsNearby v
      _ -> mempty
    where
      parseChatsNearby :: A.Value -> T.Parser ChatsNearby
      parseChatsNearby = A.withObject "ChatsNearby" $ \o -> do
        supergroups_nearby_ <- o A..:? "supergroups_nearby"
        users_nearby_ <- o A..:? "users_nearby"
        return $ ChatsNearby {supergroups_nearby = supergroups_nearby_, users_nearby = users_nearby_}
  parseJSON _ = mempty

instance T.ToJSON ChatsNearby where
  toJSON
    ChatsNearby
      { supergroups_nearby = supergroups_nearby_,
        users_nearby = users_nearby_
      } =
      A.object
        [ "@type" A..= T.String "chatsNearby",
          "supergroups_nearby" A..= supergroups_nearby_,
          "users_nearby" A..= users_nearby_
        ]
