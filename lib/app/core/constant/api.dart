const baseUrl = "https://7a12-180-248-25-210.ngrok-free.app/";

const loginUrl = "${baseUrl}api/login";
const registerUrl = "${baseUrl}api/register";

//get all and create company
const companyUrl = "${baseUrl}api/companies";

String companyByIdUrl(int id) => "${baseUrl}api/companies/${id}";

const teamUrl = "${baseUrl}api/teams";

String teamByIdUrl(int id) => "${baseUrl}api/teams/${id}";
