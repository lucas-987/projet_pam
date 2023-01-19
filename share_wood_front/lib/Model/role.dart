enum Role {ADMIN,USER}

class RoleFunc{


  static Role fromString(String role) {
    switch (role) {
      case 'ADMIN':
        return Role.ADMIN;
      case 'USER':
        return Role.USER;
      default:
        throw Exception('Invalid role: $role');
    }
  }
}
