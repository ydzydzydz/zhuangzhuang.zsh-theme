. ~/.zshrc

case $1 in
	("FG")
		spectrum_ls;;
	("BG")
		spectrum_bls;;
	(*)
		echo $0 '[ FG|BG ]'
		exit 1
esac
