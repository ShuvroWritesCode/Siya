String convertTime(String mins) {
  if (mins.length == 1) {
    return "0$mins";
  } else {
    return mins;
  }
}
