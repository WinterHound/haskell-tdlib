{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.UploadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FileType as FileType
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Asynchronously uploads a file to the cloud without sending it in a message. updateFile will be used to notify about upload progress and successful completion of the upload. The file will not have a persistent remote identifier until it will be sent in a message
data UploadFile = UploadFile
  { -- | Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which uploadFile was called will be uploaded first
    priority :: Maybe Int,
    -- | File type; pass null if unknown
    file_type :: Maybe FileType.FileType,
    -- | File to upload
    file :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show UploadFile where
  show
    UploadFile
      { priority = priority_,
        file_type = file_type_,
        file = file_
      } =
      "UploadFile"
        ++ U.cc
          [ U.p "priority" priority_,
            U.p "file_type" file_type_,
            U.p "file" file_
          ]

instance T.ToJSON UploadFile where
  toJSON
    UploadFile
      { priority = priority_,
        file_type = file_type_,
        file = file_
      } =
      A.object
        [ "@type" A..= T.String "uploadFile",
          "priority" A..= priority_,
          "file_type" A..= file_type_,
          "file" A..= file_
        ]
