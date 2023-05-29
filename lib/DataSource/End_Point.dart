const baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/';
const apiKey = 'sjWPTZ1Q9Cw2EoYbnh5Da1FB8vIX2dgK';
String fullUrl({required String type}) {
  return 'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=$type&api-key=sjWPTZ1Q9Cw2EoYbnh5Da1FB8vIX2dgK';
  //https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=sjWPTZ1Q9Cw2EoYbnh5Da1FB8vIX2dgK
}

const viewedUrl =
    'https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=sjWPTZ1Q9Cw2EoYbnh5Da1FB8vIX2dgK';
const emailedUrl =
    'https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=sjWPTZ1Q9Cw2EoYbnh5Da1FB8vIX2dgK';
const sharedUrl =
    'https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=sjWPTZ1Q9Cw2EoYbnh5Da1FB8vIX2dgK';
