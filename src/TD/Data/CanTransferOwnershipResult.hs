{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CanTransferOwnershipResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents result of checking whether the current session can be used to transfer a chat ownership to another user
data CanTransferOwnershipResult
  = -- | The session can be used
    CanTransferOwnershipResultOk
  | -- | The 2-step verification needs to be enabled first
    CanTransferOwnershipResultPasswordNeeded
  | -- | The 2-step verification was enabled recently, user needs to wait @retry_after Time left before the session can be used to transfer ownership of a chat, in seconds
    CanTransferOwnershipResultPasswordTooFresh
      { -- |
        retry_after :: Maybe Int
      }
  | -- | The session was created recently, user needs to wait @retry_after Time left before the session can be used to transfer ownership of a chat, in seconds
    CanTransferOwnershipResultSessionTooFresh
      { -- |
        retry_after :: Maybe Int
      }
  deriving (Eq)

instance Show CanTransferOwnershipResult where
  show CanTransferOwnershipResultOk =
    "CanTransferOwnershipResultOk"
      ++ U.cc
        []
  show CanTransferOwnershipResultPasswordNeeded =
    "CanTransferOwnershipResultPasswordNeeded"
      ++ U.cc
        []
  show
    CanTransferOwnershipResultPasswordTooFresh
      { retry_after = retry_after_
      } =
      "CanTransferOwnershipResultPasswordTooFresh"
        ++ U.cc
          [ U.p "retry_after" retry_after_
          ]
  show
    CanTransferOwnershipResultSessionTooFresh
      { retry_after = retry_after_
      } =
      "CanTransferOwnershipResultSessionTooFresh"
        ++ U.cc
          [ U.p "retry_after" retry_after_
          ]

instance T.FromJSON CanTransferOwnershipResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "canTransferOwnershipResultOk" -> parseCanTransferOwnershipResultOk v
      "canTransferOwnershipResultPasswordNeeded" -> parseCanTransferOwnershipResultPasswordNeeded v
      "canTransferOwnershipResultPasswordTooFresh" -> parseCanTransferOwnershipResultPasswordTooFresh v
      "canTransferOwnershipResultSessionTooFresh" -> parseCanTransferOwnershipResultSessionTooFresh v
      _ -> mempty
    where
      parseCanTransferOwnershipResultOk :: A.Value -> T.Parser CanTransferOwnershipResult
      parseCanTransferOwnershipResultOk = A.withObject "CanTransferOwnershipResultOk" $ \_ -> return CanTransferOwnershipResultOk

      parseCanTransferOwnershipResultPasswordNeeded :: A.Value -> T.Parser CanTransferOwnershipResult
      parseCanTransferOwnershipResultPasswordNeeded = A.withObject "CanTransferOwnershipResultPasswordNeeded" $ \_ -> return CanTransferOwnershipResultPasswordNeeded

      parseCanTransferOwnershipResultPasswordTooFresh :: A.Value -> T.Parser CanTransferOwnershipResult
      parseCanTransferOwnershipResultPasswordTooFresh = A.withObject "CanTransferOwnershipResultPasswordTooFresh" $ \o -> do
        retry_after_ <- o A..:? "retry_after"
        return $ CanTransferOwnershipResultPasswordTooFresh {retry_after = retry_after_}

      parseCanTransferOwnershipResultSessionTooFresh :: A.Value -> T.Parser CanTransferOwnershipResult
      parseCanTransferOwnershipResultSessionTooFresh = A.withObject "CanTransferOwnershipResultSessionTooFresh" $ \o -> do
        retry_after_ <- o A..:? "retry_after"
        return $ CanTransferOwnershipResultSessionTooFresh {retry_after = retry_after_}
  parseJSON _ = mempty

instance T.ToJSON CanTransferOwnershipResult where
  toJSON CanTransferOwnershipResultOk =
    A.object
      [ "@type" A..= T.String "canTransferOwnershipResultOk"
      ]
  toJSON CanTransferOwnershipResultPasswordNeeded =
    A.object
      [ "@type" A..= T.String "canTransferOwnershipResultPasswordNeeded"
      ]
  toJSON
    CanTransferOwnershipResultPasswordTooFresh
      { retry_after = retry_after_
      } =
      A.object
        [ "@type" A..= T.String "canTransferOwnershipResultPasswordTooFresh",
          "retry_after" A..= retry_after_
        ]
  toJSON
    CanTransferOwnershipResultSessionTooFresh
      { retry_after = retry_after_
      } =
      A.object
        [ "@type" A..= T.String "canTransferOwnershipResultSessionTooFresh",
          "retry_after" A..= retry_after_
        ]
