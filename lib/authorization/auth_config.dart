const String AUTH_DOMAIN = 'http://localhost:9098'; // without `/realms/...`
const String REALM = 'proj-main';
const String CLIENT_ID = 'bsn'; // client_id from Keycloak
const String REDIRECT_URI = 'com.example.behealthyproject:/oauthredirect';
const String ISSUER = 'http://localhost:9098/realms/proj-main';
const String DISCOVERY_URL = '$ISSUER/.well-known/openid-configuration';
