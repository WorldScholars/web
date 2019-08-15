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
      p $ do
        "In oder to give us permission to view your FitBit date, please grant us access" 
        a ! href "https://www.fitbit.com/oauth2/authorize?client_id=22CYBG&response_type=token&scope=activity%20nutrition%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=31536000" $ "grant us permissions to you FitBit data."
        "This will allow us to make cool graphs for you. Just follow the link, select \"Allow All\" (you may need to de-select and select again) and click \"Allow\"."

      mapM_ testLink [3,4,5,6,9,318,419]

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
