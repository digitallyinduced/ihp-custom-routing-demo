module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data CategoriesController
    = CategoriesAction
    | NewCategoryAction
    | ShowCategoryAction { categoryId :: !(Id Category) }
    | CreateCategoryAction
    | EditCategoryAction { categoryId :: !(Id Category) }
    | UpdateCategoryAction { categoryId :: !(Id Category) }
    | DeleteCategoryAction { categoryId :: !(Id Category) }
    deriving (Eq, Show, Data)

data QuestionsController
    = QuestionsAction { categoryId :: !(Id Category) }
    | NewQuestionAction { categoryId :: !(Id Category) }
    | ShowQuestionAction { questionId :: !(Id Question) }
    | CreateQuestionAction
    | EditQuestionAction { questionId :: !(Id Question) }
    | UpdateQuestionAction { questionId :: !(Id Question) }
    | DeleteQuestionAction { questionId :: !(Id Question) }
    deriving (Eq, Show, Data)
