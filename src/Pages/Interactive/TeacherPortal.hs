{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Interactive.TeacherPortal (teacherPortal) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Templates.Scripts

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

teacherPortal :: Html
teacherPortal = do
    section ! A.id "Profile" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! A.id "teacherWelcome" $ "Welcome "
      h2 ! A.id "whichExam" $ "Exam #"
      h2 $ "Personalized summaries for each student"
      table ! A.class_ "answer-table" $ do
          thead $ tr $ do
              th "Student"
              th "Link to exam details"
              th "Section 1"
              th "Section 2"
              th "Section 3 "
              th "Section 4"
              th "Top Problem Area 1"
              th "Top Problem Area 2"
              th "Top Problem Area 3"
              th "Top Problem Area 4"
              th "Top Problem Area 5"
              th "Top Problem Area 6"
          tbody mempty
      h2 "Collected results over all students, sorted in order of most wrong"
      H.div ! A.id "tables" $ ""
      p ! A.id "summary" $ ""

