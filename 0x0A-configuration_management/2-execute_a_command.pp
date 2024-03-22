# kills a process named killmenow

exec { 'kill_process_killmenow':
  command => '/usr/bin/pkill -f killmenow'
} 
