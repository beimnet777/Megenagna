abstract class BottomNavEvents {}

class BarItemChanged extends BottomNavEvents {
  final int index;

  BarItemChanged(this.index);
}
