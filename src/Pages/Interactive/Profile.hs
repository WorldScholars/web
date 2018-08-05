{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Interactive.Profile (profile) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Templates.Scripts

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

profile :: Html
profile = do
    section ! A.id "Profile" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Your account"
      p ! A.id "username" $ ""

      mapM_ testLink [4]

      h2 "Your past Exams"
      table ! A.class_ "answer-table" $ do
          thead $ tr $ do
              th "Exam Number"
              th "Submission Time"
              th "Link to results"
          tbody mempty

  
testLink tNum = p $ do
    "Take "
    a ! href (stringValue ("/scantron.html?tNum="++(show tNum))) $ string ("Practice Test #"++(show tNum))
