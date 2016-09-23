{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Pages.People.Everyone where

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes hiding (name)
import qualified Text.Blaze.Html5.Attributes as A hiding (name)

import Data.List.Split


makeBio :: Person -> Html
makeBio Person{..} = do
    section ! A.id "about-person" ! class_ "padding-top wow fadeInUp" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
	img ! src headshotLink ! class_ "margin-bottom" ! alt ""
	h1 ! class_ "margin-bottom" $ string $ name
	h3 ! class_ "margin-bottom" $ title
	p $ do bio
    

everyone :: [Person]
everyone = 
  [rahul
  ,aaron
  ]

linkTo :: Person -> String
linkTo p =
  (last $ splitOn " " $ name p)++".html"

data Person = Person {
  headshotLink :: AttributeValue,
  name :: String,
  title :: Html,
  bio :: Html
}

rahul = Person{
  headshotLink = "images/headshots/rahul.jpg",
  name = "Rahul Dhodapkar",
  title = "Consulting Engineer - MongoDB",
  bio = "Rahul Dhodapkar is a consulting engineer with MongoDB, a global database startup based in New York City.  Before joining MongoDB, Rahul earned his degree in Computer Science from Yale University, where he published research on investigating the genetic factors that might cause autism.  With MongoDB, Rahul has had experience working with engineers from companies such as Facebook and Microsoft, as well as with business leaders in a variety of industries.  Rahul is especially interested in information security and understanding team dynamics, and hopes that you will be too!"
}

aaron = Person{
  headshotLink = "images/headshots/aaron.jpg",
  name = "Aaron Profumo",
  title = "Actor",
  bio = "Aaron is an actor, producer, teacher, comic, improviser, and recent graduate of the Yale School of Drama where he received his MFA. As a teacher Aaron draws from a variety of disciplines ranging from Stanislavski, Grotowski, Linklater, Alexander, Fitzmaurice, Bogart, Le Coque, and others, forming a methodology that explores the mind/body divide in acting and creating fully expressive performers and artists that use their whole instrument with ease and free creative impulse. Aaron is a co-founder of RTCstudios, a multimedia arts company seeking to produce, fund, and fully incubate young and mid level budding artists from a range of mediums. www.AaronProfumo.com"
}

{-Prelude.map f
  [("images/aboutus/1.jpg","Mark Santolucito","Yale CS PhD Candidate","...")
  ,("images/aboutus/2.jpg","Rahul","Yale CS PhD Candidate")
  ,("images/aboutus/3.jpg","Aaron Profumo","Yale CS PhD Candidate")
  ,("images/aboutus/4.jpg","Dao Chantes","Yale CS PhD Candidate")
  ,("images/aboutus/2.jpg","Chris Klumpp","Yale CS PhD Candidate")
  ,("images/aboutus/1.jpg","Maria Hwang","Yale CS PhD Candidate")
  ,("images/aboutus/4.jpg","Diana LeDang","Yale CS PhD Candidate")
  ,("images/aboutus/3.jpg","Sangwoo Lee","Yale CS PhD Candidate")
  ,("images/aboutus/1.jpg","Stephan Brunner","Yale CS PhD Candidate")
  ,("images/aboutus/4.jpg","Rahel Kroeker","Yale CS PhD Candidate")]
-}
