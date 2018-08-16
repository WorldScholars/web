{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Interactive.Fitbit (fitbitAuthResponse) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Templates.Scripts

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

fitbitAuthResponse :: Html
fitbitAuthResponse = do
    section ! A.id "signup" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      p "saving your fitbit auth credentials to the database... This allows us to make cool graphs for you"
      h1 "PLEASE DON'T NAVIGATE AWAY FROM THIS PAGE"
      p "BE PATIENT WITH ME - I STRUGGLE SOMETIMES"
