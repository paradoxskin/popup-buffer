func s:Getbf()
	redir => dl
	silent ls
	redir END
	let s:ldl=split(dl,'\n')
	let s:fl=[]
	let s:info=""
	for i in s:ldl
		let s:tmp=split(i)
		let s:flag=0
		for j in s:tmp[1]
			if j=='%'
				let s:flag=1
			endif
		endfor
		if s:flag==1
			let s:info..='*'
		else
			let s:info..=' '
		endif
		if s:tmp[2]=="+"
			let s:info..=split(s:tmp[3][1:-2],'/')[-1].."+"
		else
			let s:info..=split(s:tmp[2][1:-2],'/')[-1].." "
		endif
		let s:info..="|"
	endfor
	return s:info
endfunc
func Showbf(tm)
	call popup_clear()
	call popup_create(s:Getbf(),#{line:33,col:1,time:a:tm,highlight:"ModeMsg"})
endfunc
