{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.HR (hrPrototype) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Pages.People.Everyone
import Pages.People

hrPrototype :: String -> Html
hrPrototype gnuCanvasHTML = do

    -- /#page-breadcrumb
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Prototype"
      p $ do
          "This image was generated from student data collected during the summer of 2018. Red dots indicate the quesiton was answered incorrectly, while green dots indicate the question was answered correctly. Mouse over the dots to see which section and and question number the dot represents. Click anywhere on the graph to see info about that point."
          preEscapedToHtml $ gnuCanvasHTML
