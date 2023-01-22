func s:Getbf()
	redir => dl
	silent ls
	redir END
	let s:ldl=split(dl,'\n')
	let s:fl=[]
	let s:info=""
	let s:before=""
	let s:after=""
	let s:flag=0
	for i in s:ldl
		let s:tmp=split(i)
		let s:splt='/'
		let s:curfile=0
		if has('win32')
			let s:splt='\'
		endif
		for j in s:tmp[1]
			if j=='%'
				let s:flag=1
				let s:curfile=1
				break
			endif
		endfor
		if s:curfile==1
			continue
		endif
		if s:tmp[2]=="+"
			if s:flag==0
				let s:before..=" "..split(s:tmp[3][1:-2],s:splt)[-1].."+|"
			else
				let s:after..=" "..split(s:tmp[3][1:-2],s:splt)[-1].."+|"
			endif
		else
			if s:flag==0
				let s:before..=" "..split(s:tmp[2][1:-2],s:splt)[-1].." |"
			else
				let s:after..=" "..split(s:tmp[2][1:-2],s:splt)[-1].." |"
			endif
		endif
	endfor
	return s:after..s:before
endfunc
func Showbf(tm)
	call popup_clear()
	call popup_create(s:Getbf(),#{line:winheight(0),col:1,time:a:tm,highlight:"ModeMsg"})
endfunc
