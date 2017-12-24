{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PartialTypeSignatures #-}
module Pages.FAQ (faq) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Control.Monad

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Pages.People.Everyone

faq :: Html
faq = do

    -- /#company-information
    section ! A.id "team" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "FAQ"
      mapM_ makeLink allFAQs
      mapM_ makeQuestions allFAQs

makeLink (title,anch,_) = li $ a ! href (mappend "#" anch) $ title

makeQuestions (title,anchor,content) = do
    a ! A.id anchor $ h2 ! class_ "title text-left wow fadeInDown" ! dataAttribute "wow-duration" "500ms" $ title
    p ! class_ "wow fadeInDown" ! A.style "padding-left:12%;padding-right:12%" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do content

allFAQs = [
    howtoapply
  , scholarship
  , dates
  , acceptance
  , travel
  , travelLocal 
  ]

scholarship =
   ("Is scholarship available?", "scholarship", "The best place to start looking for funding is through your home institution. Additionally, World Scholars has some scholarship available on a need-based evaluation for each student. In order to apply for scholarship, please indicate you are interesting scholarship in your application. World Scholars is dedicated to making all our programs available to as many students as possible and will work one-on-one with each student to assist them as much as we are able to find funding.")

howtoapply :: (_, _, Html)
howtoapply = 
   ("How to apply", "applying",
   do 
      "Complete the "
      a ! href "apply.html" $ "application form"
      ". You will receive an email confirmation that we have received your application immediately upon submission. The application process should take no more than 20 minutes.")

dates = 
  ("Important Dates", "dates", "You will be notified via email of our decision by no later than January 15th. Application closes on January 12th. Please indicate if you will need a letter of invitation for a visa in the application. Those who need a visa will be contacted separately about the visa.")

acceptance = ("What happens after I am accepted?", "acceptance", do
  "Below is an overview of what the detailed ‘Acceptance Letter’ will provide. We will be in personal contact with the admitted student to answer any questions and provide support for an easy and smooth travel and fun and meaningful experience with our program. A third party smartphone application (e.g., Whats App) will be set up so that constant communication between the students and the staff is possible."
  br
  "You will receive a detailed email from us. It will include: "
  H.div ! class_ "wow fadeInDown" ! A.style "padding-left:12%;padding-right:12%" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "0ms" $ do
    li "Flight recommendations to New York, JFK airport for arrival and return to your home country."
    li "Pickup and travel to and from NYC, Boston, and your hotel in New Haven."
    li "Hotel recommendations and pricing. Our staff can assist you in making reservations."
    li "A list of restaurants and food options."
    li "A local transportation options. Our chaperones will be available 24/7 in case of any emergency.")

travel = ("How do I travel to the United States?", "internationaltravel", do
   "We recommend traveling to and from John F. Kennedy (JFK) International airport in New York (Queens, NY), From JFK:"	
   "We will have a shuttle ready for pick-up that will bring you all the way to New Haven to your respective hotels. The schedule of the shuttle pick-up will become available upon your acceptance to the program. You may travel via another airport if you wish, but will cannot provide transportation to New Haven from any location other than JFK.")

travelLocal = ("How does travel within New Haven work?", "localtravel", do
   "Almost any class, event, restaurant, or housing is within a maximum of 20 minutes walking distance. Uber and Lyft are also options. For Uber and Lyft, a credit card needs to be connected to the app for payment."
   br
   br
   "On our first day with the students we will provide a campus tour with the entire group, starting with breakfast at a local favorite restaurant Claire’s Cornucopia in the heart of Yale and New Haven. From there we will give a guided tour of the campus, which will both be a fascinating introduction to the history of Yale University as well as acquainting the students with the area they will be living over the course of 10 days.")

