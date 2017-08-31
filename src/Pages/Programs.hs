{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Programs where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Pages.Programs.AllPrograms

programs :: Html
programs = do

    -- /#company-information
    section ! A.id "team" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "Our Programs"
      p ! class_ "text-center wow fadeInDown" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
          "We have hosted programs around the world..."


renderProgramStub :: Program -> Html
renderProgramStub program@Program{..} =
      H.div ! class_ "col-sm-3 col-xs-10" $ H.div ! class_ "team-single-wrapper" $ do
          H.div ! class_ "team-single" $ do
              H.div ! class_ "person-thumb" $ img ! src mainPic ! class_ "img-responsive" ! alt ""
              H.div ! class_ "social-profile" $ ul ! class_ "nav nav-pills" $ do
                li $ a ! href (toValue $ linkTo program) $ "more info"
          H.div ! class_ "program-info" $ do
              h2 $ string name
              p $ string dates
