package board;

public class BoardBean {
	
	private int num;
	private String name;//게시물 작성자 변수
	private String subject;//게시물 제목 변수
	private String content; //게시물 본문 변수  
	private int pos; //게시물 상대적인 위치값 변수
	private int depth; //게시물 답글 의 깊이 변수
	private int ref; //게시물이 답글 일 경우 부모 글 번호 변수
	private String regdate; //게시물 작성 날짜 변수
	private String pass; //게시물 패스워드 변수
	private int count; //게시물 조회수 변수
	private String filename; //게시물 업로드 파일 이름 변수
	private int filesize; //게시물 업로드 파일 크기 변수

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

}
