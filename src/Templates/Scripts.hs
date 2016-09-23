{-# LANGUAGE OverloadedStrings #-}
module Templates.Scripts where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

htmlScripts :: Html
htmlScripts =
  mapM_ (\x-> script ! type_ "text/javascript" ! src x $ mempty)
    ["js/jquery.js","js/bootstrap.min.js","js/lightbox.min.js","js/wow.min.js","js/jquery.countTo.js","js/main.js"]

