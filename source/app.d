//
// o3o runtime / app.d
//   - 게임 시작점
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//
import std.stdio;
import o3o.SGame;

void main()
{
	// 릴리즈 빌드 인지, 디버그 빌드인 지 구분
	string mode = "release";
	debug{
		mode = "debug";
	}

	string line = "--------------------------------------------------";
	writeln(line);
	writeln("o3o runtime - ", mode);
	writeln(line);

	// 스타팅 포인트
	writeln("Shooting!");

	writeln(line);
	writeln("END");
	writeln(line);
}
