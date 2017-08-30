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
    section ! A.id ("about-person") ! class_ "padding-top wow fadeInUp" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      img ! src headshotLink ! class_ "margin-bottom" ! A.style "width:25%" ! alt ""
      h1 ! class_ "margin-bottom" ! A.style "text-center" $ string $ name
      h3 ! class_ "margin-bottom" $ title
      p $ do bio
    

everyone :: [Person]
--TODO can only display 12
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
--  ,sangwoo
  ,stefan
  ,klumpp
  ,fiona
--  ,felix
  ]

addHeadshot p = p {headshotLink=fromString $ (("images/headshots/")++([head $ name p])++(head $tail $splitOn " " $ name p)++".jpg")}

linkTo :: Person -> String
linkTo p =
  ([head $ name p]) ++ (head$ tail $ splitOn " " $ name p)++".html"

data Person = Person {
  headshotLink :: AttributeValue,
  name :: String,
  title :: Html,
  bio :: Html
}

fiona = Person{
  headshotLink = "",
  name = "Fiona Santolucito (COO)",--NB fix this if we talk to investors
  title = "Organizing Opportunities",
  bio = "Fiona Santolucito is a senior at Johns Hopkins University as a Hodson Trust Scholar. She is fluent in Mandarin Chinese (HSK-5) and has studied at Beijing #80 High School. She has also studied at Yonsei University, South Korea, where she worked with The Associated Press to promote children's health issues in North Korea. Fiona worked with Tuscany Strategy, an education and health care consulting firm, for two years where she built models for business opportunities. Fiona acts as the Director of Operations at World Scholars."
}

klumpp = Person{
  headshotLink = "",
  name = "Christian Klumpp",
  title = "The Science of Business",
  bio = "Christian Klumpp is a recent graduate of Ruprecht-Karls-Universitat Heidelberg, with a Masters of Science in Physics with Computer Science as a Minor. His work has brought him to research labs across the world, from Yale University to ETH Zurich. While in school he held a position at Porsche's Shanghai, China office. Most recently, he worked as a developer for a technology startup in Zurich, Switzerland. <br> Mr. Klumpp is an expert at networking, having interviewed with Oliver Wyman, Bain & Company, Google, and more. Many renowned consulting firms like Roland Berger Strategy Consultants, and McKinsey & Company have sponsored Mr. Klumpp to visit their networking events located across Europe. He is now working at \"the world's leading advisor on business strategy\". At a previous World Scholar's event at GGU, Mr. Klumpp helped students learn how to network in the Western style. He also taught the students to view their degree as more than training for a single skill, but a preparation for a successful life."
}

rahul = Person{
  headshotLink = "",
  name = "Rahul Dhodapkar",
  title = "Bringing Computer Science to Medicine",
  bio = "Rahul Dhodapkar is a consulting engineer with MongoDB, a global database startup based in New York City.  Before joining MongoDB, Rahul earned his degree in Computer Science from Yale University, where he published research on investigating the genetic factors that might cause autism.  With MongoDB, Rahul has had experience working with engineers from companies such as Facebook and Microsoft, as well as with business leaders in a variety of industries. Rahul is especially interested in information security and understanding team dynamics, and hopes that you will be too!"
}

aaron = Person{
  headshotLink = "",
  name = "Aaron Profumo",
  title = "Presenting your Best Self",
  bio = "Aaron is an actor, producer, teacher, comic, improviser, and recent graduate of the Yale School of Drama where he received his MFA. As a teacher Aaron draws from a variety of disciplines ranging from Stanislavski, Grotowski, Linklater, Alexander, Fitzmaurice, Bogart, Le Coque, and others, forming a methodology that explores the mind/body divide in acting and creating fully expressive performers and artists that use their whole instrument with ease and free creative impulse. Aaron is a co-founder of RTCstudios, a multimedia arts company seeking to produce, fund, and fully incubate young and mid level budding artists from a range of mediums. www.AaronProfumo.com"
}

rahel = Person{
  headshotLink = "",
  name = "Rahel Kroeker",
  title = "Addressing Injustice through Action",
  bio = "Rahel Melody Kroeker holds a Masters of Arts in International Development Economics from Yale University ('15). Her studies and volunteer work have brought her from Germany to the USA as well as several African countries. She has for example worked with refugees from the Middle East in Basel (Switzerland), as an English teacher in Tanzania as well as in Afghanistan. As a board member of a German NGO that works in development cooperation, she has organized project evaluation trips to Tanzania and participated in networking conferences in Ethiopia and the USA."
}

dao = Person{
  headshotLink = "",
  name = "Pantiphar Dao Chantes",
  title = "Design as a Philosophy",
  bio = "Dao is a doctoral candidate studying Instructional Technology and Media at Teachers College, Columbia University. Her research focuses on the design and development of interactive media (such as computer games) for teaching and learning. Before coming to the United States, Dao was born and raised in Bangkok, Thailand where she earned a bachelor degree in industrial engineering. Dao is a visual designer and an amateur artist. She has done many kinds of design projects such as instructional materials, graphical user interfaces, websites, educational games, posters/banners/logos, wedding invitations, etc. See more at daochantes.com."
}

diana = Person{
  headshotLink = "",
  name = "Diana LeDang",
  title = "Medicine for the Masses",
  bio = "Originally from Los Angeles, California, Diana made her way to the east coast and is a recent graduate of Yale University (MS '16). Prior to graduation, she engaged in a round of interviews after being recruited by UCLA Medicine, Mount Sinai Hospital, New York Presbyterian Hospital, and Yale New Haven Hospital, to join their intensive care team. She accepted a position at University of Massachusetts Memorial Medical Health System and UMass-Worcester School of Medicine as an Advance Practice Provider and Surgical Intensivist for her interest in working in surgery. Before matriculating into Yale University, she studied at the University of California acquiring a degree in Environmental Science (MPH '12) and in Biomedical Engineering (BS '09). She plans to return for her doctorate specializing in Anesthesia in 2017 and hopes to serve as a tenured faculty member and precepting clinician in Anesthesiology."
}

santolucito = Person{
  headshotLink = "",
  name = "Mark Santolucito",
  title = "Computer Science Without Computers",
  bio = "Mark Santolucito is a Computer Science PhD student at Yale University, where he is studying programming languages with Ruzica Piskac. Mark originally started under the supervision of Paul Hudak, working on interactive computer music in and Functional Reactive Programming (FRP). Mark is now working with Ruzica Piskac on various forms of program synthesis. Recently, their work has focused on synthesis of FRP programs from logical specifications. Mark also graduated Cum Laude from Amherst College with a BA in both Computer Science and Music, where he was awarded the Best Computer Science Thesis Award in addition to the Lerner Piano Prize upon graduation. See more at marksantolucito.com. Mark also acts as the CTO for World Scholars."
}

maria = Person{
  headshotLink = "",
  name = "Maria Hwang (CEO)",
  title = "Education Across Cultures",
  bio = "Maria Hwang is a post-doctoral researcher at the Columbia University Medical Center's (CUMC) Biomedical Informatics Department working with Lena Mamykina. Maria received her doctorate of education at Teachers College, Columbia University in Instructional Technology and Media under the supervision of Charles Kinzer, focusing on persuasive messages for behavior change in a digital game environment. For her dissertation she developed a game, Monster Appetite, and embedded persuasive messages to see if people would be receptive to those tailored messages that emphasized consequences of a positive or negative behavior. She continues her research on persuasive messages at her post-doc at CUMC with diabetic patients."
}

stefan = Person{
  headshotLink = "",
  name = "Stefan Brunner",
  title = "Intercultural Exchange",
  bio = " Stefan Brunner is a project manager at the Mercator Foundation Switzerland, where he is leading a three-year pilot-project, that creates support structures at Swiss universities for student initiatives and projects. He is further responsible for the foundation's support to youth in the areas of volunteering and active in its role in international youth exchange and international cooperation. He holds a Masters degree in International Affairs from the Graduate Institute of International and Development Studies in Geneva and has been a visiting fellow at the McMillan Center for International and Area Studies at Yale University. Among his working experiences are engagements with the United Nations on the classification of internationally responding urban search and rescue teams and with EAPPI as a human rights observer in the occupied Palestinian territories. He is the author of the Impact Compendium on Youth Exchange - An overview of scientific research results on the impact of intercultural exchanges, which has been published in German, English, and French"
  }

murphy = Person{
  headshotLink = "",
  name = "Thomas Murphy",
  title = "Success and Degrees",
  bio = "Tom Murphy is a software engineer based in New York City. He has worked at companies both large and small, from small successful startups (one a credit card company processing over a billion dollars of transactions per year), to mid-size organizations like Brown University, to large companies like The New York Times. He is an expert in functional programming and concurrency. He develops web servers for rich web applications, as well as highly-concurrent applications for data and media exchange in the cloud. Tom is an alumni of The Recurse Center, known as \"the best programming community in the world\"."
}

jacob = Person{
  headshotLink = "",
  name = "Jacob Li (CFO)",
  title = "The Methodology of Philosophy",
  bio = "Before joining World Scholars, he was a Venture Creation Fellow intern at the Yale Entrepreneurial Institute of Yale University, where he helped build Rallybus project. He was also an instructional technologist at Yale College, a technical assistant for Professor Akhil Amar, and a core member of the non-profit organization clinic at Yale Law School. During his time at Yale, he led workshops and case studies for summer Chinese visiting students at the Yale School of Management, and spoke at the Yale Global Alumni Leadership Forum. In addition to his service for the university, he volunteered his time generously with the Yale Alumni Association, helping with planning events and supervising undergraduate interns. As President of the Yale Asian Students Association while attending Yale, he organized many events on campus to promote the well-being of the Asian community.  Jacob holds a masters degree in analytic philosophy of religion from Yale University. In 2012 he received the prestigious John Templeton Fellowship to attend the University of Notre Dame as a visiting graduate scholar in philosophy and ethics."
}

sangwoo = Person{
  headshotLink = "",
  name = "Lee Sangwoo",
  title = "Education and Adversity",
  bio = "Sangwoo Lee is from Seoul, South Korea. He is a recent graduate of Harvard University, with a Masters of Education (Ed.M) in International Education Policy. He went to Grinnell College in Iowa where he studied economics. Before going to Grinnell College, he took the Korean G.E.D (General Education Development) test instead of attending a high school. He has a very interesting life story behind this. He will share how he could get into Harvard University, which is one of the best universities in the world, as a Korean who received the G.E.D diploma. On top of that, he will share how his life at Harvard looked like and what kinds of experiences he had as a student at Harvard. He believes education is one of the strongest driving forces for countries to develop both socially and economically; therefore, he is currently interested in policy implementations regarding both education and public health in developing countries."
}

klein = Person{
  headshotLink = "",
  name = "Felix Klein",
  title = "Computer Science",
  bio = "My research interests lie in the areas of synthesis and infinite games. In particular, I am interested in improving the synthesis process by finding suitable criteria that efficiently bound the solution space. Furthermore, I study the creation of easy to verify certificates for the synthesized solutions and corresponding game models to support these techniques."
} 


sortWith :: Ord b => (a -> b) -> [a] -> [a]
sortWith f = L.sortBy (\x y -> compare (f x) (f y))
