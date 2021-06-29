module Web.Controller.Questions where

import Web.Controller.Prelude
import Web.View.Questions.Index
import Web.View.Questions.New
import Web.View.Questions.Edit
import Web.View.Questions.Show

instance Controller QuestionsController where
    action QuestionsAction { categoryId } = do
        category <- fetch categoryId
        questions <-
            query @Question
                |> filterWhere (#categoryId, get #id category)
                |> fetch
        render IndexView { .. }

    action NewQuestionAction { categoryId } = do
        let question = newRecord |> set #categoryId categoryId
        render NewView { .. }

    action ShowQuestionAction { questionId } = do
        question <- fetch questionId
        render ShowView { .. }

    action EditQuestionAction { questionId } = do
        question <- fetch questionId
        render EditView { .. }

    action UpdateQuestionAction { questionId } = do
        question <- fetch questionId
        question
            |> buildQuestion
            |> ifValid \case
                Left question -> render EditView { .. }
                Right question -> do
                    question <- question |> updateRecord
                    setSuccessMessage "Question updated"
                    redirectTo EditQuestionAction { .. }

    action CreateQuestionAction = do
        let question = newRecord @Question
        question
            |> buildQuestion
            |> ifValid \case
                Left question -> render NewView { .. }
                Right question -> do
                    question <- question |> createRecord
                    setSuccessMessage "Question created"
                    redirectTo $ QuestionsAction (get #categoryId question)

    action DeleteQuestionAction { questionId } = do
        question <- fetch questionId
        deleteRecord question
        setSuccessMessage "Question deleted"
        redirectTo $ QuestionsAction (get #categoryId question)

buildQuestion question = question
    |> fill @["title","description","categoryId"]
