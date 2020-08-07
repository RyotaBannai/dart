void main() {
  const Object i = 3;
  const list = [i as int];
  const map = {if (i is int) i: int}; // {3: int}
  const _set = {if (list is List<int>) ...list}; // {3}
  print(map);
  print(_set);
}
