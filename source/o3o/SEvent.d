//
// o3o runtime / SEvent.d
//   - 게임의 시스템에 대한 이벤트핸들링 서비스
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.SEvent;
import std.stdio;
import std.string;

import o3o.Xdl;
import o3o.ULog;
import derelict.sdl2.sdl;

/**
 * SEvent 클래스
 *   - 게임 시스템의 이벤트 핸들링 서비스
 */
class SEvent{
    private XDLScreen s;
    /**
     * 생성자
     */
    this(ref XDLScreen screen_obj){
        this.s = screen_obj;
    }

    /**
     * 업데이트
     */
    void update(SDL_Event e){
        SDL_PollEvent(&e);

        if(e.type == SDL_QUIT){
            s.exit();
        }
    }
}