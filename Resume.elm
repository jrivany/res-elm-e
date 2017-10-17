module Resume exposing (resume)

import Types exposing (Resume, Position, Education)

resume : Resume
resume =
    { name = "John Doe"
    , title = "Sous Chef"
    , address = "123 North Street, Somecity, AA"
    , email = "john.doe@johndoe.org"
    , phone = "+1 (123) 123 - 4567"
    , positions =
        [
            { title = "Sous Chef"
            , company = "Greasy Spoon Fish'n'Chips"
            , timeline = "January 1970 - Present"
            , description = "Performed typical sous chef duties at a local staple restaurant"
            , points =
                [ "Performed prep in the mornings"
                , "Ordered stock from suppliers"
                ]
            }
        ]
    , educations =
        [
            { school = "Somecity High"
            , graduation = "Spring 1969"
            , degree = "Diploma"
            }
        ]
    , skills =
        [ ("Restaurant", [ "Cutting" , "Cleaning" , "Fixing equipment" ] )
        ]
    }
