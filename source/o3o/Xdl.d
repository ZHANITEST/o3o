//
// o3o runtime / Xdl.d
//   - SDL2 로우레벨 레이어
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.Xdl;
import std.string;

import o3o.UConfig;
import derelict.sdl2.sdl;

/**
 * XDLScreen 오브젝트
 *   - SDL_Window/SDL_Renderer의 통합 오브젝트
 *   - 실험적인 오브젝트라 미적용 가능성 있음
 */
deprecated class XDLScreen{
    private SDL_Window*   win; /// SDL_Window   구조체
    private SDL_Renderer* ren; /// SDL_Renderer 구조체
    private bool          ext; /// 게임 종료상태

    /**
     * 생성자(비활성-일단보류)
     * params:
     *  - string title: 게임 타이틀
     *  - int width   : 가로
     *  - int height  : 세로
     */
    //this(string title, int width, int height){
    //      this.this(title, width, height);
    //    );
    //}

    /**
     * 생성자
     * params:
     *  - UConfig cfg_obj: 설정 오브젝트
     */
    this(UConfig cfg_obj){
        // SDL2 초기화
        XDL_Init();
        
        // 윈도우 생성
        this.win = XDL_CreateWindow(
            cfg_obj, SDL_WINDOW_SHOWN
        );

        // 렌더러 생성
        this.ren = XDL_CreateRenderer(this.win);

        // 게임상태 변경
        this.ext = false;
    }

    /**
     * Clear 메서드
     * SDL_RendererClear 함수
     */
    void clear(){
        XDL_RenderClear(this.ren);
    }

    /**
     * getEvent 메서드
     * 이벤트 얻기
     */
    //int getEvent(ref SDL_Event* event){
    //    return SDL_PollEvent(event);
    //}

    /**
     * wait 메서드
     * 밀리세컨드 단위로 정지
     * params:
     *  - int how_long : 1000 = 1초 정지
     */
    void wait(int how_long){
        XDL_Delay(how_long);
    }

    /**
     * isExit 메서드
     * 어플리케이션이 종료 되었는가?
     * returns:
     *   - bool: 종료 라면 true, 아닐 경우 false
     */
    @property bool isExit(){
        return this.ext;
    }

    /**
     * exit 메서드
     * SDL2 어플리케이션 종료를 위해 상태변경
     */
    void exit(){
        this.ext = true;
    }
}

/**
 * XDL_Init 함수
 *   - SDL2 초기화 함수 간소화
 */
void XDL_Init(){
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Init(SDL_INIT_AUDIO);
}

/**
 * XDL_CreateWindow 함수
 *   - 게임타이틀이 들어가는 부분이 SDL2 레거시와 맞지 않아 래핑
 * params:
 *   UConfig cfg_obj: 설정파일 오브젝트
 *   SDL_WindowFlags: SDL2 레거시
 */
auto XDL_CreateWindow(UConfig cfg_obj, SDL_WindowFlags flags){
    /// 함수 다시 래핑한거라 리턴 쪽에 기존 SDL2 모듈명 모두 기입함
    return SDL_CreateWindow(
        cfg_obj.g("title").toStringz,
        SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,
        cfg_obj.getInt("x"),
        cfg_obj.getInt("y"),
        flags
    );
}

/**
 *XDL_CreateRenderer 함수
 *   - XDL_Window처럼 SDL2 레거시 래핑
 * params:
 *   SDL_Window win_obj: SDL2 Window값
 */
auto XDL_CreateRenderer(ref SDL_Window* win_obj){
    /// 함수 다시 래핑한거라 리턴 쪽에 기존 SDL2 모듈명 모두 기입함
    return SDL_CreateRenderer(win_obj,
        -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
}

/// ---------- 단순 래핑 부분 ---------------------------------------- 
/**
 * XDL_ 단순 alias
 */
alias XDL_Window          = SDL_Window;
alias XDL_Renderer        = SDL_Renderer;
alias XDL_RenderClear   = SDL_RenderClear;
alias XDL_Delay           = SDL_Delay;
alias XDL_Surface         = SDL_Surface;
alias XDL_Quit            = SDL_Quit;
alias XDL_DestroyWindow   = SDL_DestroyWindow;
alias XDL_DestroyRenderer = SDL_DestroyRenderer;