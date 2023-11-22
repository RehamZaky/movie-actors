

const String baseUrl = 'https://api.themoviedb.org/3/person/popular';

const String apiKey = 'a94b7260527e30d53e71d6e1d4daced2';
const String apiAccessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOTRiNzI2MDUyN2UzMGQ1M2U3MWQ2ZTFkNGRhY2VkMiIsInN1YiI6IjY1NWNlNDQ0YjU0MDAyMTRkODJlZjQ4OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.O3FmrYgXIuHUcpp-X_moGpodpkbIOKki8hQLocq1AP8';

//Static Headers
const Map<String, String> apiHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json, text/plain, */*',
  'X-Requested-With': 'XMLHttpRequest',
  'Access-Token': apiAccessToken
};
