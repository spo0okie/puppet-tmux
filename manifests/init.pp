class tmux {
	require repos::ius
	exec {'tmux1_remove':
		command => 'yum remove tmux -y',
		onlyif  => 'rpm -qa |grep tmux && tmux -V |grep "tmux 1."',
		path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'
	} ->
	package {'tmux2':
		ensure => installed,
	} ->
	file {'/root/.tmux.conf':
		source => 'puppet:///modules/tmux/.tmux.conf',
		owner => 'root',
		mode => '0600'
	}
}
