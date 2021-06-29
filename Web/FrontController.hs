module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Questions
import Web.Controller.Categories
import Web.Controller.Static

instance FrontController WebApplication where
    controllers =
        [ startPage CategoriesAction
        -- Generator Marker
        , parseRoute @QuestionsController
        , parseRoute @CategoriesController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
