module Web.View.Questions.Edit where
import Web.View.Prelude

data EditView = EditView { question :: Question }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={QuestionsAction (get #categoryId question)}>Questions</a></li>
                <li class="breadcrumb-item active">Edit Question</li>
            </ol>
        </nav>
        <h1>Edit Question</h1>
        {renderForm question}
    |]

renderForm :: Question -> Html
renderForm question = formFor' question (pathTo $ UpdateQuestionAction (get #id question)) [hsx|
    {(hiddenField #categoryId)}

    {(textField #title)}
    {(textareaField #description)}
    {submitButton}
|]
