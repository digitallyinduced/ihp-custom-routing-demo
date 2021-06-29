module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute StaticController
-- instance AutoRoute CategoriesController
-- instance AutoRoute QuestionsController


instance HasPath CategoriesController where
   pathTo CategoriesAction = "/categories"
   pathTo NewCategoryAction = "/category/new"
   pathTo CreateCategoryAction = "/category/create"
   pathTo ShowCategoryAction { categoryId } = "/category/" <> tshow categoryId
   pathTo EditCategoryAction { categoryId } = "/category/edit/" <> tshow categoryId
   pathTo UpdateCategoryAction { categoryId } = "/category/update/" <> tshow categoryId
   pathTo DeleteCategoryAction { categoryId } = "/category/delete/" <> tshow categoryId

instance CanRoute CategoriesController where
   parseRoute' = do
       let categories = do
           string "/categories"
           optional "/"
           endOfInput
           pure CategoriesAction

       let newCategory = do
           string "/category/new"
           optional "/"
           endOfInput
           pure NewCategoryAction

       let createCategory = do
           string "/category/create"
           optional "/"
           endOfInput
           pure CreateCategoryAction

       let showCategory = do
           string "/category/"
           categoryId <- parseId
           optional "/"
           endOfInput
           pure ShowCategoryAction { categoryId }

       let editCategory = do
           string "/category/edit/"
           categoryId <- parseId
           optional "/"
           endOfInput
           pure EditCategoryAction { categoryId }

       let updateCategory = do
           string "/category/update/"
           categoryId <- parseId
           optional "/"
           endOfInput
           pure UpdateCategoryAction { categoryId }

       let deleteCategory = do
           string "/category/delete/"
           categoryId <- parseId
           optional "/"
           endOfInput
           pure DeleteCategoryAction { categoryId }

       categories <|> newCategory <|> createCategory <|> showCategory <|> editCategory <|> updateCategory <|> deleteCategory


instance HasPath QuestionsController where
    pathTo QuestionsAction { categoryId } = "/category/" <> tshow categoryId <> "/questions"
    pathTo NewQuestionAction { categoryId } = "/category/" <> tshow categoryId <> "/question/new"
    pathTo CreateQuestionAction = "/question/create"
    pathTo ShowQuestionAction { questionId } = "/question/" <> tshow questionId
    pathTo EditQuestionAction { questionId } = "/question/edit/" <> tshow questionId
    pathTo UpdateQuestionAction { questionId } = "/question/update/" <> tshow questionId
    pathTo DeleteQuestionAction { questionId } = "/question/delete/" <> tshow questionId

instance CanRoute QuestionsController where
   parseRoute' = do
       let categoryQuestions = do
           string "/category/"
           categoryId <- parseId
           string "/questions"
           optional "/"
           endOfInput
           pure QuestionsAction { categoryId }

       let newQuestion = do
           string "/category/"
           categoryId <- parseId
           string "/question/new"
           optional "/"
           endOfInput
           pure NewQuestionAction { categoryId }

       let createQuestion = do
           string "/question/create"
           optional "/"
           endOfInput
           pure CreateQuestionAction

       let showQuestion = do
           string "/question/"
           questionId <- parseId
           optional "/"
           endOfInput
           pure ShowQuestionAction { questionId }

       let editQuestion = do
           string "/question/edit/"
           questionId <- parseId
           optional "/"
           endOfInput
           pure EditQuestionAction { questionId }

       let updateQuestion = do
           string "/question/update/"
           questionId <- parseId
           optional "/"
           endOfInput
           pure UpdateQuestionAction { questionId }

       let deleteQuestion = do
           string "/question/delete/"
           questionId <- parseId
           optional "/"
           endOfInput
           pure DeleteQuestionAction { questionId }

       categoryQuestions <|> newQuestion <|> createQuestion <|> showQuestion <|> editQuestion <|> updateQuestion <|> deleteQuestion
