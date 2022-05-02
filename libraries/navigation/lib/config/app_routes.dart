import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'route_handlers.dart';

class Routes {
  static String root = "/";
  static String signIn = "/signIn";
  static String customMenu = "/customMenu";
  static String locationOption = "/locationOption";
  static String home = "/home";
  static String movieDetailPage = "/movieDetailPage";
  static String signUp = "/signUp";
  static String phoneVerification = "/phoneVerification";
  static String infoDialog = "/info_dialog";
  static String termsAndCondition = "/termsAndCondition";
  static String forgotPasswordEmail = "/forgotPasswordEmail";
  static String forgotPasswordPhone = "/forgotPasswordPhone";
  static String paymentMethods = "/paymentMethods";
  static String resetPassword = "/resetPassword";
  static String orderDetail = "/orderDetail";
  static String orderSuccess = "/orderSuccess";
  static String orderError = "/orderError";
  static String profile = "/profile";
  static String editProfile = "/editProfile";

  static String superMarket = "/superMarket";
  static String addNewCard = "/addNewCard";
  static String orderPayment = "/orderPayment";
  static String trackOrder = "/trackOrder";

  static String cardDetail = "/cardDetail";

  static String manageAddress = "/manageAddress";
  static String addNewAddress = "/addNewAddress";
  static String referYourFriend = "/referYourFriend";

  static String myOrders = "/myOrders";
  static String settings = "/settings";

  static String privacyPolicy = "/privacyPolicy";

  static String storeDashBoard = "/superMarket/storedashboard/";
  static String superMakretDetails =
      "/superMarket/storedashboard/superMarketdetails/";
  static String productDetails = "/productDetails";
  static String subCategoryProductDetails =
      "/superMarket/storedashboard/superMarketdetails/productDetails/";

  static String checkOut = "/checkout";
  static String confirmOrder = "/confirmOrder/";
  static String filteredProducts = "/filteredProducts";
  static String helpCenter = "/helpCenter";
  static String searchProducts = 'searchProducts';
  static String rateOrder = '/rateOrder';
  static String favoriteProducts = '/favoriteProducts';
  static String orderCheckOut = '/orderCheckOutPage';
  static String mapAddress = '/mapAddress';
  static String addressDetails = '/addressDetails';
  static String wallet = '/wallet';
  static String imagePreviewer = '/imagePreview';

  static String restaurantsDetail = '/restaurants/restaurantsDetail';
  static String restaurantSearch = '/restaurants/restaurantSearch';
  static String categoriesGlobalSearch = '/categories/globalSearch';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});
    router.define(root,
        handler: watchHandler, transitionType: TransitionType.inFromLeft);
    router.define(movieDetailPage + "/:movieId",
        handler: movieDetailHandler,
        transitionType: TransitionType.inFromLeft);
  }
}
