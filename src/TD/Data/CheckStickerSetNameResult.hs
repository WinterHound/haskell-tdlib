{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CheckStickerSetNameResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents result of checking whether a name can be used for a new sticker set
data CheckStickerSetNameResult
  = -- | The name can be set
    CheckStickerSetNameResultOk
  | -- | The name is invalid
    CheckStickerSetNameResultNameInvalid
  | -- | The name is occupied
    CheckStickerSetNameResultNameOccupied
  deriving (Eq)

instance Show CheckStickerSetNameResult where
  show CheckStickerSetNameResultOk =
    "CheckStickerSetNameResultOk"
      ++ U.cc
        []
  show CheckStickerSetNameResultNameInvalid =
    "CheckStickerSetNameResultNameInvalid"
      ++ U.cc
        []
  show CheckStickerSetNameResultNameOccupied =
    "CheckStickerSetNameResultNameOccupied"
      ++ U.cc
        []

instance T.FromJSON CheckStickerSetNameResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "checkStickerSetNameResultOk" -> parseCheckStickerSetNameResultOk v
      "checkStickerSetNameResultNameInvalid" -> parseCheckStickerSetNameResultNameInvalid v
      "checkStickerSetNameResultNameOccupied" -> parseCheckStickerSetNameResultNameOccupied v
      _ -> mempty
    where
      parseCheckStickerSetNameResultOk :: A.Value -> T.Parser CheckStickerSetNameResult
      parseCheckStickerSetNameResultOk = A.withObject "CheckStickerSetNameResultOk" $ \_ -> return CheckStickerSetNameResultOk

      parseCheckStickerSetNameResultNameInvalid :: A.Value -> T.Parser CheckStickerSetNameResult
      parseCheckStickerSetNameResultNameInvalid = A.withObject "CheckStickerSetNameResultNameInvalid" $ \_ -> return CheckStickerSetNameResultNameInvalid

      parseCheckStickerSetNameResultNameOccupied :: A.Value -> T.Parser CheckStickerSetNameResult
      parseCheckStickerSetNameResultNameOccupied = A.withObject "CheckStickerSetNameResultNameOccupied" $ \_ -> return CheckStickerSetNameResultNameOccupied
  parseJSON _ = mempty

instance T.ToJSON CheckStickerSetNameResult where
  toJSON CheckStickerSetNameResultOk =
    A.object
      [ "@type" A..= T.String "checkStickerSetNameResultOk"
      ]
  toJSON CheckStickerSetNameResultNameInvalid =
    A.object
      [ "@type" A..= T.String "checkStickerSetNameResultNameInvalid"
      ]
  toJSON CheckStickerSetNameResultNameOccupied =
    A.object
      [ "@type" A..= T.String "checkStickerSetNameResultNameOccupied"
      ]
