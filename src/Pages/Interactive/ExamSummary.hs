{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Interactive.ExamSummary (examSummary) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Templates.Scripts

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

examSummary :: Html
examSummary = do
    section ! A.id "Profile" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! A.id "testName" $ "Your results for Exam #"
      h2 ! A.id "submissionTime" $ "Submitted at: "
      h2 ! A.id "totalScore" $ "Total Score: "
      h2 ! A.id "math" $ ""
      h2 ! A.id "reading" $ ""
      h2 ! A.id "writing" $ ""
      table ! A.class_ "answer-table" $ do
          thead $ tr $ do
              th "Section"
              th "Question"
              th "Answer"
              th "Correct Answer"
              th "Question Type"
          tbody mempty
      p ! A.id "summary" $ ""

