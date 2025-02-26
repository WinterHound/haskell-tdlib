{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified Utils as U

-- |
data ChatInviteLinks = -- | Contains a list of chat invite links @total_count Approximate total number of chat invite links found @invite_links List of invite links
  ChatInviteLinks
  { -- |
    invite_links :: Maybe [ChatInviteLink.ChatInviteLink],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinks where
  show
    ChatInviteLinks
      { invite_links = invite_links_,
        total_count = total_count_
      } =
      "ChatInviteLinks"
        ++ U.cc
          [ U.p "invite_links" invite_links_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON ChatInviteLinks where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinks" -> parseChatInviteLinks v
      _ -> mempty
    where
      parseChatInviteLinks :: A.Value -> T.Parser ChatInviteLinks
      parseChatInviteLinks = A.withObject "ChatInviteLinks" $ \o -> do
        invite_links_ <- o A..:? "invite_links"
        total_count_ <- o A..:? "total_count"
        return $ ChatInviteLinks {invite_links = invite_links_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinks where
  toJSON
    ChatInviteLinks
      { invite_links = invite_links_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinks",
          "invite_links" A..= invite_links_,
          "total_count" A..= total_count_
        ]
