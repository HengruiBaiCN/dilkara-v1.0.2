import 'package:oauth1/oauth1.dart';

var signatureMethod = SignatureMethods.hmacSha1;

final clientCredentials = new ClientCredentials(
  "ck_5548abde185d8a83fa7781e7c6bce5459f52616c",
  "cs_6ae6830cba04c992ed7bf63ed36f5d1015661015",
);

final oauth1Client = new Client(
  signatureMethod,
  clientCredentials,
  "http://dilkara.com.au/wc-api/v3/" as Credentials, // WooCommerce API URL
);

class WooCommerceService {
  final ClientCredentials credentials;

  WooCommerceService(this.credentials);

  Client createOAuthClient() {
    return Client(
      credentials as SignatureMethod,
      "http://your-woocommerce-site.com/wc-api/v3/" as ClientCredentials,
      credentials as Credentials,
    );
  }
}
