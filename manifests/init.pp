class tmux {
	require repos::ius
	package {'tmux':
		ensure => absent,
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
