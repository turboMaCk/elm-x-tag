module XClock exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


xClock : List (Attribute msg) -> List (Html msg) -> Html msg
xClock =
    node "x-clock"
