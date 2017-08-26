{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.About (about) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Pages.People.Everyone

about :: Html
about = do
    {-section ! A.id "page-breadcrumb" $ H.div ! class_ "vertical-center sun" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "action" $ H.div ! class_ "col-sm-12" $ do
      h1 ! class_ "title" $ "About Us"
      p "Who we are and where we come from"-}
    
    -- /#page-breadcrumb
    section ! A.id "about-company" ! class_ "padding-top wow fadeInUp" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      img ! src "images/aboutus/CEO.png" ! class_ "margin-bottom" ! alt ""
      h1 ! class_ "margin-bottom" $ "A letter from our CEO"
      p $ do
          "From years of teaching, years of being a student in different capacities, and years of observing my parents teach, I have witnessed the power of providing educational opportunities in any learning environment. Education has become an over-specified and over-defined term as we navigate through the failures and successes in history, defined by the accomplishments we have achieved in life. However, as John Dewey once mentioned, \"education is not preparation for life; education is life itself\". In any circumstance, we can find learning, we can find opportunities, and we can find growth. Alongside my fellow World Scholars, I have witnessed talent that utilizes every bit of our lives to find learning and meaning in them."
          br
          "-Dr. Maria Hwang, Ed.D."
