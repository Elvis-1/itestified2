import 'package:itestified/src/features/profile/data/profile_api.dart';

abstract class DonationService {}

class DonationServicesImp implements DonationService {
  ProfileApi profileApi;
  DonationServicesImp(this.profileApi);
}
