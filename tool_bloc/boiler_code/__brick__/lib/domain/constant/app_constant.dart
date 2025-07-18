
class AppConstant {
  static String tenantId = 'tenantId';
  static String name = 'Default Name';

  // Private constructor to prevent instantiation
  AppConstant._();

  // Static method to update tenantId (if needed)
  static void setTenantId(String newTenantId) {
    tenantId = newTenantId;
  }
}
