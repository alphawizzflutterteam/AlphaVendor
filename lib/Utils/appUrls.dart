// ignore_for_file: file_names
class AppUrl {
  static const baseURL = "https://alpha-ecom.developmentalphawizz.com/api/v2/";
  static const baseURL1 = "https://alpha-ecom.developmentalphawizz.com/api/v2/";

  static const apitoken = '';

  static String sendLoginOtp = "${baseURL}auth/send-login-otp";
  static String sendRegisterOtp = "${baseURL}auth/send-otp";
  static String loginWithEmailPassword = "${baseURL}auth/login";
  static String register = "${baseURL}auth/register";
  static String updatePassword = "${baseURL}auth/update-password";
  static String resetPassword = "${baseURL}customer/reset-password";
  static String getSellerDashboard = "${baseURL1}seller/dashboard";

  static String getProfile = "${baseURL}customer/info";
  static String updateProfile = "${baseURL}customer/update-profile";

  static String languages = "${baseURL}languages";
  static String currencies = "${baseURL}currencies";

  static String brands = "${baseURL}brands";
  static String specialOffers = "${baseURL}offers/special-offers";
  static String dailyDeals = "${baseURL}deal-of-the-day";
  static String productsList = "${baseURL}products";
  static String categories = "${baseURL}categories";
  static String banners = "${baseURL}banners?banner_type=";

  static String wishlist = "${baseURL}customer/wish-list";

  static String addToWishlist = "${baseURL}customer/wish-list/add";
  static String removeFromWishlist = "${baseURL}customer/wish-list/remove";

  static String cartList = "${baseURL}cart?coupan=";

  static String addToCart = "${baseURL}cart/add";
  static String removeFromCart = "${baseURL}cart/remove";
  static String updateCart = "${baseURL}cart/update";
  static String applyCoupon = "${baseURL}coupon/apply?code=";
  static String placeOrder = "${baseURL}customer/order/place?";

  static String savedList = "${baseURL}customer/save-list";
  static String addToSaveLater = "${baseURL}customer/save-list/add";
  static String removeFromSaveLater = "${baseURL}customer/save-list/remove";

  static String couponList = "${baseURL}coupon";

  static String vendorList = "${baseURL}seller/all";

  static String addressList = "${baseURL}customer/address/list";
  static String addAddressList = "${baseURL}customer/address/add";
  static String updateAddressList = "${baseURL}customer/address/update";
  static String deleteAddress = "${baseURL}customer/address?address_id=";

  static String contactForm = "${baseURL}contact/store";
//Vendor
  static const String loginOtp = "${baseURL}seller/login-otp";
  static const String productMgmt = "${baseURL}seller/product-management";
  static const String productList = "${baseURL}seller/products/list";
  static const String categoriesList = "${baseURL}seller/get-categories";
  static const String brandList = "${baseURL}seller/brands";
  static const String imageUpload = "${baseURL}seller/products/upload-images";
  static const String addProduct = "${baseURL}seller/products/add";
  static const String dashboardData = "${baseURL}seller/dashboard";
  static const String orderList = "${baseURL}seller/orders/list";
  static const String productDetailAndedit = "${baseURL}seller/products/edit/";
  static const String statusUpdate = "${baseURL}seller/products/status-update";
}
