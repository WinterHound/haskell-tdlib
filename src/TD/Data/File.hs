{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.File where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LocalFile as LocalFile
import qualified TD.Data.RemoteFile as RemoteFile
import qualified Utils as U

-- |
data File = -- | Represents a file
  File
  { -- | Information about the remote copy of the file
    remote :: Maybe RemoteFile.RemoteFile,
    -- | Information about the local copy of the file
    local :: Maybe LocalFile.LocalFile,
    -- | Approximate file size in bytes in case the exact file size is unknown. Can be used to show download/upload progress
    expected_size :: Maybe Int,
    -- | File size, in bytes; 0 if unknown
    size :: Maybe Int,
    -- | Unique file identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show File where
  show
    File
      { remote = remote_,
        local = local_,
        expected_size = expected_size_,
        size = size_,
        _id = _id_
      } =
      "File"
        ++ U.cc
          [ U.p "remote" remote_,
            U.p "local" local_,
            U.p "expected_size" expected_size_,
            U.p "size" size_,
            U.p "_id" _id_
          ]

instance T.FromJSON File where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "file" -> parseFile v
      _ -> mempty
    where
      parseFile :: A.Value -> T.Parser File
      parseFile = A.withObject "File" $ \o -> do
        remote_ <- o A..:? "remote"
        local_ <- o A..:? "local"
        expected_size_ <- o A..:? "expected_size"
        size_ <- o A..:? "size"
        _id_ <- o A..:? "id"
        return $ File {remote = remote_, local = local_, expected_size = expected_size_, size = size_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON File where
  toJSON
    File
      { remote = remote_,
        local = local_,
        expected_size = expected_size_,
        size = size_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "file",
          "remote" A..= remote_,
          "local" A..= local_,
          "expected_size" A..= expected_size_,
          "size" A..= size_,
          "id" A..= _id_
        ]
