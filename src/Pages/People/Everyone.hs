{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Pages.People.Everyone where

import Text.Blaze.Html5 hiding (map,head)
import qualified Text.Blaze.Html5 as H hiding (head)
import Text.Blaze.Internal (AttributeValue)
import Data.String
import qualified Data.List as L
import Text.Blaze.Html5.Attributes hiding (name)
import qualified Text.Blaze.Html5.Attributes as A hiding (name)

import Data.List.Split


makeBio :: Person -> Html
makeBio Person{..} = do
    section ! A.id "about-person" ! class_ "padding-top wow fadeInUp" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
	img ! src headshotLink ! class_ "margin-bottom" ! A.style "width:25%" ! alt ""
	h1 ! class_ "margin-bottom" ! A.style "text-center" $ string $ name
	h3 ! class_ "margin-bottom" $ title
	p $ do bio
    

everyone :: [Person]
everyone = sortWith name $ map addHeadshot
  [rahul
  ,aaron
  ,rahel
  ,dao
  ,maria
  ,santolucito
  ,murphy
  ,diana
  ,jacob
  ,sangwoo
  ,stefan
  ,klumpp
  ]

addHeadshot p = p {headshotLink=fromString $ (("images/headshots/")++(head $tail $splitOn " " $ name p)++".jpg")}

linkTo :: Person -> String
linkTo p =
  (head$ tail $ splitOn " " $ name p)++".html"

data Person = Person {
  headshotLink :: AttributeValue,
  name :: String,
  title :: Html,
  bio :: Html
}

klumpp = Person{
  headshotLink = "",
  name = "Christian Klumpp",
  title = "Physics MS - Ruprecht-Karls-Universität Heidelberg",
  bio = ""
}
rahul = Person{
  headshotLink = "",
  name = "Rahul Dhodapkar",
  title = "Consulting Engineer - MongoDB ; BS Yale University",
  bio = "Rahul Dhodapkar is a consulting engineer with MongoDB, a global database startup based in New York City.  Before joining MongoDB, Rahul earned his degree in Computer Science from Yale University, where he published research on investigating the genetic factors that might cause autism.  With MongoDB, Rahul has had experience working with engineers from companies such as Facebook and Microsoft, as well as with business leaders in a variety of industries.  Rahul is especially interested in information security and understanding team dynamics, and hopes that you will be too!"
}

aaron = Person{
  headshotLink = "",
  name = "Aaron Profumo",
  title = "MFA Yale School of Drama",
  bio = "Aaron is an actor, producer, teacher, comic, improviser, and recent graduate of the Yale School of Drama where he received his MFA. As a teacher Aaron draws from a variety of disciplines ranging from Stanislavski, Grotowski, Linklater, Alexander, Fitzmaurice, Bogart, Le Coque, and others, forming a methodology that explores the mind/body divide in acting and creating fully expressive performers and artists that use their whole instrument with ease and free creative impulse. Aaron is a co-founder of RTCstudios, a multimedia arts company seeking to produce, fund, and fully incubate young and mid level budding artists from a range of mediums. www.AaronProfumo.com"
}

rahel = Person{
  headshotLink = "",
  name = "Rahel Kroeker",
  title = "MA, Yale University ; MA Candidate, Universität Konstanz ",
  bio = ""
}

dao = Person{
  headshotLink = "",
  name = "Pantiphar Dao Chantes",
  title = "Doctoral Candidate, Columbia University",
  bio = ""
}

diana = Person{
  headshotLink = "",
  name = "Diana LeDang",
  title = "NP, MSN-BC, Yale University ; MPH University of California, LA",
  bio = ""
}

santolucito = Person{
  headshotLink = "",
  name = "Mark Santolucito (CTO)",
  title = "MS - Computer Science, Yale University",
  bio = "Mark Santolucito is a Computer Science PhD student at Yale University, where he is studying programming languages with Ruzica Piskac. Mark originally started under the supervision of Paul Hudak, working on interactive computer music in and Functional Reactive Programming (FRP). Mark is now working with Ruzica Piskac on various forms of program synthesis. Recently, their work has focused on synthesis of FRP programs from logical specifications. Mark also graduated Cum Laude from Amherst College with a BA in both Computer Science and Music, where he was awarded the Best Computer Science Thesis Award in addition to the Lerner Piano Prize upon graduation. See more at marksantolucito.com"
}

maria = Person{
  headshotLink = "",
  name = "Maria Hwang",
  title = "EdD, Columbia University",
  bio = ""
}

stefan = Person{
  headshotLink = "",
  name = "Stefan Brunner",
  title = "Projektmanager",
  bio = ""
}

murphy = Person{
  headshotLink = "",
  name = "Thomas Murphy",
  title = "Consulting Engineer, Various",
  bio = ""
}

jacob = Person{
  headshotLink = "",
  name = "Jacob Li (CFO)",
  title = "Yale University",
  bio = ""
}

sangwoo = Person{
  headshotLink = "",
  name = "Lee Sangwoo",
  title = "EdM Harvard University",
  bio = ""
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


sortWith :: Ord b => (a -> b) -> [a] -> [a]
sortWith f = L.sortBy (\x y -> compare (f x) (f y))
