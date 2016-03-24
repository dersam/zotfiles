crunch () {
  case $1 in
    png)
      pngquant --ext=-optimized.png --quality=40-60 *.png
      ;;
    *)
      echo "$1 is not a valid option"
  esac
}
