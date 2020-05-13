# TestTask
Test Task for FaiFly company.

This file contains short overview of the project.

Initial task: Write an application which represents articles from NY Times usinmg their API: https://developer.nytimes.com/docs/articlesearch-product/1/overview
- The first screen must represent the menu to choose the category, regarding which articles must be presented. (categories are on the API page, a few must be picked)
- Second screen must be the list of articles. By clicking on article the third screen must show it.
- Dates in search and other API parameters are on executer's choise.

The results:
The application consists of 3 screen views:
1. First screen which appears when application is launched. On this screen there are 5 buttons with category names on them. By pressing any of these buttons the second screen will be shown with results of news from New Yourk Times site from selected category.
2. Second view consists of list of news related to the chosen category. Only 10 news are shown on the second screen at a time. To see another 10 news button "10 Results ->" must be pressed. To see any of the news from the list the row consisting the news must be chosen.
3. Third screen shows the news selected from previouse screen. Third screen was buit from SFSafariViewController class. This class was chosen for simplisity and time saving. For custom screen showing WebKit set can be used.

All the libraries used in project are pretty standard: 
1. UIKit - standard swift library for UI. It was used because SwiftUI library is quit new and can only be used from 13(or 12) version of ios.
2. UITableViewCell class was used to create custom cells for table which shows results from the site in table view.
3. UiViewController in conjunction with UITableViewDataSourse and UITableViewDelegate extention were used to create viewcontroller class to construct and show the table with search results.


Buttons on the first screen instead of search function or dropdown list were used for time saving.

