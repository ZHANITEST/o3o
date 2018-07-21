//
// o3o runtime / ULog.d
//   - 로그 유틸리티
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.ULog;
import std.stdio;

/**
 * ulog 함수
 * params:
 *   msg = 기록할 메세지 내용
 */
void ulog(string msg){
    writeln(msg);
}