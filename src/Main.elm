module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import XClock exposing (..)


-- Model


type alias Model =
    { number : Int
    , visible : Bool
    }


init : ( Model, Cmd msg )
init =
    ( Model 1 True, Cmd.none )



-- Update


type Msg
    = Add
    | Remove
    | ToggleClocks


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Add ->
            ( { model | number = model.number + 1 }, Cmd.none )

        Remove ->
            ( { model | number = model.number - 1 }, Cmd.none )

        ToggleClocks ->
            let
                newVisible =
                    not model.visible
            in
                ( { model | visible = newVisible }, Cmd.none )



-- View


xClocksView : Model -> Html msg
xClocksView model =
    List.range 1 model.number
        |> List.map (\_ -> div [] [ xClock [] [] ])
        |> div []


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Add ] [ text "Add x-clock" ]
        , button [ onClick Remove ] [ text "remove x-clock" ]
        , button [ onClick ToggleClocks ] [ text "show/hide" ]
        , if model.visible then
            xClocksView model
          else
            text ""
        ]


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
