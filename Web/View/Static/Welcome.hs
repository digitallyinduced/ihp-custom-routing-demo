module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <h1>
            <a href={CategoriesAction}>Categories</a>
        </h1>
    |]
