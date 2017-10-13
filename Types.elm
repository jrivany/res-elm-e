module Types exposing (..)

type alias Position =
    { title : String
    , company : String
    , timeline : String
    , description : String
    , points : List String
    }

type alias Resume =
    { name : String
    , title : String
    , address : String
    , email : String
    , phone : String
    , positions : List Position
    , educations : List Education
    , skills : List String
    }

type alias Education =
    { school : String
    , graduation : String
    , degree : String
    }

