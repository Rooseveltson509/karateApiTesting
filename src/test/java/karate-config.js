function fn() {
  var env = karate.env
  if (!env) {
      env = 'test';
    }

      var config = {
        web: {
          navigateur: {type: 'chrome'},
          baseUrl: 'https://reqres.in/api',
          name: 'Rooseveltson'
        }
      }

    if (env == 'qa') {
        config.baseUrl = "https://reqres.in/api/qa"
    }
    else if (env == 'dev') {
        config.baseUrl = "https://reqres.in/api/dev"
    }
    else {
        config.baseUrl = "https://reqres.in/api"
    }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  karate.log('The value of env is : ', env)
  karate.configure('report', { showLog: true, showAllSteps: false } );
  karate.log('environnement utilisé pour ce test :', env);
  return config;
};
