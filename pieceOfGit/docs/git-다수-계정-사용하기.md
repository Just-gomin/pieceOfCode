# 💡 Git 다수 계정 사용하기

#git/config

## 📌 1. 각각의 Git 운영 서비스(Github, Git Lab 등)에 SSH 키 등록

## 📌 2. `~/.gitconfigs` 란 디렉토리를 생성하고 해당 디렉토리 하부에 다음과 같이 사용하고 싶은 git config를 등록해준다.

```text
[user]
	name = 안강민
	email = dev0gomgom@gmail.com
```

## 📌 3. `~/.gitconfig` 에서 다음과 같이 분기 처리 설정을 추가한다.

```text
[includeIf "gitdir:~/sources/projects"]
	path = ~/.gitconfigs/personal/.gitconfig
[includeIf "gitdir:~/sources/study"]
	path = ~/.gitconfigs/personal/.gitconfig
[includeIf "gitdir:~/source/"]
	path = ~/.gitconfigs/fatos/.gitconfig
[includeIf "gitdir:~/sources/works/dgdr"]
	path = ~/.gitconfigs/dgdr/.gitconfig	
```
