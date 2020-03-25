
 
import 'package:firebase_admob/firebase_admob.dart';
const String testDevices = "mobile_id";

class MyAdmob{
  final String appId = "appId";

  
 
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      // testDevices: testDevices != null ? <String>[testDevices] : null,
      testDevices: null,
      keywords: <String>['news', 'health', 'cure', 'fitness','virus', 'corona virus disease'],
      nonPersonalizedAds: true,
  );


  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

   NativeAd createNativeAd() {
    return NativeAd(
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("$NativeAd event $event");
      },
    );
  }



}


 