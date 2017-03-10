{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.About where

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
    
    -- /#services
    section ! A.id "action" $ H.div ! class_ "vertical-center" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "action count" $ do
	 h2 "Collectively, we represent..."
         mapM_ 
            (\(x,y) -> do 
	      H.div ! class_ "col-sm-3 text-center wow bounceIn" ! dataAttribute "wow-duration" "1000ms" ! dataAttribute "wow-delay" "300ms" $ do
                h1 ! class_ "timer bold" ! dataAttribute "to" x ! dataAttribute "speed" "3000" ! dataAttribute "from" "0" $ mempty
                h3 y)
	    [("34","Academic Papers"),("6","Countries"),("19","Degrees"),("78","Years of Experience")]
    


    -- /#company-information
    section ! A.id "team" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
	h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "Meet the Team"
	p ! class_ "text-center wow fadeInDown" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
	    "Our team is an eclectic group of young professionals at the top of their field."
	    br
	    "This team has been working together on similar projects since 2013."
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
