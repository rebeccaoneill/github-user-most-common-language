import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['results']

  connect() {
    console.log(this.resultsTarget);
  }

  search(event) {
    event.preventDefault();
    // prevent the page reloading when form is submitted
    const member = this.element.querySelector('#member').value;

    if(!member){
      this.resultsTarget.innerHTML =
      `<div class='errors-container'>
        <p> error: username cannot be blank </p>
      </div>`;
      return;
    }
    // Above code handles  case when user tries to submit blank form and exits function early

    // Below code is to fetch data from the API without having to reload the page
    fetch(`/git_hub/search?member=${member}`, {
      method: 'GET',
      headers: {'Accept': 'application/json' // expects a JSON response
      }
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      if(data.language === null || data.language === 'none') {
        this.resultsTarget.innerHTML =
         `<div class='errors-container'>
            <p>
              It doesn't look like the GitHub user:
              <a href="${data.profile_url}">${member}</a>
              has any public respositories.
            </p>
          </div>`;
      } else{
      this.resultsTarget.innerHTML =
      `<div class='results-container'>
        <div class='user-info'>
          <img src="${data.image_url}" alt="user-avatar">
          <p>
            ${data.name}'s most used language is <strong>${data.language}</strong>
          </p>
       </div>
        <p id='link-text'>
            Check out their profile <a href="${data.profile_url}"> here </a>
        </p>
      </div>`;
      }
  })
  .catch((error) => {
    console.error('Error:', error);
    this.resultsTarget.innerHTML =
    `<div class='errors-container'>
      <p> There doesn't appear to be a GitHub user "${member}" please try another username.</p>
    </div>`;
  });
  }
}
