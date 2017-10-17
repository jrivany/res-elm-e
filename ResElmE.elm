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
        , p [] [ blockquote [] [ text res.title ] ]
        , viewContact res
        ]

viewEducation : Education -> Html msg
viewEducation ed =
    dl
        []
        [ dt [] [ text ("Graduated " ++ ed.graduation) ]
        , dd [] [ strong [] [ text ed.degree ], text ed.school ]
        ]

viewSkill : (String, List String) -> Html msg
viewSkill (group, skills) =
    let
        head =
            case List.head skills of
                Nothing ->
                    ""
                Just skill ->
                    skill
        tail =
            case List.tail skills of
                Nothing ->
                    []
                Just s ->
                    s
    in
        tr
            []
            [ td [] [ strong [] [ text group ] ]
            , td [] [ text <| List.foldl (\l r -> r ++ ", " ++ l) head tail ]
            ]

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
            , table [] <| List.map viewSkill res.skills
            , rule
            , sechead "Experience"
            , viewSection viewPosition res.positions
            ]
