{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.People where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Pages.People.Everyone

people :: Html
people = do

    -- /#company-information
    section ! A.id "team" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "Meet the Team"
      p ! class_ "text-center wow fadeInDown" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
          "Our team is an eclectic group of young professionals at the top of their fields."
          br
          "This team has been working together on similar projects since 2013."

    -- /#people profiles
    section ! A.id "profiles" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      H.div ! A.id "team-carousel" ! class_ "carousel slide wow fadeIn" ! dataAttribute "ride" "carousel" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
          --  Indicators 
          ol ! class_ "carousel-indicators visible-xs" $ do
            li ! dataAttribute "target" "#team-carousel" ! dataAttribute "slide-to" "0" ! class_ "active" $ mempty
            li ! dataAttribute "target" "#team-carousel" ! dataAttribute "slide-to" "1" $ mempty
          --  Wrapper for slides 
          H.div ! class_ "carousel-inner" $ do
            H.div ! class_ "row" $ mapM_ renderPersonStub (take 4 everyone)
            H.div ! class_ "row" $ mapM_ renderPersonStub (take 4 $ drop 4 everyone)
            H.div ! class_ "row" $ mapM_ renderPersonStub (take 4 $ drop 8 everyone)

renderPersonStub :: Person -> Html
renderPersonStub person@Person{..} =
      H.div ! class_ "col-sm-3 col-xs-10" $ H.div ! class_ "team-single-wrapper" $ do
          H.div ! class_ "team-single" $ do
              H.div ! class_ "person-thumb" $ img ! src headshotLink ! class_ "img-responsive" ! alt ""
              H.div ! class_ "social-profile" $ ul ! class_ "nav nav-pills" $ do
                li $ a ! href (toValue $ linkTo person) $ "more info"
          H.div ! class_ "person-info" $ do
              h2 $ string name
              p title
