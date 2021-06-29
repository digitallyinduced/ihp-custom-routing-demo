module Web.View.Questions.Index where
import Web.View.Prelude

data IndexView = IndexView { questions :: [Question], category :: Category }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CategoriesAction}>Categories</a></li>
                <li class="breadcrumb-item active"><a href={QuestionsAction (get #id category)}>Questions</a></li>
            </ol>
        </nav>
        <h1>Questions <a href={pathTo $ NewQuestionAction (get #id category)} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach questions renderQuestion}</tbody>
            </table>
        </div>
    |]

renderQuestion :: Question -> Html
renderQuestion question = [hsx|
    <tr>
        <td>{get #title question}</td>
        <td><a href={ShowQuestionAction (get #id question)}>Show</a></td>
        <td><a href={EditQuestionAction (get #id question)} class="text-muted">Edit</a></td>
        <td><a href={DeleteQuestionAction (get #id question)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
