-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallRating where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallProblem as CallProblem

data SendCallRating = 
 SendCallRating { problems :: Maybe [CallProblem.CallProblem], comment :: Maybe String, rating :: Maybe Int, call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendCallRating where
 toJSON (SendCallRating { problems = problems, comment = comment, rating = rating, call_id = call_id }) =
  A.object [ "@type" A..= T.String "sendCallRating", "problems" A..= problems, "comment" A..= comment, "rating" A..= rating, "call_id" A..= call_id ]

instance T.FromJSON SendCallRating where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCallRating" -> parseSendCallRating v
   _ -> mempty
  where
   parseSendCallRating :: A.Value -> T.Parser SendCallRating
   parseSendCallRating = A.withObject "SendCallRating" $ \o -> do
    problems <- optional $ o A..: "problems"
    comment <- optional $ o A..: "comment"
    rating <- optional $ o A..: "rating"
    call_id <- optional $ o A..: "call_id"
    return $ SendCallRating { problems = problems, comment = comment, rating = rating, call_id = call_id }