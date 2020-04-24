-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockHorizontalAlignment where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data PageBlockHorizontalAlignment = 
 PageBlockHorizontalAlignmentLeft 
 | PageBlockHorizontalAlignmentCenter 
 | PageBlockHorizontalAlignmentRight deriving (Show, Eq)

instance T.ToJSON PageBlockHorizontalAlignment where
 toJSON (PageBlockHorizontalAlignmentLeft {  }) =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentLeft" ]

 toJSON (PageBlockHorizontalAlignmentCenter {  }) =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentCenter" ]

 toJSON (PageBlockHorizontalAlignmentRight {  }) =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentRight" ]

instance T.FromJSON PageBlockHorizontalAlignment where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockHorizontalAlignmentLeft" -> parsePageBlockHorizontalAlignmentLeft v
   "pageBlockHorizontalAlignmentCenter" -> parsePageBlockHorizontalAlignmentCenter v
   "pageBlockHorizontalAlignmentRight" -> parsePageBlockHorizontalAlignmentRight v
   _ -> mempty
  where
   parsePageBlockHorizontalAlignmentLeft :: A.Value -> T.Parser PageBlockHorizontalAlignment
   parsePageBlockHorizontalAlignmentLeft = A.withObject "PageBlockHorizontalAlignmentLeft" $ \o -> do
    return $ PageBlockHorizontalAlignmentLeft {  }

   parsePageBlockHorizontalAlignmentCenter :: A.Value -> T.Parser PageBlockHorizontalAlignment
   parsePageBlockHorizontalAlignmentCenter = A.withObject "PageBlockHorizontalAlignmentCenter" $ \o -> do
    return $ PageBlockHorizontalAlignmentCenter {  }

   parsePageBlockHorizontalAlignmentRight :: A.Value -> T.Parser PageBlockHorizontalAlignment
   parsePageBlockHorizontalAlignmentRight = A.withObject "PageBlockHorizontalAlignmentRight" $ \o -> do
    return $ PageBlockHorizontalAlignmentRight {  }