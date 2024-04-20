import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:unsplash_client/unsplash_client.dart';

class UnsplashService {
  final UnsplashClient unsplash;

  UnsplashService()
    : unsplash = UnsplashClient(
        settings: const ClientSettings(
          credentials: AppCredentials(
            accessKey: 'q52zf5XUMAodW4o38gUa-TOoLP7EW0TAKks1jzHbh8M',
            secretKey: 'h0A8JuQQL_Up9r2AcZuEGqRv0JMfghXIJzlXWkDQFUU',
          ),
        ),
      );

  Future<String?> getReferencePhoto(String query) async {
    try {
      final page = await unsplash.search.photos(
        query,
        page: 1,
        perPage: 10,
      ).goAndGet();

      if (page.results.isNotEmpty) {
        return page.results.first.urls.full.toString();
      }
      return null;
    } catch (e) {
      displayErrorToast(e);
      return null;
    }
  }
}