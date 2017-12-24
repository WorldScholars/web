{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Apply (apply) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

apply :: Html
apply = do

    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Application for February 2018:"
      h1 ! class_ "margin-bottom" $ a ! href "February2018.html" $ "Intercultural Exchange through the Lens of Liberal Arts"
    iframe ! src "https://yalesurvey.qualtrics.com/jfe/form/SV_0CfHWFv9Tu7kzw9" ! height "850px" ! width "100%" $ ""
