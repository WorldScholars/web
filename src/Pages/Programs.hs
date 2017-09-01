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

    -- /#program-information
    section ! A.id "program-overview" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "Our Programs"
      p ! class_ "text-center wow fadeInDown" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
          "We have hosted programs around the world..."

    -- /#program list
    section ! A.id "programs" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
         mapM_ renderProgramStub (reverse allPrograms)
	
	
renderProgramStub :: Program -> Html
renderProgramStub program@Program{..} =
	H.div ! class_ "single-features" $ do
	    H.div ! class_ "col-sm-5 wow fadeInLeft" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ img ! src mainPic ! class_ "img-responsive" ! alt ""
	    H.div ! class_ "col-sm-6 wow fadeInRight" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ do
		h2 $ a ! href (toValue $ linkTo program) $ string (name ++ " - " ++ dates)
		p $ string summary
     
