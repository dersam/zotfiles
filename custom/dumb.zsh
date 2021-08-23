# Dumb stuff that doesn't belong anywhere else.

weather () {
  curl wttr.in/$1
}

internet! () {
	ping -c 2 google.com
}

# From https://twitter.com/climagic/status/370595711483514880
# Example: git push origin master -f || fliptable
fliptable()
{
	echo "（╯°□°）╯ ┻━┻";
}

ultraflip()
{
	echo " ┻━┻ ︵╰(°□°)╯︵ ┻━┻";
}

# From Kenorb


#http://www.paradox.io/posts/9-my-new-zsh-prompt
function calc_elapsed_time() {
	local timer_result=$1
  if [[ $timer_result -ge 3600 ]]; then
    let "timer_hours = $timer_result / 3600"
    let "remainder = $timer_result % 3600"
    let "timer_minutes = $remainder / 60"
    let "timer_seconds = $remainder % 60"
    print -P "%B%F{yellow}${timer_hours}h${timer_minutes}m${timer_seconds}s%b"
  elif [[ $timer_result -ge 60 ]]; then
    let "timer_minutes = $timer_result / 60"
    let "timer_seconds = $timer_result % 60"
    print -P "%B%F{yellow}${timer_minutes}m${timer_seconds}s%b"
  elif [[ $timer_result -gt 10 ]]; then
    print -P "%B%F{yellow}${timer_result}s%b"
  fi
}
