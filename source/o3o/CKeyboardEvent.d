//
// o3o runtime / CKeyboardEvent.d
//   - 키보드 이벤트 컴포넌트
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.CKeyboardEvent;
import std.stdio;

import o3o.IComponent;    // 공통부 컴포넌트
import o3o.ULog;          // 로그 유틸리티

import derelict.sdl2.sdl; // SDL2 레벨

/**
 * CKeyboardEvent 클래스
 *   - 화면에 그리는 기능을 가지는 컴포넌트
 */
class CKeyboardEvent: IEventComponent{    
    /**
     * 생성자
     */
    this(){
        // 디버그 메세지(초기화 완료됬다)
        debug{
            ulog("CKeyboardEvent(Init)");
        }
    }

    /**
     * 업데이트
     */
    void update(SDL_Event e){
        writeln("CKeyboardEvent Update");
    }
}