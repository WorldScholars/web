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

      --h3 ! A.style "text-decoration: underline" $ "Domestic Programs"
      h3 "[Domestic Programs]"
      mapM_ makeLink domesticFAQs
      mapM_ makeQuestions domesticFAQs

      br
      br

      --h3 ! A.style "text-decoration: underline" $ "International Programs"
      h3 "[International Programs]"
      mapM_ makeLink internationalFAQs
      mapM_ makeQuestions internationalFAQs

makeLink (title,anch,_) = li $ a ! href (mappend "#" anch) $ title

makeQuestions (title,anchor,content) = do
    a ! A.id anchor $ h2 ! class_ "title text-left wow fadeInDown" ! dataAttribute "wow-duration" "500ms" $ title
    p ! class_ "wow fadeInDown" ! A.style "padding-left:12%;padding-right:12%" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do content


-------
--
-- Domestic
--
-------

domesticFAQs = [
    tuition
  ]
  


-------
--
-- International
--
-------

internationalFAQs = [
    howtoapply
  , dates
  , scholarship
  , acceptance
  , travel
  , housing
  , travelLocal 
  , tuition
  , currency
  , phone
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
  "Below is an overview of what the detailed ‘Acceptance Letter’ will provide. We will be in personal contact with the admitted student to answer any questions and provide support for an easy and smooth travel and fun and meaningful experience with our program. A third party smartphone application (e.g., WhatsApp) will be set up so that constant communication between the students and the staff is possible."
  br
  "You will receive a detailed email from us. It will include: "
  H.div ! class_ "wow fadeInDown" ! A.style "padding-left:12%;padding-right:12%" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "450ms" $ do
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
   "On our first day with the students we will provide a campus tour with the entire group, starting with breakfast at a local favorite restaurant Claire’s Cornucopia in the heart New Haven. From there we will give a guided tour of the campus, which will both be a fascinating introduction to the history of liberal arts, as well as acquainting the students with the area they will be living over the course of 10 days.")

phone = ("Will my smartphone data work?", "phone", do
  "We highly encourage students to use an international data plan so that upon arrival you will have access to the Internet and can be in touch with our staff. Just be aware that at the JFK terminal and luggage pick-up area, there will be limited Internet service until you step outside of that area.")

housing = ("How does housing work?", "housing", do
  "Accepted students will be in close contact with us and we will assist with arranging accommodations as translators for the families and their preference of housing. "
  H.div ! class_ "wow fadeInDown" ! A.style "padding-left:12%;padding-right:12%" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "450ms" $ do
    li $ do 
      "There are several hotels in the direct downtown area of New Haven. "
      a ! href "https://www.thestudyatyale.com/rooms.html" $ "The Study"
      a ! href "https://www.omnihotels.com/hotels/new-haven-yale/accommodations" $ "The Omni"
      ", and the "
      a ! href "https://www.reservationcounter.com/hotels/show/6122f5a/courtyard-new-haven-at-yale-new-haven-ct/?cid=sem::OTPRC::AW::PT-P01::Marriott-Courtyard::Courtyard-New-Haven-at-Yale-New-Haven-CT-US-107282-did-6122f5a::courtyard-marriott-new-haven::Exact&creative=230376737192&device=c&AdPos=1t1&utm_source=google&utm_medium=cpc&utm_term=courtyard-marriott-new-haven&utm_campaign=Marriott-Courtyard&TID=s7B2PepuG_dc%7cpcrid%7c230376737192&utm_source=google&utm_medium=cpc&utm_term=courtyard%20marriott%20new%20haven&utm_campaign=Marriott+-+Courtyard&keyword=courtyard%20marriott%20new%20haven&hotelid=107282&landingpage=&gclid=CjwKCAiAmvjRBRBlEiwAWFc1mHjOTn6eqPOtgMiYPxeZaO0DcvyH0NGjR9eVJZuh2iMDiZEZAZUU2hoCUS8QAvD_BwE&gclsrc=aw.ds" $ "Courtyard Marriot"
      "at New Haven are the best options, offering proximity to all of our events and classes. Students may choose to room with another student (two per hotel room) if they wish, both as a way to save money and to get to know each other! We will help you find a roommate among other participants of the program if you’re interested in sharing a hotel room. If you would like to book a different hotel, please contact us beforehand to ensure it is in an ideal location for the events we have scheduled."
    li "AirBnB is an application commonly used in the United States. Students can use the app to book an available room in a house on campus or nearby. The rooms are rented directly by the owner of the house. If you wish to use this option please contact us before booking so we can give you a detailed explanation of the process and the best locations.")

currency = ("How do I exchange currency during the program?", "currency", do
  "Money can be exchanged at any of the banks in downtown New Haven. Our recommendation is that you change at your local banks in your home country, and arrive with $500 USD to the United States, as your local institutions may have lower exchange fees."
  br
  br
  "Credit Cards are the favored method of payment in the United States and any major Visa, Mastercard, Discover, or American Express are accepted at any restaurant, hotel, or ticketed event.")

tuition = ("How do I make my payment for the program?", "payment", do
  "We will accept tuition payment via "
  a ! href "https://www.paypal.com/" $ "PayPal"
  ". Once your application is submitted and accepted, a separate, safe link will be sent to you for you to complete the tuition payment transaction.")
