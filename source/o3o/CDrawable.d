//
// o3o runtime / CDrawable.d
//   - 그릴 수 있는 컴포넌트
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.window;
import std.stdio;

import o3o.IComponent;    // 공통부 컴포넌트
import o3o.ULog;          // 로그 유틸리티

import derelict.sdl2.sdl; // SDL2 레벨

/**
 * Drawable 클래스
 *   - 화면에 그리는 기능을 가지는 컴포넌트
 */
class CDrawable: IComponent{
    private int       x;
    private int       y;
    private string name;
    
    /**
    * 생성자
    * params:
    *   com_name: 컴포넌트명
    */
    this(string com_name){
        // 위치 값 모두 초기화
        this.x = 0;
        this.y = 0;
        
        // 컴포넌트명 초기화
        this.name = com_name;
        
        // 디버그 메세지(초기화 완료됬다)
        debug{
            ulog("CDrawable(Init): "~com_name);
        }
    }

    /**
    * 업데이트
    * params:
    * 
    */
    void update(){
        writeln("Update");
    }
}