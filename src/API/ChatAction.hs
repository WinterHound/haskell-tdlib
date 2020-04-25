-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatAction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatAction = 
 ChatActionTyping 
 | ChatActionRecordingVideo 
 | ChatActionUploadingVideo { progress :: Maybe Int }  
 | ChatActionRecordingVoiceNote 
 | ChatActionUploadingVoiceNote { progress :: Maybe Int }  
 | ChatActionUploadingPhoto { progress :: Maybe Int }  
 | ChatActionUploadingDocument { progress :: Maybe Int }  
 | ChatActionChoosingLocation 
 | ChatActionChoosingContact 
 | ChatActionStartPlayingGame 
 | ChatActionRecordingVideoNote 
 | ChatActionUploadingVideoNote { progress :: Maybe Int }  
 | ChatActionCancel deriving (Show, Eq)

instance T.ToJSON ChatAction where
 toJSON (ChatActionTyping {  }) =
  A.object [ "@type" A..= T.String "chatActionTyping" ]

 toJSON (ChatActionRecordingVideo {  }) =
  A.object [ "@type" A..= T.String "chatActionRecordingVideo" ]

 toJSON (ChatActionUploadingVideo { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingVideo", "progress" A..= progress ]

 toJSON (ChatActionRecordingVoiceNote {  }) =
  A.object [ "@type" A..= T.String "chatActionRecordingVoiceNote" ]

 toJSON (ChatActionUploadingVoiceNote { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingVoiceNote", "progress" A..= progress ]

 toJSON (ChatActionUploadingPhoto { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingPhoto", "progress" A..= progress ]

 toJSON (ChatActionUploadingDocument { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingDocument", "progress" A..= progress ]

 toJSON (ChatActionChoosingLocation {  }) =
  A.object [ "@type" A..= T.String "chatActionChoosingLocation" ]

 toJSON (ChatActionChoosingContact {  }) =
  A.object [ "@type" A..= T.String "chatActionChoosingContact" ]

 toJSON (ChatActionStartPlayingGame {  }) =
  A.object [ "@type" A..= T.String "chatActionStartPlayingGame" ]

 toJSON (ChatActionRecordingVideoNote {  }) =
  A.object [ "@type" A..= T.String "chatActionRecordingVideoNote" ]

 toJSON (ChatActionUploadingVideoNote { progress = progress }) =
  A.object [ "@type" A..= T.String "chatActionUploadingVideoNote", "progress" A..= progress ]

 toJSON (ChatActionCancel {  }) =
  A.object [ "@type" A..= T.String "chatActionCancel" ]

instance T.FromJSON ChatAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatActionTyping" -> parseChatActionTyping v
   "chatActionRecordingVideo" -> parseChatActionRecordingVideo v
   "chatActionUploadingVideo" -> parseChatActionUploadingVideo v
   "chatActionRecordingVoiceNote" -> parseChatActionRecordingVoiceNote v
   "chatActionUploadingVoiceNote" -> parseChatActionUploadingVoiceNote v
   "chatActionUploadingPhoto" -> parseChatActionUploadingPhoto v
   "chatActionUploadingDocument" -> parseChatActionUploadingDocument v
   "chatActionChoosingLocation" -> parseChatActionChoosingLocation v
   "chatActionChoosingContact" -> parseChatActionChoosingContact v
   "chatActionStartPlayingGame" -> parseChatActionStartPlayingGame v
   "chatActionRecordingVideoNote" -> parseChatActionRecordingVideoNote v
   "chatActionUploadingVideoNote" -> parseChatActionUploadingVideoNote v
   "chatActionCancel" -> parseChatActionCancel v
   _ -> mempty
  where
   parseChatActionTyping :: A.Value -> T.Parser ChatAction
   parseChatActionTyping = A.withObject "ChatActionTyping" $ \o -> do
    return $ ChatActionTyping {  }

   parseChatActionRecordingVideo :: A.Value -> T.Parser ChatAction
   parseChatActionRecordingVideo = A.withObject "ChatActionRecordingVideo" $ \o -> do
    return $ ChatActionRecordingVideo {  }

   parseChatActionUploadingVideo :: A.Value -> T.Parser ChatAction
   parseChatActionUploadingVideo = A.withObject "ChatActionUploadingVideo" $ \o -> do
    progress <- mconcat [ o A..:? "progress", readMaybe <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatActionUploadingVideo { progress = progress }

   parseChatActionRecordingVoiceNote :: A.Value -> T.Parser ChatAction
   parseChatActionRecordingVoiceNote = A.withObject "ChatActionRecordingVoiceNote" $ \o -> do
    return $ ChatActionRecordingVoiceNote {  }

   parseChatActionUploadingVoiceNote :: A.Value -> T.Parser ChatAction
   parseChatActionUploadingVoiceNote = A.withObject "ChatActionUploadingVoiceNote" $ \o -> do
    progress <- mconcat [ o A..:? "progress", readMaybe <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatActionUploadingVoiceNote { progress = progress }

   parseChatActionUploadingPhoto :: A.Value -> T.Parser ChatAction
   parseChatActionUploadingPhoto = A.withObject "ChatActionUploadingPhoto" $ \o -> do
    progress <- mconcat [ o A..:? "progress", readMaybe <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatActionUploadingPhoto { progress = progress }

   parseChatActionUploadingDocument :: A.Value -> T.Parser ChatAction
   parseChatActionUploadingDocument = A.withObject "ChatActionUploadingDocument" $ \o -> do
    progress <- mconcat [ o A..:? "progress", readMaybe <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatActionUploadingDocument { progress = progress }

   parseChatActionChoosingLocation :: A.Value -> T.Parser ChatAction
   parseChatActionChoosingLocation = A.withObject "ChatActionChoosingLocation" $ \o -> do
    return $ ChatActionChoosingLocation {  }

   parseChatActionChoosingContact :: A.Value -> T.Parser ChatAction
   parseChatActionChoosingContact = A.withObject "ChatActionChoosingContact" $ \o -> do
    return $ ChatActionChoosingContact {  }

   parseChatActionStartPlayingGame :: A.Value -> T.Parser ChatAction
   parseChatActionStartPlayingGame = A.withObject "ChatActionStartPlayingGame" $ \o -> do
    return $ ChatActionStartPlayingGame {  }

   parseChatActionRecordingVideoNote :: A.Value -> T.Parser ChatAction
   parseChatActionRecordingVideoNote = A.withObject "ChatActionRecordingVideoNote" $ \o -> do
    return $ ChatActionRecordingVideoNote {  }

   parseChatActionUploadingVideoNote :: A.Value -> T.Parser ChatAction
   parseChatActionUploadingVideoNote = A.withObject "ChatActionUploadingVideoNote" $ \o -> do
    progress <- mconcat [ o A..:? "progress", readMaybe <$> (o A..: "progress" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatActionUploadingVideoNote { progress = progress }

   parseChatActionCancel :: A.Value -> T.Parser ChatAction
   parseChatActionCancel = A.withObject "ChatActionCancel" $ \o -> do
    return $ ChatActionCancel {  }