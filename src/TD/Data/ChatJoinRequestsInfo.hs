{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatJoinRequestsInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatJoinRequestsInfo = -- | Contains information about pending join requests for a chat @total_count Total number of pending join requests @user_ids Identifiers of at most 3 users sent the newest pending join requests
  ChatJoinRequestsInfo
  { -- |
    user_ids :: Maybe [Int],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatJoinRequestsInfo where
  show
    ChatJoinRequestsInfo
      { user_ids = user_ids_,
        total_count = total_count_
      } =
      "ChatJoinRequestsInfo"
        ++ U.cc
          [ U.p "user_ids" user_ids_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON ChatJoinRequestsInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatJoinRequestsInfo" -> parseChatJoinRequestsInfo v
      _ -> mempty
    where
      parseChatJoinRequestsInfo :: A.Value -> T.Parser ChatJoinRequestsInfo
      parseChatJoinRequestsInfo = A.withObject "ChatJoinRequestsInfo" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        total_count_ <- o A..:? "total_count"
        return $ ChatJoinRequestsInfo {user_ids = user_ids_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatJoinRequestsInfo where
  toJSON
    ChatJoinRequestsInfo
      { user_ids = user_ids_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "chatJoinRequestsInfo",
          "user_ids" A..= user_ids_,
          "total_count" A..= total_count_
        ]
