abbr -a e $EDITOR
abbr -a c cargo
abbr -a ct cargo test
abbr -a g git
abbr -a ga 'git add -p'
abbr -a gd 'git diff'
abbr -a gs 'git status'

if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end
