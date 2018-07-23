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
alias XDL_Delay           = SDL_Delay;
alias XDL_Surface         = SDL_Surface;
alias XDL_Quit            = SDL_Quit;
alias XDL_DestroyWindow   = SDL_DestroyWindow;
alias XDL_DestroyRenderer = SDL_DestroyRenderer;