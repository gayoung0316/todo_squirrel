class NaveItem {
  final int id;
  final String icon;

  NaveItem({
    required this.id,
    required this.icon,
  });
}

List<NaveItem> naveItens = [
  NaveItem(id: 0, icon: "assets/icons/calender.png"),
  NaveItem(id: 1, icon: "assets/icons/failure-goal.png"),
  NaveItem(id: 2, icon: "assets/icons/failure-goal.png"),
  NaveItem(id: 3, icon: "assets/icons/success-goal.png"),
  NaveItem(id: 4, icon: "assets/icons/setting.png"),
];
