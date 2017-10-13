module ResElmE exposing (..)

import Resume exposing (resume)
import Types exposing (Position, Education, Resume)

import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (filterMap, concat, map)

-- Models
-- Utilities
italic : String -> Html msg
italic s =
    i [] [text s]

sechead : String -> Html msg
sechead s =
    h2 [] [ text s ]

rule : Html msg
rule =
    hr [] []

break : Html msg
break =
    br [] []

list : List String -> Html msg
list l =
    ul
        []
        (List.map (\s -> li [] [ text s ]) l)

-- Section views
viewPosition : Position -> Html msg
viewPosition p =
    section
        []
        [ strong [] [ text p.company ]
        , Html.p [] [ text p.title, italic p.timeline]
        , Html.p [] [ text p.description ]
        , list p.points
        ]

viewContact : Resume -> Html msg
viewContact res =
    blockquote
        []
        [ a [ href ("mailto:" ++ res.email) ] [ text res.email ]
        , text (" • " ++ res.phone)
        , break
        , text res.address
        ]

viewTitle : Resume -> Html msg
viewTitle res =
    section
        []
        [ h1 [] [ text res.name ]
        , rule
        , p [] [ blockquote [] [ text res.title ] ]
        , rule
        , viewContact res
        ]

viewEducation : Education -> Html msg
viewEducation ed =
    dl
        []
        [ dt [] [ text ("Graduated " ++ ed.graduation) ]
        , dd [] [ strong [] [ text ed.degree ], text ed.school ]
        ]

viewSkills : List String -> Html msg
viewSkills skills =
    section
        []
        [ list skills ]

viewSection : (a -> Html msg) -> List a -> Html msg
viewSection f a =
    section
        []
        <| List.map f a

-- Main view
view : Html msg
view =
    let
        res = resume
    in
        body []
            [ viewTitle res
            , rule
            , sechead "Education"
            , viewSection viewEducation res.educations
            , rule
            , sechead "Skills"
            , viewSkills res.skills
            , rule
            , sechead "Experience"
            , viewSection viewPosition res.positions
            ]
