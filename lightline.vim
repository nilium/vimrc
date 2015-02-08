let g:lightline = {
\	'enable': {
\		'tabline': 0,
\	},
\	'active': {
\		'left': [
\			['mode', 'paste'],
\			['readonly', 'git-branch', 'fancy-path', 'modified'],
\		],
\		'right': [
\			['lineinfo'],
\			['fileencoding', 'filetype'],
\		],
\	},
\	'component': {
\		'lineinfo': ' %3l:%-2v',
\		'filebuf': '%f (%n)',
\	},
\	'component_function': {
\		'fancy-path': 'ShowFancyPath',
\		'readonly': 'ShowReadOnly',
\		'git-branch': 'ShowGitBranch',
\	},
\	'colorscheme': 'triplejelly',
\}

function! ShowReadOnly()
	return &readonly ? '⭤' : ''
endfunction

function! ShowGitBranch()
	if !exists('*fugitive#head')
		return ''
	endif

	let l:branch = fugitive#head()
	return strlen(l:branch) ? ''.l:branch : ''
endfunction

function! ShowFancyPath()
	" Comment out relpath usage for now since I haven't put that in a repo
	" on GitHub yet.
	"let l:path = system('relpath -nl=false -relative -base '.shellescape(getcwd()).' '.shellescape(expand('%p')).'')
	let l:path = fnamemodify(expand('%:p'), ':~:.')
	let l:buf = bufnr(expand('%'))
	return l:path.' ('.l:buf.')'
endfunction

if exists('g:loaded_lightline')
	try
		call lightline#init()
		call lightline#update()
	catch
	endtry
endif
