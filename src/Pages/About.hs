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

    -- /#company-information
    section ! A.id "team" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "About Us"
      p ! class_ "text-center wow fadeInDown" ! A.style "padding-left:12%;padding-right:12%" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
          "World Scholars LLC helps facilitate dialogue between East Asian students and Western professionals and academics on the merits of a liberal arts education. We firmly believe that education must be a holistic experience, and this is reflected in our programs which tie together diverse and unique activities and programs outside the classroom to world class lectures and workshops from educators and professors at the top of their fields. World Scholars commitment to making liberal arts educational experiences accessible to students regardless of socio-economic background is reflected in our service to low income students in Korea and first generation Chinese Americans."
          br
          "World Scholars is committed to making liberal arts educational experiences accessible to students regardless of socio-economic background."
    
    -- /#page-breadcrumb
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      img ! src "images/aboutus/CEO.png" ! class_ "margin-bottom" ! alt ""
      h1 ! class_ "margin-bottom" $ "A letter from our CEO"
      p $ do
          "From years of teaching, years of being a student in different capacities, and years of observing my parents teach, I have witnessed the power of providing educational opportunities in any learning environment. Education has become an over-specified and over-defined term as we navigate through the failures and successes in history, defined by the accomplishments we have achieved in life. However, as John Dewey once mentioned, \"education is not preparation for life; education is life itself\". In any circumstance, we can find learning, we can find opportunities, and we can find growth. Alongside my fellow World Scholars, I have witnessed talent that utilizes every bit of our lives to find learning and meaning in them."
          br
          "-Dr. Maria Hwang, Ed.D."
