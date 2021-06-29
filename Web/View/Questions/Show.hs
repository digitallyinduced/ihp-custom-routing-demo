module Web.View.Questions.Show where
import Web.View.Prelude

data ShowView = ShowView { question :: Question }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={QuestionsAction (get #categoryId question)}>Questions</a></li>
                <li class="breadcrumb-item active">Question</li>
            </ol>
        </nav>
        <h1>Question</h1>
        <p>{get #title question}</p>
        <p>{get #description question}</p>
    |]
