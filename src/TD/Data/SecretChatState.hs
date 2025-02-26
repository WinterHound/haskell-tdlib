{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SecretChatState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the current secret chat state
data SecretChatState
  = -- | The secret chat is not yet created; waiting for the other user to get online
    SecretChatStatePending
  | -- | The secret chat is ready to use
    SecretChatStateReady
  | -- | The secret chat is closed
    SecretChatStateClosed
  deriving (Eq)

instance Show SecretChatState where
  show SecretChatStatePending =
    "SecretChatStatePending"
      ++ U.cc
        []
  show SecretChatStateReady =
    "SecretChatStateReady"
      ++ U.cc
        []
  show SecretChatStateClosed =
    "SecretChatStateClosed"
      ++ U.cc
        []

instance T.FromJSON SecretChatState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "secretChatStatePending" -> parseSecretChatStatePending v
      "secretChatStateReady" -> parseSecretChatStateReady v
      "secretChatStateClosed" -> parseSecretChatStateClosed v
      _ -> mempty
    where
      parseSecretChatStatePending :: A.Value -> T.Parser SecretChatState
      parseSecretChatStatePending = A.withObject "SecretChatStatePending" $ \_ -> return SecretChatStatePending

      parseSecretChatStateReady :: A.Value -> T.Parser SecretChatState
      parseSecretChatStateReady = A.withObject "SecretChatStateReady" $ \_ -> return SecretChatStateReady

      parseSecretChatStateClosed :: A.Value -> T.Parser SecretChatState
      parseSecretChatStateClosed = A.withObject "SecretChatStateClosed" $ \_ -> return SecretChatStateClosed
  parseJSON _ = mempty

instance T.ToJSON SecretChatState where
  toJSON SecretChatStatePending =
    A.object
      [ "@type" A..= T.String "secretChatStatePending"
      ]
  toJSON SecretChatStateReady =
    A.object
      [ "@type" A..= T.String "secretChatStateReady"
      ]
  toJSON SecretChatStateClosed =
    A.object
      [ "@type" A..= T.String "secretChatStateClosed"
      ]
