-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockTableCell where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PageBlockVerticalAlignment as PageBlockVerticalAlignment
import {-# SOURCE #-} qualified API.PageBlockHorizontalAlignment as PageBlockHorizontalAlignment
import {-# SOURCE #-} qualified API.RichText as RichText

--main = putStrLn "ok"

data PageBlockTableCell = 
 PageBlockTableCell { valign :: PageBlockVerticalAlignment.PageBlockVerticalAlignment, align :: PageBlockHorizontalAlignment.PageBlockHorizontalAlignment, rowspan :: Int, colspan :: Int, is_header :: Bool, text :: RichText.RichText }  -- deriving (Show)

instance T.ToJSON PageBlockTableCell where
 toJSON (PageBlockTableCell { valign = valign, align = align, rowspan = rowspan, colspan = colspan, is_header = is_header, text = text }) =
  A.object [ "@type" A..= T.String "pageBlockTableCell", "valign" A..= valign, "align" A..= align, "rowspan" A..= rowspan, "colspan" A..= colspan, "is_header" A..= is_header, "text" A..= text ]
-- pageBlockTableCell PageBlockTableCell  { valign :: PageBlockVerticalAlignment.PageBlockVerticalAlignment, align :: PageBlockHorizontalAlignment.PageBlockHorizontalAlignment, rowspan :: Int, colspan :: Int, is_header :: Bool, text :: RichText.RichText } 

