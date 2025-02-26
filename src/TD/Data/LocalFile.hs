{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LocalFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data LocalFile = -- | Represents a local file
  LocalFile
  { -- | Total downloaded file size, in bytes. Can be used only for calculating download progress. The actual file size may be bigger, and some parts of it may contain garbage
    downloaded_size :: Maybe Int,
    -- | If is_downloading_completed is false, then only some prefix of the file starting from download_offset is ready to be read. downloaded_prefix_size is the size of that prefix in bytes
    downloaded_prefix_size :: Maybe Int,
    -- | Download will be started from this offset. downloaded_prefix_size is calculated from this offset
    download_offset :: Maybe Int,
    -- | True, if the local copy is fully available
    is_downloading_completed :: Maybe Bool,
    -- | True, if the file is currently being downloaded (or a local copy is being generated by some other means)
    is_downloading_active :: Maybe Bool,
    -- | True, if the file can be deleted
    can_be_deleted :: Maybe Bool,
    -- | True, if it is possible to download or generate the file
    can_be_downloaded :: Maybe Bool,
    -- | Local path to the locally available file part; may be empty
    path :: Maybe String
  }
  deriving (Eq)

instance Show LocalFile where
  show
    LocalFile
      { downloaded_size = downloaded_size_,
        downloaded_prefix_size = downloaded_prefix_size_,
        download_offset = download_offset_,
        is_downloading_completed = is_downloading_completed_,
        is_downloading_active = is_downloading_active_,
        can_be_deleted = can_be_deleted_,
        can_be_downloaded = can_be_downloaded_,
        path = path_
      } =
      "LocalFile"
        ++ U.cc
          [ U.p "downloaded_size" downloaded_size_,
            U.p "downloaded_prefix_size" downloaded_prefix_size_,
            U.p "download_offset" download_offset_,
            U.p "is_downloading_completed" is_downloading_completed_,
            U.p "is_downloading_active" is_downloading_active_,
            U.p "can_be_deleted" can_be_deleted_,
            U.p "can_be_downloaded" can_be_downloaded_,
            U.p "path" path_
          ]

instance T.FromJSON LocalFile where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "localFile" -> parseLocalFile v
      _ -> mempty
    where
      parseLocalFile :: A.Value -> T.Parser LocalFile
      parseLocalFile = A.withObject "LocalFile" $ \o -> do
        downloaded_size_ <- o A..:? "downloaded_size"
        downloaded_prefix_size_ <- o A..:? "downloaded_prefix_size"
        download_offset_ <- o A..:? "download_offset"
        is_downloading_completed_ <- o A..:? "is_downloading_completed"
        is_downloading_active_ <- o A..:? "is_downloading_active"
        can_be_deleted_ <- o A..:? "can_be_deleted"
        can_be_downloaded_ <- o A..:? "can_be_downloaded"
        path_ <- o A..:? "path"
        return $ LocalFile {downloaded_size = downloaded_size_, downloaded_prefix_size = downloaded_prefix_size_, download_offset = download_offset_, is_downloading_completed = is_downloading_completed_, is_downloading_active = is_downloading_active_, can_be_deleted = can_be_deleted_, can_be_downloaded = can_be_downloaded_, path = path_}
  parseJSON _ = mempty

instance T.ToJSON LocalFile where
  toJSON
    LocalFile
      { downloaded_size = downloaded_size_,
        downloaded_prefix_size = downloaded_prefix_size_,
        download_offset = download_offset_,
        is_downloading_completed = is_downloading_completed_,
        is_downloading_active = is_downloading_active_,
        can_be_deleted = can_be_deleted_,
        can_be_downloaded = can_be_downloaded_,
        path = path_
      } =
      A.object
        [ "@type" A..= T.String "localFile",
          "downloaded_size" A..= downloaded_size_,
          "downloaded_prefix_size" A..= downloaded_prefix_size_,
          "download_offset" A..= download_offset_,
          "is_downloading_completed" A..= is_downloading_completed_,
          "is_downloading_active" A..= is_downloading_active_,
          "can_be_deleted" A..= can_be_deleted_,
          "can_be_downloaded" A..= can_be_downloaded_,
          "path" A..= path_
        ]
