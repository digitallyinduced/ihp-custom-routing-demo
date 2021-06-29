module Web.View.Questions.New where
import Web.View.Prelude

data NewView = NewView { question :: Question }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={QuestionsAction (get #categoryId question)}>Questions</a></li>
                <li class="breadcrumb-item active">New Question</li>
            </ol>
        </nav>
        <h1>New Question</h1>
        {renderForm question}
    |]

renderForm :: Question -> Html
renderForm question = formFor' question (pathTo CreateQuestionAction) [hsx|
    {(hiddenField #categoryId)}

    {(textField #title)}
    {(textareaField #description)}
    {submitButton}
|]
